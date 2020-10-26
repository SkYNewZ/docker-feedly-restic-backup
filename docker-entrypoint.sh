#!/bin/bash
set -e

# This image is used to backup my Feedly OPML file with Restic
# Its needs :
# - GOOGLE_APPLICATION_CREDENTIALS (used to access the bucket, this is a file path)
# - GOOGLE_PROJECT_ID
# - RESTIC_PASSWORD (unlock the repository)
# - RESTIC_REPOSITORY (name of the repository)
# - CHECK_UUID (healthchecks.io UUID)
# - FEEDLY_ACCESS_TOKEN (to access Feedly developer API)

echo "Running Runitor: $(runitor --version)"
echo "Running Restic: $(restic version)"
echo "feedly-opml-export: $(feedly-opml-export version)"

echo "Starting backup script"
# 1. Start Runitor which will ping /start on healthchecks.io
# ... The backup script
# 6. Runitor will ping again healthchecks.io to signal success
runitor -- bash /backup.sh
