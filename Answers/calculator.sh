#! /bin/bash 

## Functions 

# validating numerical inputs 
validate_num1(){ 
	re='^[0-9]+$'
	if ! [[ $num1 =~ $re ]]; then 
		echo "Your first number is invalid. Please run the script again." 
		exit 3
	fi 
}

validate_num2(){
	re='^[0-9]+$'
	if ! [[ $num2 =~ $re ]]; then 
		echo "Your second number is invalid. Please run this script again." 
		exit 3 
	fi 
} 

# validating operator
validate_operator() { 
	case "$operator" in 
		"+"|"-"|"/"|"*"|"%")
			: ;; 
		*) 
			echo "Invalid operator inputted. Please run this script again." 
			exit 3 
	esac
}

# detecting input 
detect_input() { 
	read -p "Please input your first number." num1 
	validate_num1 
	read -p "Please input your second number." num2 
	validate_num2 
	read -p "Please inpuit your desired operator." operator 
	validate_operator
}
# operation & output naming 
name_operation() { 
	case "$operator" in 
		"+") 
			operation='addition'
			output='sum'
			;; 
		"-")
			operation='subtraction' 
			output='difference'
			;; 
		"*") 
			operation='multiplication' 
			output='product' 
			;; 
		"/") 
			operation='division'
			output='quotient' 
			;; 
		"%") 
			operation='modulo'
			output='remainder'
			;;
	esac
}

# summarize input 
summarize_input() {
	echo "Your numbers are ${num1} and ${num2}. Your desired operation is ${operation}." 
} 

# calculate and print the output 
calculate_print_output() { 
	res=$((${num1} ${operator} ${num2})) 
	echo "The ${output} is ${res}."
}

## Main Body 
if (($# == 0)) ; then 
	echo "No arguments were entered. Please input them when prompted." 
	detect_input
	name_operation
	summarize_input
	calculate_print_output
elif (($# != 3)) ; then 
	echo "Incorrect number of arguments entered. Please respond to the prompts." 
	detect_input 
	name_operation
	summarize_input
	calculate_print_output
else 
	num1=${1}
	num2=${2}
	operator=${3}
	validate_num1
	validate_num2
	validate_operator
	name_operation
	summarize_input
	calculate_print_output
fi 

