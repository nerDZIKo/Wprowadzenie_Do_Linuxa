#!/bin/bash

# Załaduj zmienne środowiskowe z pliku .bashrc
source ~/.bashrc

# Załaduj zmienne środowiskowe z pliku .env
source .env

# Przykład: Wyświetlanie komunikatów informacyjnych i błędów
echo "To jest komunikat informacyjny"
echo "To jest komunikat błędu" >&2  # Wysyła komunikat na standardowe wyjście błędów (stderr)

# Uruchomienie komendy, która generuje błąd (np. nieistniejąca komenda)
non_existent_command  # To wywoła błąd, ponieważ 'non_existent_command' nie istnieje

# Zapisz wszystkie błędy do dwóch plików: error.log oraz error_bak.log
echo "Zapisuję błędy do plików error.log i error_bak.log..."
./skrypt.sh 2> >(tee -a error.log | tee -a error_bak.log)
