#!/usr/bin/bash

# Scans a given directory for png files containing QR codes and outputs their contents
# to a text file named output.txt in the given directory

if [ $# -eq 0 ]
  then
    echo "No directory supplied."
    exit 1
fi
dir=$(pwd)
cd "$1"
> output.txt

for f in *
do
  t=$(zbarimg "$f" -q) &> /dev/null
  if [[ $t == QR-Code* ]]
  then
    echo "$f|${t:8}" >> output.txt 2>/dev/null
  fi
done

cd "$dir"
