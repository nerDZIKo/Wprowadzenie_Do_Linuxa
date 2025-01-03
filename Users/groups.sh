#!/bin/bash

# Tworzenie grupy LAB5
groupadd LAB5

# Dodawanie użytkowników do grupy LAB5
usermod -aG LAB5 student1
usermod -aG LAB5 student2

# Tworzenie katalogu /home/LAB5 z odpowiednimi uprawnieniami
mkdir /home/LAB5
chown root:LAB5 /home/LAB5

# Ustawianie wymagań dotyczących hasła dla użytkownika student1
chage -m 2 -M 14 -W 2 -I 5 student1

# Sprawdzenie statusu hasła
passwd -S student1