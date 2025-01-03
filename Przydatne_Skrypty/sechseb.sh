#!/bin/bash


log_ok() {
  echo "[OK] $1"
  echo "[OK] $1" >> success.log
}

log_err() {
  echo "[ERROR] $1" >&2
  echo "[ERROR] $1" >> error.log
  echo "[ERROR] $1" >> error_bak.log
}

source .env

if [[ -z "$NR_ALBUMU" || -z "$IMIE" || -z "$NAZWISKO" || -z "$INDEKS" ]]; then
  log_err "Brak wymaganych zmiennych środowiskowych w pliku .env LUB zmiennej z ~/.bashrc"
  exit 1
fi

log_ok "Załadowano zmienne z pliku .env"

echo "NR_ALBUMU: $NR_ALBUMU"
echo "IMIE: $IMIE"
echo "NAZWISKO: $NAZWISKO"
echo "NR_ALBUMU: $INDEKS"

ROBOCZY_KATALOG="$(pwd)"
echo $ROBOCZY_KATALOG
echo "Katalog roboczy: $ROBOCZY_KATALOG"
if [ ! -d "$ROBOCZY_KATALOG" ]; then
  log_err "Katalog roboczy nie istnieje lub nie jest katalogiem."
  exit 1
fi

for PLIK in "$ROBOCZY_KATALOG"/*; do
  if [ -f "$PLIK" ]; then
    echo "Sprawdzam plik: $PLIK"
    echo "===OSTATNI WPIS===" >> "$PLIK"
        if [[ $? -eq 0 ]]; then
      log_ok "Linia dodana do pliku $PLIK"
    else
      log_err "Wystąpił błąd podczas dodawania linii do pliku $PLIK"
    fi
  else
    echo "Plik $PLIK ERROR."
  fi
done

