#!/bin/bash

read -p "Enter the first number: " number1
read -p "Enter the second number: " number2

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