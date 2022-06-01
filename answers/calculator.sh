#!/bin/bash

case $3 in
+)
echo "The numbers are $1 and $2 and the operation is addition."
echo "The sum is `expr $1 + $2`."
;;
-)
echo "The numbers are $1 and $2 and the operation is subtraction."
echo "The sum is `expr $1 - $2`."
;;
\*)
echo "The numbers are $1 and $2 and the operation is multiplication."
echo "The sum is `expr $1 * $2`."
;;
\/)
echo "The numbers are $1 and $2 and the operation is division."
echo "The sum is `expr $1 / $2`."
;;
*)
echo "No arguments provided, please provide them at the prompt below!"
read -p 'Please enter the first number: ' NUMBER1
read -p 'Please enter the second number: ' NUMBER2
read -p 'Please enter the operator: ' operator
	case ${operator} in
	+)
	echo "The numbers are ${NUMBER1} and ${NUMBER2} and the operation is addition."
	echo "The sum is `expr ${NUMBER1} + ${NUMBER2}`."
	;;
	-)
	echo "The numbers are ${NUMBER1} and ${NUMBER2} and the operation is subtraction."
	echo "The sum is `expr ${NUMBER1} - ${NUMBER2}`."
	;;
	\*)
	echo "The numbers are ${NUMBER1} and ${NUMBER2} and the operation is multiplication."
	echo "The sum is `expr ${NUMBER1} * ${NUMBER2}`."
	;;
	\/)
	echo "The numbers are ${NUMBER1} and ${NUMBER2} and the operation is division."
	echo "The sum is `expr ${NUMBER1} / ${NUMBER2}`."
	esac
esac
