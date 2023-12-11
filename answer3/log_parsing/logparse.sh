#!/bin/bash

# Take log file path as an argument while running script
logFilePath="$1" 

# Initialize an array to store extracted response codes
responseCodes=()

# Read the log file line by line
while readline= read -r line; do
    # Use grep and awk to find and extract the response code
    responseCode=$(echo "$line" | grep -oP '\s\d{3}\s' | awk '{print $1}')
    
    # If a response code is found, add it to the array
    if [ -n "$responseCode" ]; then
        responseCodes+=("$responseCode")
    fi
done < "$logFilePath"

# Display the extracted response codes
echo "Response Codes:"
for code in "${responseCodes[@]}"; do
    echo "$code"
done

