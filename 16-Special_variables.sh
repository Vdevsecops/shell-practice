#!/bin/bash

# '$#' Number of positional parameters.
echo "You passed $# arguments."

# '$0' – Script name
echo "This script's name is: $0"

# '$1 to $9' – Positional parameters
echo "First argument: $1"
echo "Second argument: $2"
echo "Third argument: $3"

# ${10}, ${11}, ... – Positional parameters beyond 9
echo "Tenth argument: ${10}"
echo "Eleventh argument: ${11}"

# if we give tenth arg as without {}
echo "Tenth argument: $10"
echo "Eleventh argument: $11"

# $* – All arguments as a single string
echo "All arguments as one string: $*"

# $@ – All arguments as separate strings
echo "All arguments individually:"
for arg in "$@"; do
    echo "$arg"
done

# $? – Exit status of last command
ls /nonexistent_dir
echo "Exit status of previous command: $?"

# $$ – PID of current script
echo "Current script PID: $$"

# $! – PID of last background process
sleep 5 &
echo "PID of last background process: $!"

# $_ – Last argument of previous command
echo "Last argument of previous command: $_"
# For better effect, try running:
ls /etc
echo "$pwd"
