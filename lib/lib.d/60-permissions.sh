#!/usr/bin/env bash

###############################################################################
# Permissions Functions
###############################################################################

ctk_require_writable()
{
    local file="$1"

    if [[ -w "$file" ]]
    then
        return 0
    fi

    echo
    echo "ERRO"
    echo "-----"
    echo "Sem permissões de escrita:"
    echo "$file"
    echo
    echo "Sugestão:"
    echo " executar com sudo"
    echo

    return 1
}
