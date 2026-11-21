#!/usr/bin/env bash

###############################################################################
# Restore Functions
###############################################################################

ctk_restore_file()
{
    local backup="$1"
    local target="$2"

    local temp_file

    temp_file=$(mktemp)

    ctkbu_extract "$backup" > "$temp_file"

    cp "$temp_file" "$target"

    rm -f "$temp_file"
}

###############################################################################

ctk_restore_metadata()
{
    local backup="$1"
    local target="$2"

    local owner
    owner=$(ctkbu_get "$backup" owner || true)

    local group
    group=$(ctkbu_get "$backup" group || true)

    local mode
    mode=$(ctkbu_get "$backup" mode || true)

    if [[ -n "$mode" ]]
    then
        chmod "$mode" "$target" 2>/dev/null || true
    fi

    if [[ -n "$owner" && -n "$group" ]]
    then
        chown "$owner:$group" "$target" 2>/dev/null || true
    fi
}
