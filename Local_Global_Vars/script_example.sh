#!/bin/bash
VAR_A=100
VAR_B=200
echo VAR_A=$VAR_A
echo VAR_B=$VAR_B
echo Nazwa Skryptu: $0
echo Ilość podanych argumentów: $#
echo Liczba Losowa: $RANDOM
echo Nazwa Użytkownika: $USER
echo Data i Czas uruchomienia skryptu: ${date}
echo Ilość Znaków Zmiennej VAR_A: ${#VAR_A}
echo "Zawartość Folderu:" & ls | cat