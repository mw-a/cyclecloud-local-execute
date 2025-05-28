#!/bin/bash

set -e

# workaround for Platform MPI with multiple IB partitions
cat <<'EOF' > /etc/profile.d/pmpi-ib-partition.sh
export MPI_IB_PKEY="$(sed 2>/dev/null \
		-e '/^0x[0-9a-f][0-9a-f][0-9a-f][0-9a-f]$/!d'  \
		-e '/^0x7fff$/d' \
		-e  '/^0xffff$/d' \
		/sys/class/infiniband_verbs/uverbs0/device/net/ib0/pkey)"
EOF
