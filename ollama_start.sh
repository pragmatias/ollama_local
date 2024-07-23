#!/bin/sh

source ./utils.sh
source ./ollama_config.sh

# Start the pod 
CONTAINER_RUNNING=$(podman ps -p -a --filter "pod=${POD_NAME}" --filter "name=${CONTAINER_NAME}" --filter "status=stopped" | wc -l)
if [ ${CONTAINER_RUNNING} -eq 2 ]
then
    print_log "Starting CONTAINER [${CONTAINER_NAME}] ..."
    podman pod start ${POD_NAME}
    print_log "Starting CONTAINER [${CONTAINER_NAME}] OK!"
fi


# Get the codellama model

for model in ${MODELS[@]}; do
  print_log "Pull Ollama Models [${model}] ..."
  podman exec -it ${CONTAINER_NAME} ollama pull ${model}
  print_log "Pull Ollama Models [${model}] OK!"
done







