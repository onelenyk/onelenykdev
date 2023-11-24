#!/bin/bash

# print_current_version.sh

# Save the current directory and move to the root directory
current_dir=$(pwd)
cd ..

# Extract and print the current version from pubspec.yaml
current_version=$(grep 'version:' pubspec.yaml | sed 's/version: //')
echo "Current version: $current_version"

# Return to the original directory
cd "$current_dir"
