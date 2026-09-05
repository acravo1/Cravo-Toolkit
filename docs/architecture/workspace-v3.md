# Workspace V3

## Objetivo

Definir a estrutura da futura SSOT operacional do ecossistema Cravo.

O workspace deverá funcionar como:

- Fonte de Verdade operacional
- Protótipo de modelo de dados
- Interface humana inicial

A implementação futura poderá migrar para:

- PostgreSQL
- NocoDB

sem alteração do modelo conceptual.

---

# Folhas

## Projects

Representa os projetos ativos.

Campos:

- ProjectID
- Name
- Description
- Repository
- Status
- Active

Exemplos:

- AEGIS
- CTK
- Homelab
- Home Assistant

---

## Tasks

Representa trabalho executável.

Campos:

- TaskID
- ProjectID
- Category
- Status
- Priority
- Title
- Notes
- CreatedDate
- UpdatedDate

Dropdowns:

Status:
- BACKLOG
- READY
- INPROGRESS
- BLOCKED
- DONE

Priority:
- LOW
- MEDIUM
- HIGH
- CRITICAL

Category:
- Hardware
- Firmware
- Mechanical
- Infrastructure
- Documentation
- Research

---

## Decisions

Representa decisões aceites.

Campos:

- DecisionID
- Date
- ProjectID
- Category
- Description
- Impact
- RelatedDocument

---

## Components

Representa hardware ou software relevante.

Campos:

- ComponentID
- ProjectID
- Name
- Type
- Quantity
- Status
- Location
- Notes

---

## Memory

Representa conhecimento relevante acumulado.

Campos:

- MemoryID
- Date
- ProjectID
- Type
- Description

Tipos:

- Discovery
- Idea
- Risk
- Observation

---

## Snapshots

Representa snapshots de contexto.

Campos:

- SnapshotID
- Date
- Description
- Location

---

## Infrastructure

Representa elementos permanentes do ecossistema.

Campos:

- Item
- Category
- Value
- Notes

Exemplos:

- DuckDNS
- WireGuard
- Authentik
- Home Assistant
- Nginx Proxy Manager

---

## Repositories

Representa repositórios Git.

Campos:

- RepositoryID
- Name
- Path
- Active

---

## Settings

Representa configuração operacional.

Campos:

- Key
- Value

---

## Dashboard

Folha de visualização.

Não constitui Fonte de Verdade.

Consome dados de:

- Projects
- Tasks
- Decisions
- Components
- Snapshots