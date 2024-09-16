# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set a non-interactive shell environment to avoid stuck prompts
ENV DEBIAN_FRONTEND=noninteractive

# Copy a script to the image that will run when the container starts
COPY setup_and_build.sh /setup_and_build.sh

# Make the script executable
RUN chmod +x /setup_and_build.sh

# Define the command that runs when the container starts
CMD ["/setup_and_build.sh"]