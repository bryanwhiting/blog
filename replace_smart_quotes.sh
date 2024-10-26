#!/bin/bash

# Loop through each markdown file found recursively
find . -type f -name "*.md" | while read file; do
  # Replace smart quotes with standard quotes
  sed -i 's/“/"/g' "$file"
  sed -i 's/”/"/g' "$file"
done

