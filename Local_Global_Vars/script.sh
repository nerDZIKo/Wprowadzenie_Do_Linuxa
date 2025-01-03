#!/bin/bash

echo "Uruchamiam skrypt.sh"

echo VAR_A= $VAR_A
echo VAR_B= $VAR_B

VAR_A=100
export VAR_B=200

echo VAR_A= $VAR_A
echo VAR_B= $VAR_B
./script_2.sh