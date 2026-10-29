#!/usr/bin/env bash
set -Eeuo pipefail
cd "$(dirname "$0")/.."
MODEL="${1:-qwen2.5:3b}"
docker compose exec ollama ollama pull "$MODEL"
docker compose exec ollama ollama list
