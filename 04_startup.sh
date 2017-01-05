#!/bin/bash

if [ "$#" -ne 2 ]; then
        echo "Usage: $0 connection_string"
        exit 1
fi

# Copy script over and run it
scp scripts/startup.sh $1:~/
ssh $1 scripts/startup.sh

# Cleanup
ssh $1 rm scripts/startup.sh
