# INTERFACE CONTRACT

## Purpose

Este documento define a interface oficial entre:

- Utilizador
- Copilot
- CTK

O objetivo é garantir uma passagem de contexto consistente entre sessões.

---

## Core Principle

A interface deve permanecer simples.

Alterações a este contrato devem ser raras e deliberadas.

---

## Workspace

A área de trabalho ativa da sessão é:

```text
00-WIP/
```

O conteúdo desta pasta é considerado temporário e reconstruível.

---

## Files

A interface oficial é composta por apenas dois ficheiros.

### INPUT

```text
CURRENT-CONTEXT.md
```

Representa o contexto reconstruído pelo CTK para iniciar uma nova sessão.

Deve conter apenas a informação necessária para recuperar rapidamente o estado mental de trabalho.

---

### OUTPUT

```text
SESSION-OUTPUT.md
```

Representa o resultado contextual da sessão atual.

Deve capturar:

- decisões tomadas;
- alterações relevantes;
- questões abertas;
- próximos passos;
- impacto a longo prazo.

---

## Information Flow

```text
01-PROJECTS
+
02-CORE
+
03-SESSIONS

↓

CTK

↓

CURRENT-CONTEXT.md

↓

Sessão de Trabalho

↓

SESSION-OUTPUT.md

↓

CTK

↓

03-SESSIONS
```

---

## Responsibilities

### CTK

Responsável por:

- reconstruir contexto;
- preservar sessões;
- manter continuidade operacional.

---

### Copilot

Responsável por:

- interpretar CURRENT-CONTEXT.md;
- auxiliar o utilizador;
- produzir SESSION-OUTPUT.md quando solicitado.

---

### Utilizador

Responsável por:

- validar decisões;
- atualizar informação dos projetos;
- aprovar alterações estruturais.

---

## Session Start

Uma nova sessão inicia-se através da leitura de:

```text
CURRENT-CONTEXT.md
```

---

## Session End

Uma sessão termina com a produção de:

```text
SESSION-OUTPUT.md
```

---

## Stability Requirement

A estrutura de:

```text
CURRENT-CONTEXT.md
```

e

```text
SESSION-OUTPUT.md
```

deve permanecer tão estável quanto possível.

Alterações devem ser raras e justificadas.

---

## Design Goals

### Simplicity

A interface deve ser mínima.

### Continuity

A interface deve preservar contexto entre sessões.

### Recoverability

O estado de trabalho deve poder ser reconstruído após interrupções.

### Low Maintenance

A interface deve exigir o mínimo possível de configuração manual.

---

## Bootstrap Context

### Interface Contract

- CURRENT-CONTEXT.md é o ficheiro de entrada oficial da sessão.
- SESSION-OUTPUT.md é o ficheiro de saída oficial da sessão.
- A interface deve permanecer simples.
- Alterações estruturais devem ser raras e deliberadas.
- A continuidade entre sessões é o principal objetivo operacional.

## End Bootstrap Context

---

## One Sentence Summary

O contrato da interface CTK baseia-se em dois ficheiros:

CURRENT-CONTEXT.md para iniciar uma sessão.

SESSION-OUTPUT.md para terminar uma sessão.