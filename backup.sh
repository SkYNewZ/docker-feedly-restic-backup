#!/bin/bash
set -o pipefail

# Ensure the export works!
opml_export=$(feedly-opml-export)
if [ $? -ne 0 ]
then
	echo $opml_export
  exit 1
fi

set -e

# 2. Get the OMPL export
# 3. Pipe to the backup command with host "kubernetes" and tag "feedly"
# 4. Forget the 3 last snapshots matching the same tag and hostname
# 5. Check repo integrity
echo $opml_export | restic backup --no-cache -vvv --tag feedly --host kubernetes --stdin --stdin-filename "/feedly-export.opml"
restic forget -vvv --no-cache --tag feedly --host kubernetes --keep-last 3 --prune
restic check --no-cache -vvv