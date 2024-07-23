#!/bin/sh

print_log "Export variable ..."
export POD_NAME="llms-pod"
export CONTAINER_NAME="${POD_NAME}-ollama"
export TIMEOUT=10
export SLEEPING=10
export MODELS=("llama3:8b" "codellama:7b" "starcoder2:3b" "nomic-embed-text:latest")
print_log "Export variable OK !"
