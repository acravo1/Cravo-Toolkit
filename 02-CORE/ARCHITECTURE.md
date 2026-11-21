# CTK Architecture

## Purpose

O objetivo principal do CTK é preservar contexto entre sessões.

O objetivo não é produzir documentação.

O objetivo não é produzir conhecimento.

O objetivo é permitir que trabalho complexo e de longa duração possa ser retomado com o mínimo de perda de contexto possível.

---

## Core Principle

Contexto é o ativo principal do sistema.

Documentação, exportações e artefactos gerados existem para suportar a preservação de contexto.

---

## Workspace Is A View

O Workspace não é o sistema.

O Workspace é uma representação do sistema.

O sistema real é constituído pelas fontes de verdade persistentes.

---

## Single Sources Of Truth

As únicas fontes de verdade do sistema são:

### 01-PROJECTS

Representa:

- estado dos projetos;
- visão dos projetos;
- contexto consolidado.

Cada projeto deve possuir um README.md.

O README é a unidade fundamental de contexto de um projeto.

### 02-CORE

Representa:

- arquitetura;
- regras;
- ADR;
- contratos;
- templates.

### 03-SESSIONS

Representa:

- memória temporal;
- histórico das sessões;
- contexto recente.

---

## Workspace

00-WIP é uma área de trabalho temporária.

O seu conteúdo deve ser considerado reconstruível.

Pode ser recriado automaticamente através de:

ctk start

Conteúdo típico:

- CURRENT-CONTEXT.md
- SESSION-OUTPUT.md
- artefactos temporários

---

## Information Flow

Início da sessão:

01-PROJECTS
+
02-CORE
+
03-SESSIONS

↓

Context Builder

↓

CURRENT-CONTEXT.md

↓

Trabalho

↓

SESSION-OUTPUT.md

↓

INGEST

↓

03-SESSIONS

Fim da sessão.

---

## Rule #8

Archive First.
Interpret Later.

Nenhuma sessão deve ser perdida.

O arquivo de sessões tem prioridade sobre qualquer promoção automática.

---

## Architecture Principles

### Principle 1

Conversations are not memory.

### Principle 2

Workspace is a view.

### Principle 3

Context has priority over documentation.

### Principle 4

Structure should be self-descriptive.

### Principle 5

Configuration should be avoided whenever structure is sufficient.

### Principle 6

Projects should be auto-discovered from the directory structure.

### Principle 7

README.md is the fundamental context unit of a project.

---

## Project Discovery

A estrutura:

01-PROJECTS/

    Project/
        README.md

é suficiente para identificar um projeto.

Não devem ser necessários ficheiros de mapeamento para descoberta de projetos.

---

## Long Term Vision

A estrutura do sistema deve permitir:

- reconstrução rápida de contexto;
- redução de dependência da memória humana;
- redução de dependência da memória da IA;
- continuidade operacional entre sessões.