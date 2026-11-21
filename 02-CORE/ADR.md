# Architecture Decision Records

## Purpose

Este documento regista decisões arquiteturais permanentes do CTK.

O objetivo não é documentar sessões.

O objetivo não é guardar contexto operacional.

O objetivo é preservar decisões cuja justificação continua relevante ao longo do tempo.

Cada ADR deve responder à pergunta:

Porque tomámos esta decisão?

---

# ADR-001

## Title

Context Preservation Is The Primary Purpose

## Status

Accepted

## Date

2026-09-06

## Context

Durante a análise dos repositórios:

- Cravo-Toolkit
- AEGIS-Home-Guardian
- Home-Assistant
- Homelab

foi efetuado um exercício de reconstrução de contexto após perda parcial da informação de sessões anteriores.

Verificou-se que a documentação existente permitia recuperar grande parte do conhecimento técnico dos projetos.

No entanto, algumas conclusões importantes de sessões recentes não puderam ser recuperadas facilmente porque não tinham sido promovidas para artefactos permanentes.

## Problem

O modelo inicial focava-se principalmente em:

- documentação
- exportação
- representação do conhecimento

Mas não abordava explicitamente a preservação de contexto entre sessões.

O conhecimento produzido em conversas podia desaparecer após o encerramento da sessão.

## Decision

O objetivo principal do CTK passa a ser:

Preservação de contexto.

A documentação continua a existir, mas passa a ser um mecanismo de suporte e não o objetivo principal do sistema.

## Consequences

O sistema deve preservar:

- conhecimento importante
- decisões importantes
- contexto operacional
- continuidade entre sessões

A recuperação rápida de contexto passa a ser uma métrica fundamental de sucesso.

## Summary

O objetivo principal do CTK não é documentação.

O objetivo principal do CTK é preservação de contexto.

---

# ADR-002

## Title

Workspace Is A View

## Status

Accepted

## Date

2026-09-06

## Context

Ao longo da evolução do CKS, o Workspace começou a ser tratado implicitamente como o centro do sistema.

A análise da arquitetura revelou que o Workspace não possui informação própria.

O Workspace apenas expõe informação proveniente de outras fontes.

## Problem

Quando o Workspace é tratado como fonte de verdade, torna-se difícil distinguir:

- informação real
- informação gerada
- representações temporárias

## Decision

Workspace não é o sistema.

Workspace é uma representação do sistema.

As fontes de verdade passam a residir fora do Workspace.

## Consequences

O conteúdo de:

00-WIP

deve ser considerado reconstruível.

O Workspace pode ser destruído e recriado.

## Summary

Workspace é uma representação do conhecimento e não o sistema em si.

---

# ADR-003

## Title

Single Sources Of Truth

## Status

Accepted

## Date

2026-09-15

## Context

A auditoria ao repositório revelou múltiplas entidades parcialmente sobrepostas:

- ADR
- Knowledge
- Current State
- Logbook
- Workspace

A estrutura tornou-se progressivamente mais difícil de compreender.

## Problem

Existiam múltiplas localizações potenciais para armazenar informação.

Isso aumentava o risco de duplicação e inconsistência.

## Decision

Apenas as seguintes áreas passam a ser consideradas fontes de verdade:

- 01-PROJECTS
- 02-CORE
- 03-SESSIONS

Todo o restante conteúdo deve ser considerado derivado ou reconstruível.

## Consequences

00-WIP deixa de ser fonte de verdade.

A estrutura passa a privilegiar descoberta automática.

## Summary

01-PROJECTS, 02-CORE e 03-SESSIONS são as únicas fontes de verdade do sistema.

---

# ADR-004

## Title

Repository Structure Is Self Describing

## Status

Accepted

## Date

2026-09-15

## Context

A utilização de ficheiros de configuração como:

- ingest-map.json

## ADR-005

### Title

Management Review First

### Status

Accepted

### Date

2026-09-19

### Context

Durante a evolução da arquitetura CTK foi introduzido o conceito de Bootstrap Context.

O mecanismo revelou‑se útil para condensar informação relevante para humanos e sistemas de IA.

Com a evolução da arquitetura verificou‑se que o valor principal não estava relacionado com IA, mas sim com a existência de um resumo executivo consistente.

### Problem

A colocação dos resumos no final dos documentos reduz a sua utilidade.

Além disso, a designação Bootstrap Context é excessivamente técnica e focada na implementação.

### Decision

Todos os documentos relevantes passam a iniciar com uma secção:

```text
Management Review
```

seguida do restante conteúdo.

Formato padrão:

```text
Management Review
↓
Documento Completo
```

### Consequences

Os leitores podem compreender rapidamente:

- estado atual;
- decisões relevantes;
- questões abertas;
- próximos passos;

sem necessidade de leitura integral.

O Context Builder passa a utilizar preferencialmente Management Reviews.

### Summary

Todo o documento relevante deve começar por um Management Review.


