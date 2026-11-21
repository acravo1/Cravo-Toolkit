#!/usr/bin/env bash

###############################################################################
# CTK UI Functions
###############################################################################

ctk_print_header()
{
    local root="${1:-.}"
    local search="${2:-}"
    local extensions="${3:-}"
    local all_files="${4:-0}"

    echo

    echo "Root.......: $root"
    echo "Search.....: $search"

    if [[ "$all_files" -eq 1 ]]
    then
        echo "Extensions.: ALL"

    elif [[ -n "$extensions" ]]
    then
        echo "Extensions.: $extensions"
    fi

    echo
}

###############################################################################

ctk_print_summary()
{
    local files="${1:-0}"
    local matches="${2:-0}"

    echo
    echo "Resumo"
    echo "-------"
    echo "Ficheiros : $files"
    echo "Ocorrências: $matches"
    echo
}
