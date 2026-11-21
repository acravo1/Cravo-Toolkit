# CTKBU Specification

Version: 2

## Overview

CTKBU (Cravo Toolkit Backup Unit) is the native backup format used by the Cravo Toolkit.

## File Extension

`.ctkbu`

## Storage Location

`~/.ctk_bu/`

## Filename Format

`<TIMESTAMP>_<HASH>.ctkbu`

Example:

`20261121T102034Z_31b457c82c395b4a.ctkbu`

## Internal Structure

```text
---CTKBU-METADATA---
(metadata)
---CTKBU-DATA---
(file contents)
```

## Metadata Fields

- version
- timestamp
- tool
- hostname
- user
- cwd
- file
- owner
- group
- mode
- search
- replace
- sha256_before

## Example

```text
---CTKBU-METADATA---
version=2
timestamp=20261121T102034Z
tool=ctk-replace
hostname=lenovohomelab
user=hladmin
cwd=/home/hladmin
file=/srv/data/example.conf
owner=root
group=root
mode=644
search=old
replace=new
sha256_before=<hash>
---CTKBU-DATA---
(original contents)
```

## Recovery Flow

1. Read metadata
2. Extract data section
3. Restore file contents
4. Restore owner/group/mode

## Supported Functions

- ctkbu_create
- ctkbu_info
- ctkbu_extract
- ctkbu_get
- ctkbu_list
- ctk-restore

## Compatibility

### Version 1

Without owner/group/mode.

### Version 2

Adds:

- owner
- group
- mode

## Status

Stable
