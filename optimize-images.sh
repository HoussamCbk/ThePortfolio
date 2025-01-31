#!/bin/bash

# Create WebP directory if it doesn't exist
mkdir -p images/webp

# Loop through all PNG and JPG files in images directory
for file in images/*.{png,jpg,jpeg}; do
  if [ -f "$file" ]; then
    filename=$(basename -- "$file")
    name="${filename%.*}"
    
    # Convert to WebP with 80% quality
    magick convert "$file" -resize "800x800>" -quality 80 "images/webp/$name.webp"
    
    # Also optimize original
    magick convert "$file" -resize "800x800>" -quality 80 "$file"
  fi
done
