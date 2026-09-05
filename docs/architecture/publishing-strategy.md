# Publishing Strategy

## Objetivo

Definir como a informação circula entre os vários sistemas do ecossistema Cravo.

A estratégia de publicação deve garantir:

- Uma Fonte de Verdade (SSOT)
- Contexto atualizado
- Baixo esforço de manutenção
- Consistência entre sistemas

---

# Arquitetura

               SSOT
                 │
                 ▼
        Current State Generator
                 │
        ┌────────┼────────┐
        ▼        ▼        ▼
      CTK      HTML     JSON
        │        │        │
        ▼        ▼        ▼
   Utilizador  Homelab  Home Assistant

---

# Fonte de Verdade

Inicialmente:

workspace.xlsx

Futuro possível:

PostgreSQL + NocoDB

---

# Current State

Representa o estado operacional atual.

Não contém:

- Histórico completo
- Exports completos
- Snapshots completos

Contém:

- Projetos
- Tarefas prioritárias
- Decisões recentes
- Descobertas recentes
- Riscos ativos
- Próximas ações

---

# Publicação

## Markdown

Destino:

- GitHub
- Documentação
- Consultas rápidas

Ficheiro:

current-state.md

---

## JSON

Destino:

- Home Assistant
- CTK
- Scripts

Ficheiro:

current-state.json

---

## HTML

Destino:

- Homelab
- Consulta humana
- Portal de Estado

Ficheiro:

current-state.html

---

# Sincronização

Fluxo atual:

OneDrive
    ↓
Homelab

Fluxo futuro:

Workspace
    ↓
Current State
    ↓
Publicação
    ↓
Consumo

---

# Consumidores

## Utilizador

Objetivo:

Retomar rapidamente o contexto.

---

## Assistentes IA

Objetivo:

Minimizar contexto necessário para suporte.

---

## Home Assistant

Objetivo:

Visualização e automação.

---

## CTK

Objetivo:

Operação e manutenção da informação.

---

# Filosofia

A informação deve ser introduzida uma única vez.

Todos os consumidores devem utilizar a mesma representação do estado atual.

Evitar múltiplas fontes de verdade.

Evitar duplicação de informação.