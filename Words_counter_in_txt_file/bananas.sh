#!/bin/bash
#apt install shellcheck
#shellcheck skrypt.sh 


if [ $# -ne 1 ]; then
    echo "Użycie: $0 <rozszerzenie>"
    exit 1
fi

extension="$1"

total_files=0
total_banana_lines=0
total_unique_words=0

for file in *.$extension; do
    ((total_files++))
    echo "Przetwarzam plik: $file"

    banana_lines=$(grep -c "banana" "$file")
    ((total_banana_lines+=banana_lines))
    echo "Linie z 'banana': $banana_lines"

    unique_words=$(cat "$file" | tr ' ' '\n' | sort | uniq | wc -l)
    ((total_unique_words+=unique_words))
    echo "Unikalne słowa: $unique_words"

    sed -i 's/apple/orange/g' "$file"
done

echo "-------------------------"
echo "Przetworzono plików: $total_files"
echo "Łączna liczba linii z 'banana': $total_banana_lines"
echo "Łączna liczba unikalnych słów: $total_unique_words"

