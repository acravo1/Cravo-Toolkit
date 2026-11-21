#!/usr/bin/env bash

set -u

SEARCH="${1:-}"
REPLACE="${2:-}"
ROOT="${3:-.}"

if [[ -z "$SEARCH" ]]; then
    echo
    echo "Uso:"
    echo "  $(basename "$0") <texto>"
    echo "  $(basename "$0") <texto_antigo> <texto_novo>"
    echo
    exit 1
fi

echo
echo "Root.....: $ROOT"
echo "Search...: $SEARCH"

[[ -n "$REPLACE" ]] && echo "Replace..: $REPLACE"

echo

sudo find "$ROOT" \
    -type f \
    \( \
        -name "*.yml" \
        -o -name "*.yaml" \
        -o -name "*.conf" \
        -o -name "*.json" \
        -o -name "*.env" \
        -o -name "*.cfg" \
        -o -name "*.ini" \
    \) \
    ! -path "*/.git/*" \
    ! -path "*/logs/*" \
    ! -path "*/snapshots/*" \
    ! -path "*/exports/*" \
    ! -path "*/node_modules/*" \
    -print0 |
while IFS= read -r -d '' file
do
    count=$(sudo grep -cF "$SEARCH" "$file" 2>/dev/null)

    if [[ "$count" -gt 0 ]]; then

        printf "[%3d] %s\n" "$count" "$file"

        if [[ -n "$REPLACE" ]]; then

            sudo cp -p "$file" "${file}.bak"

            sudo sed -i \
                "s|$SEARCH|$REPLACE|g" \
                "$file"

            echo "      backup : ${file}.bak"
            echo "      updated"
        fi
    fi
done
