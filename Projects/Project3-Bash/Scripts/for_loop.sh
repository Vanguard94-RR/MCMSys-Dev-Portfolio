#! /bin/bash

for num in {1..100..50}; do
    echo $num
done

for num in {1,2,3,4,5,6,7,8,9,10}; do
    echo $num
done

for ((i = 0; i < 11; i++)); do
    echo $i
done
