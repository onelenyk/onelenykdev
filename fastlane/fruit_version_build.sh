#!/bin/bash

# increment_build_number.sh

# Save the current directory and move to the root directory
current_dir=$(pwd)
cd ..

# Extract the current version, fruit name, and build number from pubspec.yaml
version_line=$(grep 'version:' pubspec.yaml)
version=$(echo $version_line | sed 's/version: //' | sed 's/+.*//')
build_number=$(echo $version_line | sed 's/.*+//')

# Increment the build number
new_build_number=$((build_number + 1))

# Update the version in pubspec.yaml
new_version="${version}+${new_build_number}"
sed -i '' "s/version: .*/version: $new_version/g" pubspec.yaml

# Print the new version
echo "Build number updated to $new_version"

# Return to the original directory
cd "$current_dir"
