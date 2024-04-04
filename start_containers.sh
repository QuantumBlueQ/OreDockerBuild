#!/bin/bash

# Path to the formatted_proxies.txt file
PROXY_FILE="formatted_proxies.txt"

# Number of containers to start
NUM_CONTAINERS=4

# Start containers with unique proxies
for i in $(seq 1 $NUM_CONTAINERS); do
  # Read the proxy from the file, corresponding to the container number
  PROXY=$(sed -n "${i}p" $PROXY_FILE)

  # Use 'docker-compose run' to start a single instance with specific environment variables
  docker-compose run -d --no-deps --name "ore_miner_$i" -e http_proxy=$PROXY -e https_proxy=$PROXY ore_miner
done
