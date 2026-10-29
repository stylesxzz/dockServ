#!/usr/bin/env bash
set -Eeuo pipefail
umask 077
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="${BACKUP_DIR:-$ROOT/backups}"
STAMP="$(date +%F_%H%M%S)"
mkdir -p "$DEST"
tar -czf "$DEST/dockserv-config-$STAMP.tar.gz" -C "$ROOT" compose.yaml .env.example .gitignore site apps scripts README.md LICENSE
find "$DEST" -type f -name 'dockserv-config-*.tar.gz' -mtime +14 -delete
echo "Backup de configurações concluído. Volumes e modelos exigem backup separado."
