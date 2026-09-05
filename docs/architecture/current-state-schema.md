# Current State Schema

## Objetivo

Definir a estrutura canónica do Current State.

O Current State representa uma visão condensada e atual do ecossistema Cravo.

Não substitui:

- Snapshots
- Exports
- Documentação

O seu objetivo é fornecer contexto operacional rápido.

---

# Estrutura

## Metadata

- GeneratedDate
- GeneratedBy
- Version

---

# Projects

Para cada projeto:

- Name
- Status
- Phase
- ActiveTasks
- LastDecision
- NextAction

---

# Tasks Summary

Por projeto:

- Backlog
- Ready
- In Progress
- Blocked
- Done

---

# Recent Decisions

Limite inicial:

- Últimas 10 decisões

Campos:

- Date
- Project
- Description

---

# Active Risks

Limite inicial:

- 10 riscos

Campos:

- Project
- Description
- Severity

---

# Components

Para cada projeto:

- Available
- Ordered
- Missing

---

# Infrastructure

Estado relevante:

- DDNS
- VPN
- Nginx Proxy Manager
- Authentik
- Home Assistant

---

# Recent Discoveries

Últimas observações relevantes.

Exemplos:

- Encoders exigem compensação de altura
- Zigbee pode servir como landmark
- USB nos recortes do chassis

---

# Next Actions

Lista consolidada de ações recomendadas.

Limite inicial:

- Top 10

Ordenação:

1. CRITICAL
2. HIGH
3. MEDIUM
4. LOW

---

# Output Formats

## JSON

Consumo por:

- CTK
- Home Assistant
- Scripts

## Markdown

Consumo por:

- GitHub
- Documentação
- IA

## HTML

Consumo por:

- Utilizador
- Homelab