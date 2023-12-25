#!/bin/bash

# Save the current directory and move to the root directory
current_dir=$(pwd)
cd ..

# Path to the fruits list in the root directory
fruits_file="${current_dir}/fruits.txt"

# Extract the current version, fruit name, and build number from pubspec.yaml
version_line=$(grep 'version:' pubspec.yaml)
current_fruit=$(echo $version_line | sed 's/version: //' | sed 's/.*-//' | sed 's/+.*//')
build_number=$(echo $version_line | sed 's/.*+//')

# Increment the major version
current_major=$(echo $version_line | sed 's/version: //' | sed 's/\..*//')
major=$((current_major + 1))

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

# Combine the new version, fruit name, and build number
new_version="$major.0.0-$next_fruit+$build_number"

# Update the version in pubspec.yaml
sed -i '' "s/version: .*/version: $new_version/g" pubspec.yaml

# Print the new version
echo "Version updated to $new_version"

# Return to the original directory
cd "$current_dir"
