#!/bin/bash

set -euxo pipefail

azcopy login --tenant-id ${TENANT_ID}
azcopy copy ${AZ_COPY_SOURCE} /data/samplefile.txt