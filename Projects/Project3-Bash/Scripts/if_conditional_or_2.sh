#! /bin/bash

age=26

if ["$age" -gt 18 -o "$age" -lt 25]; then # -eq means equal than, -gt means greather than -ne means not equal, -lt means less than, you can use operatos like < > =
    echo "Age is correct"
else
    echo "Age is not correct"
fi
