#!/bin/bash
# If a command fails then the deploy stops
set -e

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t hugo-theme-cleanwhite # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

echo -e "\033[0;32mComming to git with changes as $msg...\033[0m"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
