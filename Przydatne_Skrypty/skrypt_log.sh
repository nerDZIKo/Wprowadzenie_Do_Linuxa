#!/bin/bash

source .env

LOG_FILE="skrypt.log"

log_message() {
  echo "$1" | tee -a "$LOG_FILE"
}

log_message "NR_ALBUMU: $NR_ALBUMU"

if [ -z "$1" ]; then
  log_message "Błąd: Nie podano nazwy katalogu."
  exit 1
fi

KATALOG="$1"
log_message "Katalog: $KATALOG"

if [ ! -d "$KATALOG" ]; then
  log_message "Błąd: $KATALOG nie istnieje lub nie jest katalogiem."
  exit 1
fi

LICZBA_PLIKOW_TEKSTOWYCH=0
SUMA_LINII=0
SUMA_SLOW=0
SUMA_ZNAKOW=0

log_message "Analizowanie plików w katalogu: $KATALOG"

for PLIK in "$KATALOG"/*; do
  if [ -f "$PLIK" ]; then
    log_message "Plik: $PLIK"
    
    if file "$PLIK" | grep -q "text"; then
      log_message "Plik jest plikiem tekstowym."
      
      WYNIK_WC=$(wc "$PLIK")
      LOKALNE_LINIE=$(echo "$WYNIK_WC" | awk '{print $1}')
      LOKALNE_SLOWA=$(echo "$WYNIK_WC" | awk '{print $2}')
      LOKALNE_ZNAKI=$(echo "$WYNIK_WC" | awk '{print $3}')
      
      LICZBA_PLIKOW_TEKSTOWYCH=$((LICZBA_PLIKOW_TEKSTOWYCH + 1))
      SUMA_LINII=$((SUMA_LINII + LOKALNE_LINIE))
      SUMA_SLOW=$((SUMA_SLOW + LOKALNE_SLOWA))
      SUMA_ZNAKOW=$((SUMA_ZNAKOW + LOKALNE_ZNAKI))
    else
      log_message "Plik nie jest plikiem tekstowym."
    fi
  fi
done

