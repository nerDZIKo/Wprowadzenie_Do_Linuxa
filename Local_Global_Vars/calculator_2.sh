#!/bin/bash

echo "Enter the first number: "
read number1
echo "Enter the second number: " 
read number2

read -p "Enter the operation (+, -, *): " operation

if [ "$operation" = "+" ]; then
    result=$(echo "$number1 + $number2" | bc)
    echo "The sum is: $result"
elif [ "$operation" = "-" ]; then
    result=$(echo "$number1 - $number2" | bc)
    echo "The difference is: $result"
elif [ "$operation" = "*" ]; then
    result=$(echo "$number1 * $number2" | bc)
    echo "The product is: $result"
else
    echo "Invalid operation!"
fi