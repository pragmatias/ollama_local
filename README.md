# Project

Using [Ollama](https://ollama.com/) (LLMs) locally with [Podman](https://podman.io/)


# Scripts

Scripts to manage Ollama environment :
- To init the Ollama container : `ollama_init.sh`
- To start the Ollama container : `ollama_start.sh`
- To stop the Ollama container : `ollama_stop.sh`
- To delete the Ollama container : `ollama_clean.sh`

The Ollama configuration is defined in `ollama_config.sh`


# Models used by default

Check the script `ollama_config.sh` to modify the models used 

By default, the models are :
- [llama3:8b](https://ollama.com/library/llama3:8b)
- [codellama:7b](https://ollama.com/library/codellama:7b)
- [starcoder2:3b](https://ollama.com/library/starcoder2:3b)
- [nomic-embed-text:latest](https://ollama.com/library/nomic-embed-text:latest)

# How to use it 

You can use a specific model with the following command :
1. Source the config file `source ollama_config.sh`
2. Execute the following command : `podman exec -it ${CONTAINER_NAME} ollama run llama3`

# How to configure `continue.dev` on VSCode

```JSON
{
  "models": [
    {
      "title": "CodeLlama",
      "provider" : "ollama",
      "model" : "codellama:7b",
      "apiBase": "http://localhost:11434"
    },
    {
      "title": "Llama3",
      "provider" : "ollama",
      "model" : "llama3",
      "apiBase": "http://localhost:11434"
    }
  ],
  "tabAutocompleteModel": {
    "title": "Starcoder",
    "provider": "ollama",
    "model": "starcoder2:3b",
    "apiBase": "http://localhost:11434"
  },
  "embeddingsProvider": {
    "title": "Nomic",
    "provider": "ollama",
    "model": "nomic-embed-text",
    "apiBase": "http://localhost:11434"
  }
}
```
