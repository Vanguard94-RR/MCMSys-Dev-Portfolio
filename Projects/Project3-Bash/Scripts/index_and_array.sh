#! /bin/bash

car=('Honda' 'Toyota' 'Mazda' 'BMW')

echo "${car[@]}"
echo "${car[0]}"
echo "${car[1]}"
echo "${car[2]}"
echo "${car[3]}"
echo
echo "${!car[@]}" ## show the index
echo "${#car[@]}" ## count the index values
echo
unset car[2] ## remove a value from array
echo "${car[@]}"
echo "${!car[@]}"
echo "${#car[@]}"
car[2]='VW'
echo "${car[@]}"
echo "${!car[@]}"
echo "${#car[@]}"
