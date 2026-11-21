# Cravo Toolkit (CTK)

## Visão Geral

O Cravo Toolkit (CTK) é um conjunto de ferramentas para pesquisa, alteração,
auditoria e recuperação de configurações, concebido para administração do
homelab.

### Objetivos

- Localizar configurações rapidamente
- Efetuar alterações controladas
- Criar backups automáticos
- Manter histórico de alterações
- Permitir rollback seguro

---

## Arquitetura

```text
CTK
│
├── ctk-find
├── ctk-replace
├── ctk-history
├── ctk-restore
│
└── lib
    ├── ctk_functions.sh
    └── lib.d
        ├── 00-core.sh
        ├── 10-ui.sh
        ├── 20-search.sh
        ├── 30-ctkbu.sh
        ├── 40-replace.sh
        ├── 50-restore.sh
        └── 60-permissions.sh
```

---

## Componentes

### ctk-find

Pesquisa texto em ficheiros de configuração.

```bash
ctk-find --search "192.168.0.10"
```

### ctk-replace

Substituição controlada com preview, backup e modo APPLY.

```bash
ctk-replace --search ANTIGO --replace NOVO --show
```

```bash
ctk-replace --search ANTIGO --replace NOVO --apply
```

### ctk-history

Lista backups CTKBU.

```bash
ctk-history
```

### ctk-restore

Reposição de ficheiros através de backups CTKBU.

```bash
ctk-restore ID
```

---

## CTKBU

CTKBU significa:

```text
Cravo Toolkit Backup Unit
```

Localização:

```text
~/.ctk_bu
```

Metadados suportados:

```text
version
timestamp
tool
hostname
user
cwd
file
owner
group
mode
search
replace
sha256_before
```

---

## Estrutura Modular

### 00-core.sh

Funções base:

- ctk_timestamp
- ctk_hostname
- ctk_user
- ctk_sha256_file
- ctk_safe_hash

### 10-ui.sh

- ctk_print_header
- ctk_print_summary

### 20-search.sh

- ctk_count_matches
- ctk_show_matches
- ctk_find_files

### 30-ctkbu.sh

- ctkbu_create
- ctkbu_info
- ctkbu_extract
- ctkbu_get
- ctkbu_list

### 40-replace.sh

- ctk_preview_replacement
- ctk_replace_in_file

### 50-restore.sh

- ctk_restore_file
- ctk_restore_metadata

### 60-permissions.sh

- ctk_require_writable

---

## Fluxo de Trabalho

```text
ctk-find
    ↓
ctk-replace
    ↓
ctk-history
    ↓
ctk-restore
```

---

## Testes

```bash
~/git/Cravo-Toolkit/tests/test-integration.sh
```

Resultado esperado:

```text
PASS: 6
FAIL: 0
```

---

## Estado Atual

Implementado:

- ctk-find
- ctk-replace
- ctk-history
- ctk-restore
- CTKBU v2
- Modularização lib.d
- Teste de integração
