#!/bin/bash

square(){
    sqr=$(($Number*$Number))
}

Number=$(read -p "Please enter the number: ")

echo "square of your number is $sqr"
# Function to calculate square
# square() {
#   echo $(($1 * $1))
# }

# # Ask user for a number
# echo "Enter a number:"
# read num

# # Call function and show result
# echo "Square is: $(square $num)"
