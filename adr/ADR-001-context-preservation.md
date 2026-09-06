# ADR-001

Title

CKS Exists To Preserve Context

Status

Accepted

Date

2026-09-06

---

## Context

Durante a análise dos repositórios:

- Cravo-Toolkit
- AEGIS
- Home-Assistant
- Homelab

foi efetuado um exercício de reconstrução de contexto após perda parcial da informação de sessões anteriores.

Verificou-se que a documentação existente permitia recuperar grande parte do conhecimento técnico dos projetos.

No entanto, algumas conclusões importantes de sessões recentes não puderam ser recuperadas facilmente porque não tinham sido promovidas para artefactos permanentes.

---

## Problem

O modelo inicial focava-se principalmente em:

- documentação
- exportação
- representação do conhecimento

Mas não abordava explicitamente a preservação de contexto entre sessões.

O conhecimento produzido em conversas podia desaparecer após o encerramento da sessão.

---

## Decision

O objetivo principal do CKS passa a ser:

Preservação de contexto.

A documentação continua a existir, mas passa a ser um mecanismo de suporte e não o objetivo principal do sistema.

O CKS deverá garantir que:

- conhecimento importante é preservado
- decisões são preservadas
- contexto operacional é preservado
- sessões futuras conseguem recuperar rapidamente o estado do projeto

---

## Consequences

Passam a existir como entidades de primeira classe:

- ADR
- Current State
- Knowledge
- Logbook

Os fluxos futuros devem privilegiar:

Conversation
    ↓
Logbook
    ↓
Knowledge / ADR / Current State
    ↓
Generated Artefacts

---

## Benefits

- Menor perda de contexto.
- Menor dependência da memória humana.
- Menor dependência da memória da IA.
- Recuperação mais rápida de sessões.
- Continuidade operacional.

---

## Risks

Possível aumento da quantidade de artefactos.

Necessidade de definir regras claras para promoção de informação entre:

- Logbook
- Knowledge
- ADR
- Current State

---

## Related Artefacts

current-state/cks.md

knowledge/knowledge-001-context-preservation.md

logbook/2026-09-06-cks-context-preservation.md

---

## One Sentence Summary

The primary purpose of CKS is preserving context between sessions.