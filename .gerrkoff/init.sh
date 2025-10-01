#!/bin/bash
# Usage: curl -fsSL https://raw.githubusercontent.com/gerrkoff/coding-standards/main/.gerrkoff/init.sh | bash

set -e

REPO_URL="https://github.com/gerrkoff/coding-standards"
TEMP_DIR=$(mktemp -d)

DIRECTORIES=(
  ".devcontainer"
  ".gerrkoff"
)

echo "🚀 Initializing environment from $REPO_URL"

copy_directory() {
  local dir_name=$1
  local source_path=$2

  echo "📦 Syncing $dir_name..."

  cd "$TEMP_DIR"
  rm -rf temp-repo

  git clone --depth 1 --filter=blob:none --sparse "$REPO_URL" temp-repo 2>/dev/null
  cd temp-repo
  git sparse-checkout set "$source_path"

  cd "$OLDPWD"
  if [ -d "temp-repo/$source_path" ]; then
    mkdir -p "../$dir_name"
    cp -rf "temp-repo/$source_path/." "../$dir_name/"

    if [ -d "../$dir_name" ]; then
      echo "✅ $dir_name synced"
    else
      echo "❌ Failed to sync $dir_name"
    fi
  else
    echo "❌ Failed to find $source_path in repository"
  fi
}

cd "$(dirname "$0")/.." 2>/dev/null || true

for dir in "${DIRECTORIES[@]}"; do
  copy_directory "$dir" "$dir"
done

rm -rf "$TEMP_DIR"

echo ""
echo "✨ Initialization complete!"
echo ""
echo "📝 Next steps: Use .gerrkoff/sync.sh to sync configuration files"
echo ""
