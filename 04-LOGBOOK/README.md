# LOGBOOK

## Purpose

O Logbook preserva a história operacional dos projetos.

O seu objetivo não é armazenar conhecimento consolidado.

O seu objetivo não é armazenar decisões arquiteturais.

O seu objetivo é registar:

- contexto;
- investigação;
- descobertas;
- raciocínio;
- alternativas consideradas;
- conclusões de trabalho.

O Logbook responde à pergunta:

"Como chegámos aqui?"

---

## Role In The System

O Logbook funciona como a memória operacional do sistema.

Permite compreender:

- o que aconteceu;
- porque aconteceu;
- que opções foram analisadas;
- que conclusões foram obtidas.

A informação do Logbook é histórica.

Nem toda a informação aqui registada precisa de ser promovida para artefactos permanentes.

---

## Relationship With Other Sources

### 01-PROJECTS

Responde:

```text
Em que estado está o projeto?
```

### 02-CORE

Responde:

```text
Como funciona o sistema?
Porque tomámos determinadas decisões?
```

### 03-SESSIONS

Responde:

```text
O que aconteceu durante uma sessão específica?
```

### 04-LOGBOOK

Responde:

```text
Como evoluiu o trabalho ao longo do tempo?
```

---

## Logbook vs Sessions

As sessões representam a interação entre:

```text
Utilizador
↔
Copilot
```

O Logbook representa a evolução efetiva do trabalho.

Nem todas as sessões produzem entradas de Logbook.

Nem todas as entradas de Logbook resultam diretamente de uma sessão.

---

## Structure

Cada entrada é armazenada num ficheiro independente.

Exemplo:

```text
04-LOGBOOK/

    2026-09-06-cks-context-preservation.md

    2026-09-07-aegis-mavlink.md
```

---

## Naming Convention

Formato recomendado:

```text
YYYY-MM-DD-topic.md
```

Exemplos:

```text
2026-09-07-aegis-mavlink.md

2026-09-15-context-builder.md

2026-09-20-moradia-water-system.md
```

---

## Recommended Content

Uma entrada de Logbook deverá conter:

- Context
- Activity
- Discoveries
- Conclusions
- Decisions
- Risks
- Next Actions

Opcionalmente:

- Promote To ADR
- Promote To Project
- Promote To Core

---

## Design Principle

Registar raciocínio enquanto ainda está fresco.

O valor principal do Logbook não está nas conclusões.

O valor principal do Logbook está no percurso que levou às conclusões.

---

## Promotion

Informação particularmente relevante poderá ser promovida para:

```text
01-PROJECTS
```

ou

```text
02-CORE
```

A promoção deve ser deliberada.

O Logbook não deve ser tratado como uma área temporária.

---

## Long Term Objective

Permitir compreender a evolução de um projeto