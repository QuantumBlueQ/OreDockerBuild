#!/bin/bash

# Assuming the CSV file is named 'proxies.csv' and is in the current directory
# The output file is named 'formatted_proxies.txt'
output_file="formatted_proxies.txt"

# Make sure the output file is empty before we start
> "$output_file"

# Skip the first line (header), then read the rest of the lines one by one
tail -n +2 proxies.csv | while IFS=, read -r custom_name host port username password
do
  # Remove carriage return characters and append the formatted proxy URL to the output file
  printf "http://%s:%s@%s:%s\n" "${username//[$'\r']}" "${password//[$'\r']}" "${host//[$'\r']}" "${port//[$'\r']}" >> "$output_file"
done

# Display a message when done
echo "Proxies have been formatted and saved to $output_file."
