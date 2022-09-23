#! /bin/bash

echo "Press any key to continue"

while [ true ]; do
    read -t3 -n 1
    if [ $? = 0 ]; then
        echo "Script Terminated"
        break
    else
        echo "Please press a key"
    fi
done
