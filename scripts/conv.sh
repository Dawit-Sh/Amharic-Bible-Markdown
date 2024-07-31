#!/bin/bash
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 directory1 [directory2 ... directoryN]"
  exit 1
fi
if ! command -v pandoc &> /dev/null; then
  echo "Pandoc is not installed. Please install pandoc and try again."
  exit 1
fi

for DIRECTORY in "$@"; do
  if [ -d "$DIRECTORY" ]; then
    echo "Processing directory: $DIRECTORY"
    for file in "$DIRECTORY"/*.html; do
      if [ -f "$file" ]; then
        output_file="${file%.html}.md"
        pandoc "$file" -o "$output_file"
        echo "Converted $file to $output_file"
      fi
    done
  else
    echo "Directory $DIRECTORY does not exist."
  fi
done

echo "All files converted"
