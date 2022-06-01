#! /bin/bash 

echo "1. Show disk usage." 
echo "2. Show system uptime."
echo "3. Show the users logged into the system."
echo "What would you like to do? (Enter q to quit.)" 
read action

case $action in
    1) du ;; 
    2) uptime ;; 
    3) w ;; 
    q) echo "Goodbye!" 
        exit 1 ;; 
    *) echo "Invalid input" ;; 
esac 

