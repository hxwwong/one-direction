#! /bin/bash

## Functions 



## Body 
# check if input is 2-10 pos args long 
if (($# > 10 || $# < 2)) ; then 
	echo "Incorrect number of arguments. Please ensure there is a minimum of 2, and a maximum of 10 numbers inputetd positionally." 
	exit 3 
fi
 
# check for validity, and compute biggest number 
re='^[0-9]+$'
ctr=0
for i   
do
       if ! [[ $i =~ $re ]] ; then
		echo "The input $i is not a valid number. Please run the script again." 
		exit 3
       elif (($i > 10 || $i < 0)); then 
	       echo "The number $i is out of range. Please run the script again." 
	       exit 3 
       else 
		if (($i > $ctr)); then 
	 		ctr=$i		
		fi
       fi        
done 	

# output the list of numbers inputted echo "The numbers are: ${1..$#} "
echo "The sequence of numbers is: $@"
# output the biggest number
echo "The largest number is: ${ctr}." 
