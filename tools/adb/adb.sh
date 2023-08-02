HOST="";CMD=""
read -p "(HOST:PORT) connection to: " HOST
adb connect $HOST
while [ "$CMD" != "exit" ]; do
    read -p "$ " CMD
    adb shell $CMD
done
adb disconnect
