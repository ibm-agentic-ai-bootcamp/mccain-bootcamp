#!/bin/bash

base_dir="."

# Find all .docx files recursively inside base_dir
find "$base_dir" -type f -name "*.docx" | while read -r docx_file; do
  # Get the directory containing this docx file
  dir=$(dirname "$docx_file")
  # Get the filename without extension
  filename=$(basename "$docx_file" .docx)

  echo "Processing $docx_file ..."

  # Set media extraction directory next to the docx file, inside 'attachments' folder
  media_dir="${dir}/attachments"

  # Set output markdown file path next to the docx file
  output_md="${dir}/${filename}.md"

  pandoc \
    -t markdown_strict \
    --extract-media="$media_dir" \
    "$docx_file" \
    -o "$output_md"

  echo "Converted $docx_file to $output_md with media in $media_dir"
done
