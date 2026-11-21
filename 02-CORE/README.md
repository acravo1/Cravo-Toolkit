# CORE

## Purpose

O CORE contém o conhecimento estrutural e permanente do CTK.

Esta pasta representa uma das Single Sources of Truth do sistema.

O conteúdo aqui armazenado descreve:

- arquitetura;
- princípios;
- contratos;
- decisões arquiteturais;
- templates;
- regras de funcionamento.

O CORE não contém contexto operacional diário nem histórico de sessões.

---

## What Belongs Here

Exemplos:

- ARCHITECTURE.md
- ADR.md
- INTERFACE-CONTRACT.md
- README-TEMPLATE.md
- outros documentos estruturais do sistema

---

## What Does Not Belong Here

Não devem existir nesta pasta:

- sessões
- notas temporárias
- ficheiros de trabalho
- exports
- snapshots
- artefactos gerados

Esses elementos pertencem a outras áreas do sistema.

---

## Relationship With Other Sources

### 01-PROJECTS

Contém o estado consolidado dos projetos.

Responde à pergunta:

"Em que estado estão os projetos?"

### 02-CORE

Contém as regras e arquitetura do sistema.

Responde à pergunta:

"Como funciona o sistema?"

### 03-SESSIONS

Contém a memória temporal.

Responde à pergunta:

"O que aconteceu recentemente?"

---

## Design Principles

### Context First

A preservação de contexto tem prioridade sobre documentação.

### Structure Over Configuration

Sempre que possível, a estrutura do repositório deve substituir ficheiros de configuração.

### Self Descriptive Repository

Um utilizador deve conseguir compreender a organização do sistema apenas observando a estrutura das pastas e os README.md.

### README As Entry Point

Cada diretório de primeiro nível deve possuir um README.md.

Esse README constitui o ponto oficial de entrada para o respetivo contexto.

---

## Single Sources Of Truth

As seguintes áreas são consideradas fontes de verdade:

```text
01-PROJECTS
02-CORE
03-SESSIONS
```

Todo o restante conteúdo deve ser considerado reconstruível ou derivado.

---

## Long Term Objective

Permitir que humanos e sistemas de IA recuperem rapidamente o contexto necessário para continuar trabalho complexo sem depender da memória das sessões anteriores.

## Bootstrap Context

O CTK utiliza quatro áreas principais:

- 01-PROJECTS
- 02-CORE
- 03-SESSIONS
- 04-LOGBOOK

As Single Sources Of Truth são:

- 01-PROJECTS
- 02-CORE
- 03-SESSIONS

Princípios principais:

- Context Preservation Is The Primary Purpose
- Workspace Is A View
- Structure Over Configuration
- README Is The Fundamental Context Unit

Fluxo principal:

ctk start
↓
CURRENT-CONTEXT.md
↓
Sessão
↓
SESSION-OUTPUT.md
↓
ctk ingest
↓
03-SESSIONS

00-WIP é uma área temporária e descartável.

## End Bootstrap Context
