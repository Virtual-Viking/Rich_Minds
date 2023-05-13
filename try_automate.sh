#!/bin/bash

# Define the start and end dates
START_DATE="2023-05-11"
END_DATE="2024-02-04"

# Define the repository path
REPO_PATH="C:\Users\princ\Documents\Rich_Minds"

# Navigate to the repository
cd $REPO_PATH || exit

# Generate commits for each day in the range
CURRENT_DATE=$START_DATE
while [ "$CURRENT_DATE" != "$(date -I -d "$END_DATE + 1 day")" ]; do
  # Determine whether to make commits on this day
  MAKE_COMMITS=$(shuf -i 0-1 -n 1) # 0 = no commits, 1 = make commits

  if [ "$MAKE_COMMITS" -eq 1 ]; then
    # Randomize the number of commits (1 to 15)
    NUM_COMMITS=$(shuf -i 1-15 -n 1)

    # Generate commits for the current date
    for ((i = 1; i <= NUM_COMMITS; i++)); do
      echo "Commit on $CURRENT_DATE: $i"
      GIT_AUTHOR_DATE="$CURRENT_DATE 12:00:00" GIT_COMMITTER_DATE="$CURRENT_DATE 12:00:00" \
        git commit --allow-empty --date="$CURRENT_DATE 12:00:00" -m "Commit #$i for $CURRENT_DATE: Progress on RAN Wireless landing page"
    done
  fi

  # Skip to a random number of days (3 to 5)
  SKIP_DAYS=$(shuf -i 3-5 -n 1)
  CURRENT_DATE=$(date -I -d "$CURRENT_DATE + $SKIP_DAYS days")
done
