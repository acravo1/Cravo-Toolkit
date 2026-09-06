# Bootstrap Context

Generated: 2026-09-06 18:58:27

============================================================
CURRENT STATE
============================================================


FILE: cks.md

Current State

Project: CKS

Status: Active

Phase: Architecture and Operationalization

Last Updated: 2026-09-06

Purpose

CKS (Cravo Knowledge System) exists to preserve context between work sessions.

The objective is not documentation.

The objective is preventing context loss and reducing the effort required to recover project knowledge in future sessions.

Vision

Any future session should be able to recover enough context to continue productive work within minutes.

The system should allow both humans and AI systems to understand:

Where a project currently stands
How it reached the current state
What is currently being discussed
Which decisions were made
What remains to be done

without relying on memory or previous conversations.

Current Understanding

The project has evolved from a documentation-centric approach into a context-preservation approach.

Documentation alone is insufficient.

Additional artefacts are required to preserve reasoning, discoveries and operational context.

The current conceptual model is:

Conversation

↓

Logbook

↓

Knowledge ADR Current State

↓

Generated Artefacts

Core Concepts
Documentation

Explains how something works.

ADR

Explains why a decision was taken.

Current State

Explains where the project currently stands.

Knowledge

Captures discoveries, insights, lessons learned and patterns.

Logbook

Captures recent activity that has not yet been promoted to permanent knowledge.

Repository Structure

Current structure:

adr/
current-state/
knowledge/
logbook/
generated/
docs/
templates/
exporters/
modules/
Validated Concepts

The following concepts are considered validated:

Repository export workflow
Multi-repository aggregation
Context reconstruction using exports
Current State as first-class entity
Knowledge as first-class entity
Logbook as first-class entity
Bootstrap context generation
Maritime watch-log analogy
Working Principles
Principle 1

Conversations are not memory.

Principle 2

Knowledge must be promoted out of conversations.

Principle 3

Current State must represent reality.

Principle 4

Generated artefacts are never the source of truth.

Principle 5

Workspace is a representation.

Workspace is not the system.

Principle 6

The cost of context recovery should continuously decrease over time.

Current Problems
Context Loss

Important conclusions can disappear when they are not promoted to permanent artefacts.

Knowledge Capture

There is not yet a formal workflow for transforming conversations into knowledge.

Bootstrap Generation

Bootstrap generation still needs implementation.

Export Scope

Repository exports still require optimisation and better exclusion of generated artefacts.

Recent Discoveries
Discovery 001

The primary problem is context preservation.

Discovery 002

Workspace should be treated as a view.

Discovery 003

Logbook acts as the bridge between conversation and knowledge.

Discovery 004

The maritime watch-log model provides an accurate operational analogy.

Current Priorities

Priority 1

Formalise Logbook workflow.

Priority 2

Formalise Current State workflow.

Priority 3

Formalise Knowledge workflow.

Priority 4

Create Bootstrap Context generation.

Priority 5

Improve export performance and filtering.

Planned Commands

Planned CTK commands:

ctk logbook
ctk bootstrap
ctk current-state
Success Criteria

The system will be considered successful when:

Context can be recovered without conversation history.

The latest project state is always available.

Knowledge survives the end of a session.

Important discoveries are preserved.

A new AI session can resume work within minutes.

Immediate Next Action

Create standard templates for:

Logbook
Current State
Knowledge
ADR

Then implement automatic Bootstrap Context generation.

One Sentence Summary

CKS is a Context Preservation System whose purpose is to transform temporary conversation into permanent, recoverable project context.


============================================================
RECENT LOGBOOKS
============================================================


FILE: 2026-09-06-logbook.md

# Logbook Entry

Date:

2026-09-06

Project:


Type:


---

## Context


---

## Activity


---

## Discoveries


---

## Conclusions


---

## Decisions


---

## Risks


---

## Next Actions


---

## Promote To ADR

- [ ]

---

## Promote To Knowledge

- [ ]

---

## Promote To Current State

- [ ]

---

## Session Summary


---

## One Sentence Summary




FILE: 2026-09-06-cks-context-preservation.md

Logbook Entry

Date: 2026-09-06

Project: CKS

Type: Architecture Discovery

Context

Foi efetuada uma sessão de revisão da arquitetura do CKS utilizando os exports dos repositórios:

Cravo-Toolkit
AEGIS
Home-Assistant
Homelab

O objetivo inicial era compreender porque algumas conclusões importantes de sessões anteriores tinham desaparecido do contexto.

Main Discovery

O problema principal não é documentação.

O problema principal é preservação de contexto entre sessões.

A documentação existente revelou-se suficiente para recuperar grande parte do conhecimento dos projetos, mas insuficiente para recuperar algumas conclusões recentes que nunca foram promovidas para artefactos permanentes.

Key Conclusions
CKS Purpose

O objetivo do CKS não é armazenar documentação.

O objetivo do CKS é impedir a perda de contexto.

Workspace

Foi concluído que:

Workspace não é o sistema.

Workspace é apenas uma representação ou vista do conhecimento.

Knowledge System

O sistema real passa a ser visto como:

Schema

↓

Knowledge System

↓

Workspace

↓

Artefactos

Conversations

As conversas não devem ser consideradas memória permanente.

As conversas são apenas uma fonte de informação.

Conhecimento relevante deve ser promovido para entidades formais.

Maritime Analogy

Foi identificada uma analogia forte com os livros de quarto da marinha mercante.

Tal como uma passagem de quarto permite transmitir contexto ao oficial seguinte, o CKS deverá permitir transmitir contexto a:

Sessões futuras
Utilizadores futuros
Copilot futuro

Sem necessidade de redescobrir trabalho anterior.

New Conceptual Entities

Foram identificadas como entidades fundamentais.

Current State

Responde à pergunta:

"Onde estamos?"

ADR

Responde à pergunta:

"Porque tomámos esta decisão?"

Knowledge

Responde à pergunta:

"O que sabemos?"

Logbook

Responde à pergunta:

"O que aconteceu recentemente?"

Repository Structure

Pastas consideradas nucleares para o CKS:

adr/
current-state/
knowledge/
logbook/
generated/
Knowledge Flow

Conversation

↓

Logbook

↓

Knowledge

ADR

Current State

↓

Generated Artefacts

CKS Validation

A recuperação de contexto utilizando os exports dos repositórios foi considerada uma validação positiva do conceito.

Mesmo após perda parcial de contexto conversacional foi possível reconstruir rapidamente:

Homelab
AEGIS
Home Assistant
CTK
Objetivos do CKS
Export System Findings

Foi adicionada observabilidade ao sistema de exportação.

Passou a ser possível visualizar:

Hora de início
Hora de fim
Duração por repositório
Consolidação
Número de exports copiados

A análise revelou que:

CTK demora aproximadamente 150 segundos
AEGIS demora aproximadamente 1 segundo
Home Assistant demora menos de 1 segundo
Homelab demora aproximadamente 1 segundo

O gargalo encontra-se no exportador do CTK.

Foi ainda identificado que os exports estão a capturar ficheiros gerados e exportações anteriores, aumentando significativamente o tamanho final dos artefactos.

Bootstrap Requirement

Foi formalizada a necessidade de um novo artefacto.

Nome proposto:

bootstrap-context.md

Objetivo:

Permitir recuperar contexto diário sem necessidade de consultar os exports completos.

Conteúdo previsto:

Current State
Logbooks recentes
ADRs recentes
Knowledge recente
Projetos ativos
Próximas ações
Logbook Purpose

O Logbook surge como equivalente digital do livro de quarto da marinha mercante.

Função:

Garantir a passagem de contexto entre sessões.

Não substitui:

Knowledge
ADR
Current State

Serve como zona intermédia entre conversa e conhecimento formal.

Next Actions
Formalizar template oficial de Logbook.
Criar comando ctk logbook.
Criar comando ctk bootstrap.
Formalizar entidade Knowledge.
Formalizar entidade Current State.
Rever exclusões da exportação.
Melhorar performance do exportador CTK.
Automatizar geração de bootstrap diário.
ADR Candidates
CKS exists to preserve context.
Conversations are not memory.
Workspace is not the system.
Logbook is a first-class entity.
Knowledge Candidates
Maritime watch log analogy.
Context preservation as primary goal.
Bootstrap as daily context mechanism.
Conversation as temporary source only.
Impact on Current State

Current State passa a ser considerado uma entidade de primeira classe.

O seu objetivo é responder de forma imediata à pergunta:

"Em que estado se encontra o projeto neste momento?"

Session Summary

Esta sessão marcou a transição conceptual do CKS de um sistema de documentação para um sistema de preservação de contexto.

A perda de uma conclusão importante de uma sessão anterior serviu como validação prática da necessidade de:

Logbook
Current State
Knowledge
Bootstrap Context

Frase final:

"O objetivo do CKS não é guardar informação.

O objetivo do CKS é impedir a perda de contexto."


============================================================
KNOWLEDGE
============================================================


FILE: knowledge-002-workspace-is-a-view.md

Knowledge Item

ID:

KN-002

Title:

Workspace Is A View

Status:

Validated

Created:

2026-09-06

Updated:

2026-09-06

Owner:

António

Project:

CKS

Summary

Workspace is not the system.

Workspace is a representation of the system.

The workspace exists to expose, organize and consume information maintained by the Knowledge System.

Context

While analysing the architecture of the CKS, the initial model was represented as:

Schema

↓

Workspace

↓

Current State

Over time it became clear that Workspace was being treated as the centre of the system even though it merely presents information derived from other artefacts.

Observation

The system already contained several distinct information sources:

Documentation
Decisions
Knowledge
Project State
Generated Artefacts

Workspace did not own these artefacts.

Workspace merely exposed them.

Insight

Workspace should be treated as a view.

Knowledge should be treated as the system.

The repository structure, reports and generated files are consumers of knowledge rather than the source of knowledge.

Evidence

Evidence supporting this conclusion:

Analysis of repository exports.
Analysis of project information flow.
Creation of Current State and Logbook concepts.
Identification of Knowledge as a first-class entity.
Implications

The conceptual model becomes:

Schema

↓

Knowledge System

↓

Workspace

↓

Generated Artefacts

This changes the role of Workspace from:

System

to:

Representation

Relationships

Related ADRs:

ADR-001 Context Preservation

Related Current States:

current-state/cks.md

Related Projects:

CKS
CTK

Related Knowledge:

KN-001 Context Preservation
Proposed Actions
Review architecture documentation.
Remove references that place Workspace at the centre of the system.
Position Knowledge System as the primary conceptual layer.
Generate Current State from knowledge rather than from Workspace.
Validity

Validated

Notes

This discovery emerged during the recovery of lost conversational context.

The distinction between Knowledge System and Workspace clarified several architectural decisions that were previously ambiguous.

One Sentence Summary

Workspace is a representation of knowledge, not the knowledge system itself.


FILE: knowledge-001-context-preservation.md

Título:
CKS Purpose Is Context Preservation

Resumo:
O objetivo principal do CKS não é documentação.
O objetivo principal do CKS é preservação de contexto.

Validade:
Validated


============================================================
ADRS
============================================================


FILE: ADR-001-context-preservation.md

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

