#!/bin/bash

# Start server
rstudio-server start
echo "RServer started"

# Read user input in loop waiting for 'exit' command
echo "Type exit to close!"
while read -s -p '' COMMAND && [[ "$COMMAND" != "exit" ]] ; do
  echo "Invalid command!"
done