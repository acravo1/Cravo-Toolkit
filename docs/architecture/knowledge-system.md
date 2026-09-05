# Knowledge System Vision

## Problema

A informação do ecossistema Cravo encontra-se distribuída por:

- Conversas com IA
- Documentação Markdown
- GitHub
- Home Assistant
- Homelab
- CTK
- Memória humana

Com o crescimento dos projetos, torna-se difícil recuperar rapidamente o contexto operacional atual.

## Objetivo

Criar uma memória operacional persistente capaz de ser consumida por:

- Utilizador
- CTK
- Home Assistant
- Assistentes IA
- Futuras aplicações

## Princípios

### Arquivo

Responsável por responder:

"o que aconteceu?"

Exemplos:

- Git
- Snapshots
- Exports

### Conhecimento

Responsável por responder:

"porque decidimos isto?"

Exemplos:

- ADRs
- PDs
- Documentação
- Notas técnicas

### Estado Atual

Responsável por responder:

"onde estamos agora?"

Exemplos:

- Próximas tarefas
- Decisões recentes
- Componentes ativos
- Riscos atuais

## Visão Futura

PostgreSQL / NocoDB
        ↓
Current State Generator
        ↓
CTK
Home Assistant
IA
Utilizador

## Filosofia

O objetivo não é armazenar mais dados.

O objetivo é reduzir a quantidade de contexto necessária para retomar um projeto.