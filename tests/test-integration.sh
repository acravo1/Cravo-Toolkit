#!/usr/bin/env bash

set -euo pipefail

###############################################################################
# CTK Integration Test
###############################################################################

TEST_ROOT="$HOME/tmp/ctk-test"
TEST_FILE="$TEST_ROOT/teste.conf"

SEARCH="192.168.168.10"
REPLACE="192.168.0.10"

PASS=0
FAIL=0

###############################################################################

ok()
{
    echo "[ OK ] $1"
    PASS=$((PASS + 1))
}

###############################################################################

ko()
{
    echo "[FAIL] $1"
    FAIL=$((FAIL + 1))
}

###############################################################################

assert_contains()
{
    local file="$1"
    local value="$2"

    if grep -qF "$value" "$file"
    then
        return 0
    fi

    return 1
}

###############################################################################

cleanup()
{
    rm -rf "$TEST_ROOT"
}

###############################################################################

trap cleanup EXIT

###############################################################################
# Preparação
###############################################################################

mkdir -p "$TEST_ROOT"

cat > "$TEST_FILE" <<EOF
server=192.168.168.10
backup=192.168.168.10
EOF

###############################################################################
# Teste 1 - ctk-find
###############################################################################

if ctk-find \
    --search "$SEARCH" \
    --root "$TEST_ROOT" \
    >/dev/null
then
    ok "ctk-find executado"
else
    ko "ctk-find executado"
fi

###############################################################################
# Teste 2 - ctk-replace DRY RUN
###############################################################################

if ctk-replace \
    --search "$SEARCH" \
    --replace "$REPLACE" \
    --root "$TEST_ROOT" \
    >/dev/null
then
    ok "ctk-replace dry-run"
else
    ko "ctk-replace dry-run"
fi

###############################################################################
# Teste 3 - ctk-replace APPLY
###############################################################################

printf "y\n" | ctk-replace \
    --search "$SEARCH" \
    --replace "$REPLACE" \
    --root "$TEST_ROOT" \
    --apply \
    >/dev/null

if assert_contains "$TEST_FILE" "$REPLACE"
then
    ok "ctk-replace apply"
else
    ko "ctk-replace apply"
fi

###############################################################################
# Teste 4 - CTKBU criado
###############################################################################

LATEST_BACKUP=$(ls -t "$HOME/.ctk_bu"/*.ctkbu 2>/dev/null | head -n1)

if [[ -n "${LATEST_BACKUP:-}" ]]
then
    ok "ctkbu criado"
else
    ko "ctkbu criado"
fi

###############################################################################
# Teste 5 - ctk-history
###############################################################################

if ctk-history >/dev/null
then
    ok "ctk-history"
else
    ko "ctk-history"
fi

###############################################################################
# Teste 6 - ctk-restore
###############################################################################

printf "y\n" | ctk-restore "$LATEST_BACKUP" >/dev/null

if assert_contains "$TEST_FILE" "$SEARCH"
then
    ok "ctk-restore"
else
    ko "ctk-restore"
fi

###############################################################################
# Resultado
###############################################################################

echo
echo "===================="
echo " CTK TEST SUMMARY"
echo "===================="
echo

echo "PASS: $PASS"
echo "FAIL: $FAIL"
echo

if [[ "$FAIL" -gt 0 ]]
then
    exit 1
fi

echo "Todos os testes passaram."

exit 0
