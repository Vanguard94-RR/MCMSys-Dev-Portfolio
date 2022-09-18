#! /bin/bash

echo "Enter 1st string"
read st1
echo "Enter 2nd string"
read st2

if [ "$st1" \< "$st2" ]; then
    echo "$st1 is smaller than $st2"
elif [ "$st1" \> "$st2" ]; then
    echo "$st2 is smaller than $st1"
else
    echo "String are equal"
fi
