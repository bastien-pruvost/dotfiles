#!/bin/bash

# This script deletes all commits on a specific date except one.

# Date of commits you want to delete except one (format: YYYY-MM-DD)
DELETE_DATE="2024-06-05"

# Set the GitHub repository URL
GITHUB_REPO_URL="git@github.com:john-doe/my-repository.git"

# Local clone directory
TEMP_DIR=$(mktemp -d)

# Clone the GitHub repository into the temporary directory
echo "Cloning repository..."
git clone "$GITHUB_REPO_URL" "$TEMP_DIR"

# Change directory to the cloned GitHub repository
cd "$TEMP_DIR" || exit

# Fetch all commits and look for the ones on the specific date
echo "Looking for commits on $DELETE_DATE..."

# Find commit hashes made on DELETE_DATE
commits_on_date=($(git log --pretty=format:"%H %ad" --date=short | grep "$DELETE_DATE" | cut -d ' ' -f 1))

# Check if there are any commits on the given date
if [ ${#commits_on_date[@]} -eq 0 ]; then
    echo "No commits found on $DELETE_DATE."
    exit 0
fi

# Keep the first commit, delete the rest
keep_commit=${commits_on_date[0]}
echo "Keeping commit $keep_commit..."

# Loop through and delete all other commits
for commit in "${commits_on_date[@]:1}"; do
    echo "Deleting commit $commit..."
    git rebase --rebase-merges --onto $commit^ $commit
done

# Push the changes to GitHub (force-push because history has been rewritten)
echo "Force-pushing changes to GitHub..."
git push --force origin main

# Clean up
cd ..
rm -rf "$TEMP_DIR"

echo "All but one commit on $DELETE_DATE have been deleted."
