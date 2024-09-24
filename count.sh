# Write a shell script to extract the number of alphabets characters and digits and tell the count

#!/bin/bash

# Read input from a file or stdin
if [ -n "$1" ]; then
    input=$(cat "$1")  # If a file is provided
else
    echo "Enter the text (press Ctrl+D when done):"
    input=$(cat)  # Read from stdin
fi

# Count alphabetic characters (both lowercase and uppercase)
alphabet_count=$(echo "$input" | grep -o '[a-zA-Z]' | wc -l)

# Count digits
digit_count=$(echo "$input" | grep -o '[0-9]' | wc -l)

# Output the results
echo "Number of alphabetic characters: $alphabet_count"
echo "Number of digits: $digit_count"


#Example Output:
#If you run the script and input the following text:
Hello World 123!
The output will be:

Number of alphabetic characters: 10
Number of digits: 3
