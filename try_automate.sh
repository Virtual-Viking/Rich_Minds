#!/bin/bash

# Define the start and end dates
START_DATE="2023-05-11"
END_DATE=$(date +"%Y-%m-%d")

# Define the repository path
REPO_PATH="C:\Users\princ\Documents\Rich_Minds"

# Navigate to the repository
cd $REPO_PATH || exit

# Generate commits for each day in the range
CURRENT_DATE=$START_DATE
while [ "$CURRENT_DATE" != "$(date -I -d "$END_DATE + 1 day")" ]; do
  # Randomize the number of commits (0 to 15)
  NUM_COMMITS=$(shuf -i 0-15 -n 1)

  # Generate commits for the current date
  for ((i = 1; i <= NUM_COMMITS; i++)); do
    echo "Commit on $CURRENT_DATE: $i"
    GIT_AUTHOR_DATE="$CURRENT_DATE 12:00:00" GIT_COMMITTER_DATE="$CURRENT_DATE 12:00:00" \
      git commit --allow-empty --date="$CURRENT_DATE 12:00:00" -m "Commit #$i for $CURRENT_DATE: Progress on RAN Wireless landing page"
  done

  # Move to the next date
  CURRENT_DATE=$(date -I -d "$CURRENT_DATE + 1 day")
done

# Push commits to the repository
git push
