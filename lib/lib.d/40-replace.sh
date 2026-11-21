#!/usr/bin/env bash

###############################################################################
# Replace Functions
###############################################################################

ctk_preview_replacement()
{
    local file="$1"
    local search="$2"
    local replace="$3"

    while IFS= read -r line
    do
        local line_no
        line_no=$(echo "$line" | cut -d: -f1)

        local content
        content=$(echo "$line" | cut -d: -f2-)

        local replacement
        replacement="${content//$search/$replace}"

        echo "${line_no}: ${content}"
        echo " -> ${replacement}"
        echo

    done < <(

        ctk_show_matches \
            "$search" \
            "$file"

    )
}

###############################################################################

ctk_replace_in_file()
{
    local file="$1"
    local search="$2"
    local replace="$3"

    perl -0pi \
        -e 's/\Q'"$search"'\E/'"$replace"'/g' \
        "$file"

    return $?
}
