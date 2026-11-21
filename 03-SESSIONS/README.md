# SESSIONS

## Purpose

Esta pasta contém o registo cronológico das sessões de trabalho.

Representa uma das Single Sources of Truth (SSoT) do sistema.

O objetivo desta área não é armazenar conhecimento consolidado.

O objetivo é preservar contexto recente.

---

## Role In The System

As sessões registam:

- o que foi discutido;
- o que mudou;
- decisões tomadas;
- questões em aberto;
- próximos passos.

Cada sessão representa um ponto temporal específico.

---

## Relationship With Other Sources

### 01-PROJECTS

Representa:

```text
Estado atual dos projetos.
```

### 02-CORE

Representa:

```text
Arquitetura.
Princípios.
ADR.
Contratos.
Templates.
```

### 03-SESSIONS

Representa:

```text
Memória temporal.
Contexto recente.
```

### 04-LOGBOOK

Representa:

```text
História operacional.
Investigação.
Raciocínio.
```

---

## Session Lifecycle

### Start

O CTK utiliza:

```text
01-PROJECTS
+
02-CORE
+
03-SESSIONS
```

para gerar:

```text
CURRENT-CONTEXT.md
```

---

### Work

Durante a sessão:

```text
CURRENT-CONTEXT.md
```

serve de contexto de entrada.

---

### End

No final da sessão é produzido:

```text
SESSION-OUTPUT.md
```

O conteúdo é posteriormente promovido para:

```text
03-SESSIONS
```

através do processo de ingest.

---

## Naming Convention

Formato recomendado:

```text
YYYY-MM-DD-topic.md
```

Exemplos:

```text
2026-09-15-ctk-architecture.md

2026-09-16-context-builder.md

2026-09-17-ingest-v2.md
```

---

## Design Principles

### Archive First

Nenhuma sessão deve ser perdida.

A preservação da sessão tem prioridade sobre qualquer processamento adicional.

---

### Context Before Interpretation

Primeiro preservar.

Depois analisar.

Depois promover.

---

### Sessions Are Immutable

Uma sessão representa um instante temporal.

Depois de arquivada, deve ser considerada uma observação histórica.

---

## Structure

Cada sessão corresponde a um único ficheiro.

Exemplo:

```text
03-SESSIONS/

    README.md

    2026-09-15-ctk-architecture.md

    2026-09-16-context-builder.md

    2026-09-17-ingest-v2.md
```

---

## Recommended Content

Uma sessão deverá conter:

- Current Focus
- What Changed
- Decisions Made
- Open Questions
- Next Session
- Long Term Impact

---

## Relationship With The Copilot

A interface entre o utilizador e o Copilot produz:

```text
SESSION-OUTPUT.md
```

As sessões arquivadas constituem a memória temporal utilizada pelo sistema para reconstruir contexto em futuras sessões.

---

## Long Term Objective

Permitir que uma nova sessão consiga recuperar rapidamente:

- contexto recente;
- decisões recentes;
- problemas em aberto;
- trabalho pendente;

sem depender do histórico completo da conversa.

As sessões representam a memória de curto e médio prazo do sistema.

## Bootstrap Context

As sessões podem conter um bloco:

## Bootstrap Context
...
## End Bootstrap Context

Este bloco representa o resumo operacional da sessão.

O Context Builder deverá utilizar preferencialmente estes blocos em vez do conteúdo completo das sessões.

## End Bootstrap Context

