#!/bin/bash

# echo "Enter the first number: "
# read number1
# echo "Enter the second number: " 
# read number2

# read -p "Enter the operation (+, -, *): " operation

# if [ "$operation" = "+" ]; then
#     result=$(echo "$number1 + $number2" | bc)
#     echo "The sum is: $result"
# elif [ "$operation" = "-" ]; then
#     result=$(echo "$number1 - $number2" | bc)
#     echo "The difference is: $result"
# elif [ "$operation" = "*" ]; then
#     result=$(echo "$number1 * $number2" | bc)
#     echo "The product is: $result"
# else
#     echo "Invalid operation!"
# fi

read -p "Enter the first number: " number1
read -p "Enter the second number: " number2
read -p "Enter the operation (+, -, *): " operation

[ "$operation" = "+" ] && result=$(echo "$number1 + $number2" | bc) && echo "The sum is: $result" \
|| [ "$operation" = "-" ] && result=$(echo "$number1 - $number2" | bc) && echo "The difference is: $result" \
|| [ "$operation" = "*" ] && result=$(echo "$number1 * $number2" | bc) && echo "The product is: $result" \
|| echo "Invalid operation!"