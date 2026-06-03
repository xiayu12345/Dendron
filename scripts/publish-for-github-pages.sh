#!/usr/bin/env bash
set -euo pipefail
WS_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$WS_ROOT"

[[ -x /home/belon/.local/node/bin/npm ]] && export PATH="/home/belon/.local/node/bin:$PATH"
command -v npm >/dev/null || { echo "未找到 npm"; exit 1; }

if [[ ! -d node_modules/@dendronhq/dendron-cli ]]; then
  echo ">>> 安装依赖（见 package.json overrides）"
  npm install
fi

WS_ARG="--wsRoot $WS_ROOT"
if [[ ! -d .next ]]; then
  echo ">>> publish init"
  npx dendron publish init $WS_ARG --yes
fi

echo ">>> publish export (GitHub Pages: assetsPrefix=/Dendron)"
export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export NODE_ENV=production
npx dendron publish export $WS_ARG --target github --yes
echo "完成: $WS_ROOT/docs"
echo "站点: https://xiayu12345.github.io/Dendron/"
