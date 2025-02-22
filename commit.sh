#!/bin/bash

message="adding changes"

if [ "$1" != "" ]; then
    message=$1
fi

echo "Adding files..."
git add *
echo "Committing changes... \"$message\""
git commit -m "$message"
echo "Pushing the changes to origin..."
git push -u origin main
echo "Execution has finished!"

#exit 1;
