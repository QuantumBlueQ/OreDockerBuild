#!/bin/bash

# Number of containers you started
NUM_CONTAINERS=4

# Stop each container
for i in $(seq 1 $NUM_CONTAINERS); do
  docker stop "ore_miner_$i"
done