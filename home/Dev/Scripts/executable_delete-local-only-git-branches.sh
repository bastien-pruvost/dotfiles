#!/bin/bash

# This script deletes local-only git branches that are not
# present on the remote repository.

git fetch --prune

git branch --format "%(refname:short)" | while read branch; do
  if ! git show-ref --quiet refs/remotes/origin/$branch; then
    echo "Deleting localonly branch: $branch"
    git branch -d $branch
  fi
done