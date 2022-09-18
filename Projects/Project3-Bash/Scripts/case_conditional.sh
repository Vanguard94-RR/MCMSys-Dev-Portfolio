#! /bin/bash

car=
case $car in
if (("$count" < 9)); then # -eq means equal than, -gt means greather than -ne means not equal, you can use operatos like < > =
    echo "The Condition is true"
elif (($count < 6)); then
    echo "Second Condition is true"
else
    echo "Condition is false"
fi
