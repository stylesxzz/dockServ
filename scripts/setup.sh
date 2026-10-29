#!/usr/bin/env bash
set -Eeuo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
command -v docker >/dev/null || { echo "Instale Docker Engine pelo repositório oficial."; exit 1; }
docker compose version >/dev/null || { echo "Instale docker-compose-plugin."; exit 1; }
mkdir -p data/models data/files backups
[[ -f .env ]] || cp .env.example .env
chmod 600 .env
docker compose config -q
docker compose up -d --build
echo "Open WebUI: http://127.0.0.1:3000"
echo "Site:       http://127.0.0.1:8081"
echo "App Node:   http://127.0.0.1:3002"
echo "FileBrowser:http://127.0.0.1:8080"
echo "API Ollama: http://127.0.0.1:11434"
echo "Modelo inicial: docker compose exec ollama ollama pull qwen2.5:3b"
