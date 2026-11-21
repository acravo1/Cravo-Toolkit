#!/usr/bin/env bash

###############################################################################
# CTK Search Functions
###############################################################################

ctk_count_matches()
{
    local search="$1"
    local file="$2"

    grep -cF "$search" "$file" 2>/dev/null || true
}

###############################################################################

ctk_show_matches()
{
    local search="$1"
    local file="$2"

    grep -nF "$search" "$file" 2>/dev/null || true
}

###############################################################################

ctk_find_files()
{
    local root="${1:-.}"
    local all_files="${2:-0}"
    local extensions="${3:-}"

    local -a find_filter

    if [[ "$all_files" -eq 0 ]]
    then

        if [[ -z "$extensions" ]]
        then

            find_filter=(
                -name "*.yml"
                -o -name "*.yaml"
                -o -name "*.conf"
                -o -name "*.json"
                -o -name "*.env"
                -o -name "*.cfg"
                -o -name "*.ini"
                -o -name "*.xml"
            )

        else

            IFS=',' read -ra ext_list <<< "$extensions"

            local first=1

            for ext in "${ext_list[@]}"
            do
                ext=$(echo "$ext" | xargs)

                if [[ $first -eq 0 ]]
                then
                    find_filter+=(-o)
                fi

                find_filter+=(-name "*.${ext}")

                first=0
            done

        fi

    fi

    if [[ "$all_files" -eq 1 ]]
    then

        sudo find "$root" \
            -type f \
            ! -name "*.bak" \
            ! -path "*/.git/*" \
            ! -path "*/node_modules/*" \
            ! -path "*/logs/*" \
            ! -path "*/snapshots/*" \
            ! -path "*/exports/*" \
            ! -path "*/__pycache__/*" \
            -print0

    else

        sudo find "$root" \
            -type f \
            \( "${find_filter[@]}" \) \
            ! -name "*.bak" \
            ! -path "*/.git/*" \
            ! -path "*/node_modules/*" \
            ! -path "*/logs/*" \
            ! -path "*/snapshots/*" \
            ! -path "*/exports/*" \
            ! -path "*/__pycache__/*" \
            -print0

    fi
}
