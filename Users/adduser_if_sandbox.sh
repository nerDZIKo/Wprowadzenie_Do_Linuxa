users_to_create=("student1" "student2")
password_to_create=netlab
ciag=user:x:1000:1000:BearCode,,,:/home/bearcode:/bin/bash
for i in "${users_to_create[@]}"; do
    echo $i
done

passwd_users=$(cat /etc/passwd)

if [ "$users_to_create" = "student1" ]; then
    echo Jest Student1
else
    echo Nie ma Student1!
    for i in "${users_to_create[@]}"; do
    adduser $i
done
fi
if [ "$users_to_create" = "student2" ]; then
    echo Jest Student2
fi

for element in $passwd_users
do
    echo "$element"
    echo "--------"
done

if echo "$passwd_users" | grep -q postgres; then
    echo "Znaleziono 'postgres'"
fi

if [[ $passwd_users == *"postgres"* ]]; then
    echo "Znaleziono 'postgres'"
fi

if [[ $ciag =~ user ]]; then
    echo "Znaleziono 'user'"
fi