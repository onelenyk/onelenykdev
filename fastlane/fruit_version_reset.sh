#!/bin/bash

# reset_version.sh

# Save the current directory
current_dir=$(pwd)

# Change to the root directory where pubspec.yaml is located
cd ..

# Path to the fruits.txt list in the root directory
fruits_file="fastlane/fruits.txt"

# If current version is not in the list, start from the first fruit
default_version="1.0.0"
default_fruit=$(head -n 1 $fruits_file)
default_build="0"

#!/bin/bash


# Default version format
new_version="${default_version}-${default_fruit}+${default_build}"

# Update the version in pubspec.yaml to the default value
sed -i '' "s/version: .*/version: $new_version/g" pubspec.yaml

# Print the new version
echo "Version reset to $new_version"

# Return to the original directory
cd "$current_dir"
