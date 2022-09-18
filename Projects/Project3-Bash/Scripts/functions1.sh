#! /bin/bash

function funcName() {
    echo "This is a new function"
}

funcName ## Call to the function

function funcPrint() {
    echo $1
}

funcPrint 'Hi' ## Call to the function with argument

function funcPrint2() {
    echo $1 $2 $3 $4
}

funcPrint2 Hi My name is Manuel ## Call to the function with multiple arguments

function funcCheck() {
    returningValue="Using function correctly"
    echo "$returningValue"
}

funcCheck ## Call to the function
