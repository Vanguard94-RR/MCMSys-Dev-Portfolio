#! /bin/bash

echo "Enter 1st string"
read st1
echo "Enter 2nd string"
read st2

if [ "$st1" == "$st2" ]; then
    echo "Strings does match"
else
    echo "Strings does not match"
fi
