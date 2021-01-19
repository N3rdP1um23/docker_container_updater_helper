#!/bin/bash

###
#
# N3rdP1um23
# January 18, 2020
# The following file is used to handle updating either all docker containers or only ones specified
# https://github.com/N3rdP1um23/docker_container_updater_helper
#
###

# Execute the script in the same folder the script resides in (alows relative execution)
cd $( dirname "${BASH_SOURCE[0]}" )

# Check to see if there are any arguments
if [ "$#" -lt 1 ]; then
    # Display a status message
    echo "No arguments provided. Starting normal Docker container updates"

    # Execute the Docker update
    docker-compose pull
    docker-compose up -d
    docker system prune -af --volumes

    # Display a status message
    echo "Finished Docker container updates"
elif [ "$#" -ge 1 ]; then
    # Iterate over each of the arguments provided
    for container in "$@"; do
        # Display a status message
        echo "Updating ${container} container"

        # Execute the Docker update
        docker-compose pull ${container}
        docker-compose up -d ${container}
        docker system prune -af --volumes

        # Display a status message
        echo "Finished ${container} container updates"
        echo ""
    done
fi
