#!/bin/bash

# Funkcja tworząca użytkownika z losowym hasłem i ustawiająca wymagania
function createUser() {
  local user="$1"
  local password=$(openssl passwd -6 -salt xyz $user)
  useradd -m -p "$password" "$user"
  chage -m 2 -M 14 -W 2 -I 5 "$user"
}

# Funkcja dodająca użytkownika do grupy
function addUserToGroup() {
  local user="$1"
  local group="$2"
  usermod -aG "$group" "$user"
}

# Główna część skryptu
# Tworzenie użytkowników
num_users=10
for i in $(seq 1 $num_users); do
  user="user-$i"
  createUser "$user"
  addUserToGroup "$user" "LAB5"
done

# Tworzenie grupy i katalogu
groupadd LAB5
mkdir /home/LAB5
chown root:LAB5 /home/LAB5

# Ustawianie uprawnień
chmod 700 /home/user-1
touch /home/user-2/a.txt
chmod 640 /home/user-2/a.txt

# Sprawdzenie uprawnień i statusu haseł
# ... (tutaj możesz dodać bardziej szczegółowe sprawdzenia)