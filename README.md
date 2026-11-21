# Cravo Toolkit (CTK)

CTK (Cravo Toolkit) is a collection of Bash and PowerShell tools for homelab administration, configuration auditing, controlled replacements, backup management and rollback operations.

## Features

- Configuration search
- Safe search and replace
- Automatic backups
- Change history
- Rollback support
- Modular architecture
- Integration testing

## Components

### Commands

- ctk-find
- ctk-replace
- ctk-history
- ctk-restore

### Library Modules

- 00-core.sh
- 10-ui.sh
- 20-search.sh
- 30-ctkbu.sh
- 40-replace.sh
- 50-restore.sh
- 60-permissions.sh

## Architecture

```text
bin/
  ctk-find
  ctk-replace
  ctk-history
  ctk-restore

lib/
  ctk_functions.sh
  lib.d/
    00-core.sh
    10-ui.sh
    20-search.sh
    30-ctkbu.sh
    40-replace.sh
    50-restore.sh
    60-permissions.sh

tests/
  test-integration.sh

docs/
  toolkit-manual.md
  CTKBU-Specification.md
```

## Workflow

```text
ctk-find
    ↓
ctk-replace
    ↓
ctk-history
    ↓
ctk-restore
```

## Testing

```bash
~/git/Cravo-Toolkit/tests/test-integration.sh
```

Expected result:

```text
PASS: 6
FAIL: 0
```

## CTKBU

The native backup format used by CTK.

Stored under:

```text
~/.ctk_bu/
```

See:

- toolkit-manual.md
- CTKBU-Specification.md

## Status

Stable
# Cravo-Toolkit
Shared tooling, automation, templates and workflows for the Cravo ecosystem.
