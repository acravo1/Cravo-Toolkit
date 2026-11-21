# PROJECTS

## Purpose

Esta pasta contém os projetos ativos geridos pelo CTK.

Representa uma das Single Sources of Truth (SSoT) do sistema.

O conteúdo desta pasta descreve:

- estado atual dos projetos;
- visão de longo prazo;
- decisões relevantes;
- questões em aberto;
- próximos passos.

---

## Structure

Cada projeto deve ocupar um diretório próprio.

Exemplo:

```text
01-PROJECTS/

    AEGIS-Home-Guardian/
        README.md
        DRONE.md
        ALL_TERRAIN.md

    Home-Assistant/
        README.md

    Homelab/
        README.md

    MORADIA/
        README.md
        LANDSCAPE.md
        WATER.md
```

---

## Project Naming

Sempre que possível, o nome da pasta deve coincidir com o nome do respetivo repositório Git.

Exemplos:

```text
AEGIS-Home-Guardian
Home-Assistant
Homelab
```

Objetivos:

- evitar aliases;
- evitar ficheiros de mapeamento;
- simplificar descoberta automática;
- manter consistência entre CTK e GitHub.

---

## README.md

Cada projeto deve possuir obrigatoriamente:

```text
README.md
```

O README constitui a unidade fundamental de contexto do projeto.

Um utilizador deve conseguir compreender:

- o que é o projeto;
- porque existe;
- estado atual;
- tópicos ativos;
- decisões recentes;
- questões em aberto;
- próximos passos;

sem necessidade de abrir outros ficheiros.

---

## Additional Documents

Ficheiros adicionais devem ser utilizados apenas quando acrescentam valor.

Exemplos:

```text
README.md
DRONE.md
ALL_TERRAIN.md
LANDSCAPE.md
WATER.md
```

Evitar fragmentação excessiva.

---

## Design Principle

Preferir:

```text
Poucos ficheiros bem estruturados
```

em vez de:

```text
Muitos ficheiros pequenos
```

---

## Project Discovery

A estrutura do diretório é a configuração.

A existência de:

```text
PROJECT/
    README.md
```

é suficiente para identificar um projeto.

Sempre que possível, o CTK deve descobrir projetos automaticamente através da estrutura do repositório.

---

## Relationship With Other Sources

### 01-PROJECTS

Responde à pergunta:

```text
Em que estado estão os projetos?
```

### 02-CORE

Responde à pergunta:

```text
Como funciona o sistema?
```

### 03-SESSIONS

Responde à pergunta:

```text
O que aconteceu recentemente?
```

### 04-LOGBOOK

Responde à pergunta:

```text
Como chegámos ao estado atual?
```

---

## Long Term Goal

Permitir que qualquer projeto seja compreendido rapidamente através do seu README.md e da sua estrutura local, reduzindo dependências de configuração e facilitando a reconstrução de contexto.