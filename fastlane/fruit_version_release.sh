#!/bin/bash

# increase_version.sh

# Save the current directory and move to the root directory
current_dir=$(pwd)
cd ..

# Path to the fruits list in the root directory
fruits_file="${current_dir}/fruits.txt"

# Extract the current version and fruit name from pubspec.yaml
current_version=$(grep 'version:' pubspec.yaml | sed 's/version: //' | sed 's/-.*//')
current_fruit=$(grep 'version:' pubspec.yaml | sed 's/.*-//')

# Increment the major version
IFS='.' read -ra VERSION_PARTS <<< "$current_version"
major=${VERSION_PARTS[0]}
major=$((major + 1))

# Get the next fruit name
next_fruit=""
found_current=0
while read fruit; do
    if [ "$found_current" -eq 1 ]; then
        next_fruit=$fruit
        break
    fi
    if [ "$fruit" = "$current_fruit" ]; then
        found_current=1
    fi
done < $fruits_file

# Check if next fruit is found, otherwise start from the first fruit
if [ -z "$next_fruit" ]; then
    next_fruit=$(head -n 1 $fruits_file)
fi

# Combine the new version and fruit name
new_version="$major.0.0-$next_fruit"

# Update the version in pubspec.yaml
sed -i '' "s/version: .*/version: $new_version/g" pubspec.yaml

# Print the new version
echo "Version updated to $new_version"

# Return to the original directory
cd "$current_dir"
