#!/bin/sh

source ./utils.sh
source ./ollama_config.sh

# create pod if needed
POD_EXISTS=$(podman pod ps --filter "name=${POD_NAME}" | wc -l)
if [ ${POD_EXISTS} -ne 2 ]
then
    print_log "Creating POD [${POD_NAME}] ..."
    podman pod create --name ${POD_NAME} -p 11434:11434
    print_log "Creating POD [${POD_NAME}] OK!"
fi

# Create container if needed
CONTAINER_EXISTS=$(podman ps -p -a --filter "pod=${POD_NAME}" --filter "name=${CONTAINER_NAME}" | wc -l)
if [ ${CONTAINER_EXISTS} -ne 2 ]
then
    print_log "Creating CONTAINER [${CONTAINER_NAME}] ..."
    podman run -dt --pod ${POD_NAME} --name ${CONTAINER_NAME} docker.io/ollama/ollama:latest
    print_log "Creating CONTAINER [${CONTAINER_NAME}] OK!"
fi


# Check if container is OK


# Stop the pod 
CONTAINER_RUNNING=$(podman ps -p -a --filter "pod=${POD_NAME}" --filter "name=${CONTAINER_NAME}" --filter "status=running" | wc -l)
if [ ${CONTAINER_RUNNING} -eq 2 ]
then
    ./ollama_stop.sh
fi










