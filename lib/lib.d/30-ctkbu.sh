#!/usr/bin/env bash

###############################################################################
# CTK Backup Format (.ctkbu)
###############################################################################

ctkbu_create()
{
    local file="$1"
    local search="${2:-}"
    local replace="${3:-}"

    local backup_dir="$HOME/.ctk_bu"

    mkdir -p "$backup_dir"

    local timestamp
    timestamp=$(ctk_timestamp)

    local hostname_
    hostname_=$(ctk_hostname)

    local user_
    user_=$(ctk_user)

    local cwd_
    cwd_=$(pwd)

    local sha_before
    sha_before=$(ctk_sha256_file "$file")

    local owner
    owner=$(stat -c '%U' "$file")

    local group
    group=$(stat -c '%G' "$file")

    local mode
    mode=$(stat -c '%a' "$file")

    local hash
    hash=$(ctk_safe_hash \
        "$timestamp" \
        "$file" \
        "$search" \
        "$replace")

    local backup_file
    backup_file="${backup_dir}/${timestamp}_${hash}.ctkbu"

    {
        echo "---CTKBU-METADATA---"

        echo "version=2"

        echo "timestamp=${timestamp}"
        echo "tool=ctk-replace"

        echo "hostname=${hostname_}"
        echo "user=${user_}"
        echo "cwd=${cwd_}"

        echo "file=${file}"

        echo "owner=${owner}"
        echo "group=${group}"
        echo "mode=${mode}"

        echo "search=${search}"
        echo "replace=${replace}"

        echo "sha256_before=${sha_before}"

        echo "---CTKBU-DATA---"

        cat "$file"

    } > "$backup_file"

    echo "$backup_file"
}

###############################################################################

ctkbu_info()
{
    local backup="$1"

    sed -n \
        '/^---CTKBU-METADATA---$/,/^---CTKBU-DATA---$/p' \
        "$backup"
}

###############################################################################

ctkbu_extract()
{
    local backup="$1"

    sed '1,/^---CTKBU-DATA---$/d' \
        "$backup"
}

###############################################################################

ctkbu_get()
{
    local backup="$1"
    local key="$2"

    grep "^${key}=" "$backup" \
        | head -n1 \
        | cut -d= -f2-
}

###############################################################################

ctkbu_list()
{
    local backup_dir="$HOME/.ctk_bu"

    printf "%-38s %-8s %s\n" \
        "BACKUP" \
        "SIZE" \
        "FILE"

    printf "%-38s %-8s %s\n" \
        "--------------------------------------" \
        "--------" \
        "--------------------------------"

    for backup in "$backup_dir"/*.ctkbu
    do

        [[ -f "$backup" ]] || continue

        local name
        name=$(basename "$backup" .ctkbu)

        local size
        size=$(du -h "$backup" | awk '{print $1}')

        local file
        file=$(grep '^file=' "$backup" \
            | cut -d= -f2-)

        printf "%-38s %-8s %s\n" \
            "$name" \
            "$size" \
            "$file"

    done
}
