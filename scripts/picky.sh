#!/bin/bash
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 directory1 [directory2 ... directoryN]"
  exit 1
fi
for DIRECTORY in "$@"; do
  if [ -d "$DIRECTORY" ]; then
    echo "Processing directory: $DIRECTORY"
    for file in "$DIRECTORY"/*.md; do
      if [ -f "$file" ]; then
        sed -i.bak -E '
          s/\*//g
          s/-Reset\+//g
          /Courtesy of Wordproject, a registered domain of , a non-profit organization registered in Macau, China./d
          /^[[:space:]]*$/d
        ' "$file"
        rm "${file}.bak"
        echo "Processed $file"
      fi
    done
  else
    echo "Directory $DIRECTORY does not exist."
  fi
done
echo "Junk Removed"
