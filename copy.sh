#!/bin/bash

set -euxo pipefail

keyctl session
azcopy login --tenant-id ${TENANT_ID}
azcopy copy ${AZ_COPY_SOURCE} /data/samplefile.txt
