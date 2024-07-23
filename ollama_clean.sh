#!/bin/sh

source ./utils.sh
source ./ollama_config.sh

# delete pod if exists
POD_EXISTS=$(podman pod ps --filter "name=${POD_NAME}" | wc -l)
if [ ${POD_EXISTS} -eq 2 ]
then
    print_log "Deleting POD [${POD_NAME}] ..."
    podman pod rm -f ${POD_NAME}
    print_log "Deleting POD [${POD_NAME}] OK!"
fi

