#!/bin/bash

# URL from which to fetch data
URL="http://localhost:5000/data"

# Directory to store output files
DIRECTORY="files"

# Ensure the directory exists
mkdir -p $DIRECTORY

# Fetch the data using curl and parse it using jq
curl -s $URL | jq -c '.samples[]' | while read -r sample; do
  # Extract the name and id using jq
  name=$(echo $sample | jq -r '.name')
  id=$(echo $sample | jq -r '.id')

  # Create a file with the id as the filename and the name as the content
  echo $name > "$DIRECTORY/$id.txt"
done

# Optional: Verify the SHA256 sum of each file's contents to match the id
for file in $DIRECTORY/*.txt; do
  # Compute the SHA256 sum of the file's contents
  computed_hash=$(sha256sum $file | awk '{ print $1 }')
  filename=$(basename $file .txt)

  # Check if the computed hash matches the filename (id)
  if [ "$computed_hash" == "$filename" ]; then
    echo "Verified: $file is correct."
  else
    echo "Error: Hash mismatch for $file. Expected $filename, got $computed_hash"
  fi
done
