#!/bin/bash
source .env
echo "NR_ALBUMU: $NR_ALBUMU"


if [ -z "$1" ]; then
  echo "Błąd: Nie podano nazwy katalogu."
  exit 1
fi

KATALOG="$1"
echo $KATALOG

if [ ! -d "$KATALOG" ]; then
  echo "Błąd: $KATALOG nie istnieje lub nie jest katalogiem."
  exit 1
fi

LICZBA_PLIKOW_TEKSTOWYCH=0
SUMA_LINII=0
SUMA_SLOW=0
SUMA_ZNAKOW=0

echo "Analizowanie plików w katalogu: $KATALOG"
for PLIK in "$KATALOG"/*; do
  if [ -f "$PLIK" ]; then
    echo "Plik: $PLIK"
    
    if file "$PLIK" | grep -q "text"; then
      echo "Plik jest plikiem tekstowym."
      
      WYNIK_WC=$(wc "$PLIK")
      LOKALNE_LINIE=$(echo "$WYNIK_WC" | awk '{print $1}')
      LOKALNE_SLOWA=$(echo "$WYNIK_WC" | awk '{print $2}')
      LOKALNE_ZNAKI=$(echo "$WYNIK_WC" | awk '{print $3}')
      
      LICZBA_PLIKOW_TEKSTOWYCH=$((LICZBA_PLIKOW_TEKSTOWYCH + 1))
      SUMA_LINII=$((SUMA_LINII + LOKALNE_LINIE))
      SUMA_SLOW=$((SUMA_SLOW + LOKALNE_SLOWA))
      SUMA_ZNAKOW=$((SUMA_ZNAKOW + LOKALNE_ZNAKI))
    else
      echo "Plik nie jest plikiem tekstowym."
    fi
  fi
done

echo "--------------------------"
echo "Podsumowanie:"
echo "Liczba plików tekstowych: $LICZBA_PLIKOW_TEKSTOWYCH"
echo "Łączna liczba linii: $SUMA_LINII"
echo "Łączna liczba słów: $SUMA_SLOW"
echo "Łączna liczba znaków: $SUMA_ZNAKOW"

echo "Porównanie katalogu $KATALOG z katalogiem roboczym..."
ROBOCZY_KATALOG="$(pwd)"
echo $ROBOCZY_KATALOG

for PLIK_W_KATALOGU in "$KATALOG"/*; do
  if [ -f "$PLIK_W_KATALOGU" ]; then
    PLIK_W_ROBOCZYM_KATALOGU="$ROBOCZY_KATALOG/$(basename "$PLIK_W_KATALOGU")"
    
    if [ -f "$PLIK_W_ROBOCZYM_KATALOGU" ]; then
      if ! cmp -s "$PLIK_W_KATALOGU" "$PLIK_W_ROBOCZYM_KATALOGU"; then
        echo "Plik $PLIK_W_KATALOGU różni się od wersji roboczej."
      fi
    else
      echo "Plik $PLIK_W_KATALOGU nie istnieje w katalogu roboczym."
    fi
  fi
done
