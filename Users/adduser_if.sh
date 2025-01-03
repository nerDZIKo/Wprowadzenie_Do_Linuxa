#!/bin/bash

# Nazwy użytkowników do sprawdzenia
users=("student1" "student2")

# Czy usunąć użytkowników (y/n)?
read -p "Czy usunąć użytkowników? (y/n): " delete_users

# Sprawdzenie istnienia użytkowników i dodanie/usunięcie, jeśli to konieczne
for user in "${users[@]}"; do
  if ! grep -q "^$user:" /etc/passwd; then
    if [[ "$delete_users" == "y" ]]; then
      echo "Użytkownik $user nie istnieje. Nic nie zrobiono."
    else
      echo "Dodawanie użytkownika: $user"
      useradd -m -p netlab $user
    fi
  else
    if [[ "$delete_users" == "y" ]]; then
      echo "Usuwanie użytkownika: $user"
      userdel -r $user
      # Sprawdzenie, czy użytkownik został usunięty
      if ! grep -q "^$user:" /etc/passwd; then
        echo "Użytkownik $user został usunięty pomyślnie."
      else
        echo "Wystąpił błąd podczas usuwania użytkownika $user."
      fi
    else
      echo "Użytkownik $user już istnieje."
    fi
  fi
done