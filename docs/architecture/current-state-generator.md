# Current State Generator

## Objetivo

Produzir uma representação condensada do estado atual do ecossistema Cravo.

O Current State não é uma base de dados.

O Current State não é um snapshot.

O Current State é uma visão resumida e operacional do momento atual.

---

# Origens dos Dados

## Projects

Fonte:

- Projects

---

## Tasks

Fonte:

- Tasks

Critério:

- READY
- INPROGRESS
- BLOCKED

Prioridade para:

- CRITICAL
- HIGH

---

## Decisions

Fonte:

- Decisions

Limite inicial:

- Últimas 10

---

## Discoveries

Fonte:

- Memory

Tipos:

- Discovery
- Observation

Limite inicial:

- Últimas 10

---

## Risks

Fonte:

- Memory

Tipo:

- Risk

---

## Components

Fonte:

- Components

Agrupar por:

- Available
- Ordered
- Missing

---

## Infrastructure

Fonte:

- Infrastructure

Campos relevantes:

- VPN
- DDNS
- Home Assistant
- Nginx Proxy Manager
- Authentik

---

# Processo

Dados
    ↓
Filtragem
    ↓
Priorização
    ↓
Current State
    ↓
Output

---

# Outputs

## Markdown

current-state.md

Utilização:

- Documentação
- GitHub
- IA

---

## JSON

current-state.json

Utilização:

- CTK
- Home Assistant
- Scripts

---

## HTML

current-state.html

Utilização:

- Homelab
- Dashboard
- Consulta rápida

---

# Comando

ctk push current-state

---

# Execução prevista

1. Ler fonte de verdade
2. Construir Current State
3. Gerar outputs
4. Publicar no destino configurado

---

# Filosofia

A geração do Current State deve reduzir milhares de linhas de documentação para alguns minutos de leitura.

O objetivo é responder rapidamente:

- Onde estamos?
- O que mudou?
- O que fazemos a seguir?