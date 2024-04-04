# Use the official Rust image, which is based on Debian
FROM rust:latest

# Set the working directory in the container
WORKDIR /usr/src/myapp

# Copy the local executable and script files to the container
COPY ore .
COPY keypair.json .
COPY multiple_keypairs.json .
COPY ore_loop.sh .
COPY extract_keypair.sh .

#Install Utilities | jq and curl
RUN apt-get update && apt-get install -y jq
RUN apt-get update && apt-get install -y curl

# Change the ownership to the user and make the files executable
RUN chmod a+x ore ore_loop.sh extract_keypair.sh
# RUN ./extract_keypair.sh


CMD ["sh", "-c", "cd /usr/src/myapp; ./ore_loop.sh"]
