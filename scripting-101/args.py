import argparse 
import requests 
from bs4 import BeautifulSoup
import lxml 
from pytrends.request import TrendReq
import pandas as pd
import configparser 

config = configparser.ConfigParser()
config.read('config.ini')

authorname = config['author']['name']
author_github = config['author']['github']

print(f'Author name: {authorname}')
print(f'Author github: {author_github}')

parser = argparse.ArgumentParser()
parser.add_argument('--source', help='reports/news/trends', default='reports')
parser.add_argument('--date', help='date for querying data')

args = parser.parse_args()


 

def parse_reports(date): 
    #print('https://rapidapi.com/axisbits-axisbits-default/api/covid-19-statistics/') 

    url = "https://covid-19-statistics.p.rapidapi.com/reports"

    querystring = {"iso":"PHL","date": date}

    headers = {
        "X-RapidAPI-Host": "covid-19-statistics.p.rapidapi.com",
        "X-RapidAPI-Key": "3e02117099mshe7d3fe11a9892a2p1f5e26jsnbb8e9a13823b"
    }

    response = requests.request("GET", url, headers=headers, params=querystring)
    print(response.text)

def parse_news(): 
    url = 'https://www.rappler.com/?s=covid'
    response = requests.get(url)

    soup = BeautifulSoup(response.text, 'lxml')
    # print(soup.prettify())
    
    articles = soup.find_all('div', class_='archive-article__content')
    for article in articles: 

        headline = article.find('h2')
        print(headline.text.strip())
        
        url = article.find('a')
        print(url.get('href'))
        
        date = article.find('time')
        print(date.text.strip())
        print()

def parse_trends(): 
    pytrends = TrendReq(hl='en-US', tz=360)

    ## use these to deliver the payload 
    # kw_list = ["Blockchain"]
    # pytrends.build_payload(kw_list, cat=0, timeframe='today 5-y', geo='', gprop='')

    df = pytrends.trending_searches(pn='philippines') # Japan
    print(df)




if args.source == 'reports': 
    #validate input - 2022, convert to YYYY-MM-DD
    year = args.date.split('-')[0]
    if year == '2022': 
        parse_reports(args.date)
    else: 
        print('Invalid year input.')
elif args.source == 'news': 
    parse_news()
elif args.source == 'trends': 
    parse_trends()
else: 
    print('Invalid source option.')
