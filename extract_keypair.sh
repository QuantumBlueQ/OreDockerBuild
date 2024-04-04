#!/bin/bash

# Use the INDEX environment variable if it's set, otherwise default to 0
index=${INDEX:-0}

# Extract the keypair at the specified index
jq --compact-output ".[$index]" multiple_keypairs.json > keypair.json
