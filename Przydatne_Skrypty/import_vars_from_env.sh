#!/bin/bash

# Załaduj zmienne środowiskowe z pliku .env
source .env

# Wyświetl wszystkie zmienne, które zostały załadowane
echo "Zmienne załadowane z .env:"
for var in $(compgen -v); do
  # Sprawdzamy, czy zmienna jest jedną z tych, które chcesz wyświetlić
  if [[ $var == VAR* ]]; then
    echo "$var=${!var}"
  fi
done
