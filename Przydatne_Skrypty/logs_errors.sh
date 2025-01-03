#!/bin/bash

# Funkcja do logowania komunikatów informacyjnych
log_ok() {
  # Przekazuje komunikat na standardowe wyjście (stdout)
  echo "[OK] $1"
  
  # Można dodać, by również zapisać to do pliku (np. logów informacyjnych)
  echo "[OK] $1" >> success.log
}

# Funkcja do logowania komunikatów błędów
log_err() {
  # Przekazuje komunikat na standardowe wyjście błędów (stderr)
  echo "[ERROR] $1" >&2
  
  # Zapisuje błąd do dwóch plików błędów: error.log i error_bak.log
  echo "[ERROR] $1" >> error.log
  echo "[ERROR] $1" >> error_bak.log
}

# Załaduj zmienne środowiskowe z pliku .bashrc
source ~/.bashrc

# Załaduj zmienne środowiskowe z pliku .env
source .env

# Przykład użycia log_ok i log_err

# Komunikat informacyjny
log_ok "To jest komunikat informacyjny."

# Komunikat błędu
log_err "To jest komunikat błędu."

# Przykład: Uruchomienie komendy, która wywoła błąd
non_existent_command  # To wywoła błąd, ponieważ 'non_existent_command' nie istnieje
