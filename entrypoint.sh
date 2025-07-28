#!/bin/bash

# Download elasticsearch index
if [ ! -d "/photon/photon_data/node_1" ]; then
    echo "Downloading search index"

    # Let graphhopper know where the traffic is coming from
    USER_AGENT="docker: jefure/photon-geocoder"
    wget --user-agent="$USER_AGENT" -O - https://download1.graphhopper.com/public/experimental/extracts/by-country-code/de/photon-db-latest.tar.bz2 | pbzip2 -cd | tar x
fi

# Start photon if elastic index exists
if [ -d "/photon/photon_data/node_1" ]; then
    echo "Start photon"
    java -jar photon.jar $@
else
    echo "Could not start photon, the search index could not be found"
fi
