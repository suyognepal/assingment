#!/bin/bash

workdir=$(pwd)
directory="$1"

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Directory not found: $directory"
    exit 1
fi

#find all files and store in files
files=$(find "$directory" -type f -name "*.txt")

#grep all words and store to newfile

for file in $files; do
    grep -oE '\b\w+\b' "$file" >> $workdir/newfile
done

#sort unique words

sort -u "$(pwd)/newfile" -o "$(pwd)/newfile"

#print
cat $(pwd)/newfile

rm $(pwd)/newfile
