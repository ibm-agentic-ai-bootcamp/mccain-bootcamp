#!/bin/bash

# Base directory where your directories with docx files are located
base_dir="."

# Loop over each directory inside base_dir
for dir in "$base_dir"/*/ ; do
  if [ -d "$dir" ]; then
    # Find the .docx file inside the directory (assuming exactly one)
    docx_file=$(find "$dir" -maxdepth 1 -type f -name "*.docx" | head -n 1)
    
    if [ -z "$docx_file" ]; then
      echo "No .docx file found in $dir"
      continue
    fi

    # Get filename without extension and directory path
    filename=$(basename "$docx_file" .docx)

    # Path to generated markdown file
    md_file="${dir}${filename}.md"
    
    # Path to extracted media directory
    media_dir="${dir}attachments/${filename}"

    echo "Removing generated files in $dir"

    # Delete markdown file if exists
    if [ -f "$md_file" ]; then
      rm "$md_file"
      echo "Deleted $md_file"
    else
      echo "Markdown file $md_file not found"
    fi

    # Delete media directory if exists
    if [ -d "$media_dir" ]; then
      rm -rf "$media_dir"
      echo "Deleted media directory $media_dir"
    else
      echo "Media directory $media_dir not found"
    fi
  fi
done
