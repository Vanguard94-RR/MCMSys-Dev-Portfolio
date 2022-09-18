#! /bin/bash

n1=10
n2=2

echo $((n1 + n2))
echo $((n1 - n2))
echo $((n1 * n2))
echo $((n1 / n2))
echo $((n1 % n2))
echo
echo $(expr $n1 + $n2)
echo $(expr $n1 - $n2)
echo $(expr $n1 \* $n2) ## the \ is added in order to bash be able to recognize the operator
echo $(expr $n1 \/ $n2)
echo $(expr $n1 \% $n2)
