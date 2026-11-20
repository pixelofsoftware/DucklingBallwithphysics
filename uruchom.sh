#!/bin/bash
# Uruchom grę Piłki z fizyką (macOS). `./uruchom.sh testy` uruchamia testy świata fizyki.
set -euo pipefail
cd "$(dirname "$0")"
command -v duck >/dev/null || export PATH="$HOME/.local/share/duckling/bin:$PATH"
command -v duck >/dev/null || { echo "Brak narzędzia duck: zainstaluj Ducklinga (install.py z paczki)." >&2; exit 2; }
[ -f zewnetrzne/grafika/quackconfig.yaml ] && [ -f zewnetrzne/fizyka/quackconfig.yaml ] || ./przygotuj_macos.sh
if [ "${1:-}" = "testy" ]; then
    cd testy && exec duck run
fi
cd gra && exec duck run
