#!/bin/bash

# square(){
#     sqr=$Number**2
#     echo "square of your number is $sqr"
# }

# Number=$(read -p "Please enter the number: ")

# sqare $Number


# Function to calculate square
square() {
  echo $(($1 * $1))
}

# Ask user for a number
echo "Enter a number:"
read num

# Call function and show result
echo "Square is: $(square $num)"
