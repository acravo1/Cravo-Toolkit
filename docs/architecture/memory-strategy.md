# Memory Strategy

## Objetivo

Preservar conhecimento operacional e arquitetural do ecossistema Cravo.

O sistema deverá permitir recuperar rapidamente:

- Estado atual
- Decisões passadas
- Descobertas relevantes
- Contexto dos projetos

independentemente da memória humana.

---

# Camadas de Memória

## Memória Operacional

Horizonte temporal:

Dias a semanas.

Objetivo:

Responder:

- O que estou a fazer?
- O que faço a seguir?

Estruturas:

- Current State
- Tasks
- Dashboard

---

## Memória Tática

Horizonte temporal:

Semanas a meses.

Objetivo:

Responder:

- O que foi decidido?
- Porque foi decidido?

Estruturas:

- Decisions
- Memory
- ADRs
- PDs

---

## Memória Histórica

Horizonte temporal:

Meses a anos.

Objetivo:

Responder:

- Como era anteriormente?
- O que mudou?

Estruturas:

- Snapshots
- Exports
- Git History

---

# Princípios

## Contexto antes de detalhe

O sistema deve fornecer primeiro:

- Estado Atual

e apenas depois:

- Histórico completo

---

## Não confiar na memória humana

Todas as decisões relevantes devem ser registadas.

---

## Uma única fonte de verdade

A informação operacional deve possuir uma SSOT.

Inicialmente:

workspace.xlsx

Possivelmente no futuro:

PostgreSQL + NocoDB

---

# Fluxo de Conhecimento

Descoberta
    ↓
Memory

Decisão
    ↓
Decision

Implementação
    ↓
Task

Consolidação
    ↓
Current State

Arquivo
    ↓
Snapshot / Export

---

# Visão Futura

Current State
        ↓
Utilizador

Current State
        ↓
Home Assistant

Current State
        ↓
Assistentes IA

Current State
        ↓
CTK

Todos consomem a mesma representação condensada do estado atual.