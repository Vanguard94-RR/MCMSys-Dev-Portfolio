#! /bin/bash
#echo $1 $2 $3 ## this is used to bring input variables or strings as arguments

args=("$@") # this "$@" is used to specify unlimited number of arguments

#echo "${args[0]}" "${args[1]}" "${args[2]}" "${args[3]}" "${args[4]}" "${args[5]}" "${args[6]}"

echo "$@"

echo $# ## print the lenght of the array
