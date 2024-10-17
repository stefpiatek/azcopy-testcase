#!/bin/bash

set -euxo pipefail

# Convert the comma-separated list of containers into an array
IFS=',' read -r -a CONTAINERS_ARRAY <<< "$CONTAINERS"

# Loop through each container
for CONTAINER in "${CONTAINERS_ARRAY[@]}"; do
    # Skip any container which already has a export zip file
    if [ ! -f "/data-export/${CONTAINER}.zip" ]; then
        # Download to container within docker mount, as this has more storage
        mkdir -p "/data/${CONTAINER}"
        azcopy copy "https://${STORAGE_ACCOUNT}.blob.core.windows.net/${CONTAINER}/?${SAS_CONTEXT}" "/data/${CONTAINER}" --recursive

        # Zip to export mount
        zip -r "/data-export/${CONTAINER}.zip" "/data/${CONTAINER}"
    fi
done
