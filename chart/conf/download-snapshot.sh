#!/bin/bash

if [ ! -d /mnt/data/state.db ]; then
    echo "No chain data found - downloading snapshot ${SNAPSHOT}"

    # Ensure the metadata server / network has time to get up and running
    sleep 10

    apt-get update -y
    apt-get install liblz4-tool jq -y

    URL=$(curl -L https://quicksync.io/axelar.json | jq -r ".[] |select(.file==\"${SNAPSHOT}\")|.url")
    echo "Downloading $URL"

    cd /mnt
    curl $URL | lz4 -d | tar -xvf -
    chown -R 1000:1001 /mnt/data
else
    echo "Chain data already present - not downloading snapshot"
fi

exit 0
