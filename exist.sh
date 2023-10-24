FILE=/etc/baba.conf
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "$FILE dont exists."
fi