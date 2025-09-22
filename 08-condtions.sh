#!/bin/bash

#identify given number is even or odd

number=$1

if [$(($1 % 2)) -eq 0]; then
    echo "the given number $1 is even"
else 
    echo "the given numer $1 is ODD "
fi