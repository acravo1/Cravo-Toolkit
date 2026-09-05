# Data Model

## Objetivo

Definir o modelo de dados comum a:

- workspace.xlsx
- PostgreSQL
- NocoDB
- Current State
- CTK

---

# Project

Representa uma área funcional de trabalho.

Exemplos:

- AEGIS
- CTK
- Homelab
- Home Assistant

Campos:

- ProjectID
- Name
- Description
- Repository
- Status
- Active

---

# Task

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

---

# Decision

Representa uma decisão aceite.

Campos:

- DecisionID
- ProjectID
- Date
- Category
- Description
- Impact
- RelatedDocument

Exemplos:

- USB de manutenção
- Reserva para segundo TB6612FNG
- ESP32-S3 + RP2040

---

# Component

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

# Memory

Representa conhecimento relevante obtido durante o projeto.

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

# Snapshot

Representa uma fotografia histórica.

Campos:

- SnapshotID
- Date
- Description
- Location

---

# Repository

Representa um repositório Git.

Campos:

- RepositoryID
- Name
- Path
- Active

---

# Setting

Representa configuração operacional.

Campos:

- Key
- Value

---

# Infrastructure

Representa elementos estáveis do ecossistema.

Campos:

- Item
- Category
- Value

Exemplos:

- DuckDNS
- WireGuard
- ER605
- Nginx Proxy Manager
- Authentik