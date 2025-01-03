for i in {START..END}
do
   commands
done
## step value ##
for i in {START..END..STEP}
do
   commands
done
## example: ping cbz01, cbz02, cbz03, and cbz04 using a loop ##
for i in 0{1..4}
do
    h="server${i}"
    ping -c 1 -q "$h" &>/dev/null
    if [ $? -eq 0 ]
    then
        echo "server $h alive"
    else
        echo "server $h dead or can not ping."
    fi
done