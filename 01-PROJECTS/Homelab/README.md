# Homelab

## Status

ACTIVE

## Last Updated

2026-09-15

---

# Purpose

O Homelab fornece a infraestrutura computacional central que suporta os restantes projetos do ecossistema.

Funciona como plataforma para:

- serviços self-hosted;
- automação;
- observabilidade;
- armazenamento;
- integração;
- desenvolvimento;
- experimentação.

---

# Vision

Construir uma infraestrutura doméstica robusta, modular e evolutiva capaz de suportar:

- Home Assistant;
- AEGIS;
- observabilidade;
- processamento distribuído;
- serviços internos;
- futuras capacidades de IA.

---

# Current State

O Homelab é atualmente a fundação tecnológica do ecossistema.

Assume funções de:

- alojamento de serviços;
- integração;
- monitorização;
- processamento pesado.

Serve simultaneamente os projetos:

- Home-Assistant;
- AEGIS-Home-Guardian;
- CTK.

---

# Active Topics

## Infrastructure

Gestão da infraestrutura física e virtual.

Inclui:

- servidores;
- armazenamento;
- rede;
- virtualização.

---

## Monitoring

Observabilidade e monitorização dos sistemas.

Temas:

- métricas;
- disponibilidade;
- diagnóstico;
- desempenho.

---

## Automation

Suporte às plataformas de automação.

Inclui:

- Home Assistant;
- MQTT;
- serviços auxiliares.

---

## AEGIS Integration

Avaliação do papel do Homelab como:

- camada de processamento pesado;
- barramento de comunicações;
- agregador de telemetria.

---

## Development Platform

Ambiente de suporte ao desenvolvimento de:

- CTK;
- AEGIS;
- ferramentas auxiliares.

---

# Recent Decisions

- O Homelab permanece como plataforma central de infraestrutura.
- O processamento pesado do AEGIS deverá ser suportado pelo Homelab sempre que possível.
- O Home Assistant não deve absorver responsabilidades de infraestrutura.
- A infraestrutura deve permanecer modular e evolutiva.

---

# Open Questions

- Qual o papel futuro da IA local?
- Como deverá evoluir o processamento de telemetria do AEGIS?
- Quais os serviços que justificam alta disponibilidade?
- Que componentes deverão ser distribuídos por múltiplos nós?

---

# Next Steps

- Consolidar observabilidade.
- Melhorar documentação operacional.
- Evoluir integração entre serviços.
- Avaliar novos serviços self-hosted.
- Apoiar a evolução do ecossistema AEGIS.

---

# Related Systems

```text
AEGIS-Home-Guardian
Home-Assistant
CTK
MQTT
Docker
```

---

# Long Term Vision

O Homelab deverá funcionar como a infraestrutura central da futura:

```text
AEGIS Smart Property
```

fornecendo:

- computação;
- integração;
- observabilidade;
- armazenamento;
- serviços de apoio;

para todos os subsistemas da propriedade.

O objetivo é criar uma plataforma estável e extensível que permita evoluir continuamente sem necessidade de redesenho estrutural.

---

## Bootstrap Context

Homelab é a infraestrutura central do ecossistema.

Responsável por:

- serviços
- computação
- observabilidade
- MQTT
- suporte ao AEGIS

Foco atual:

- observabilidade
- integração de serviços
- suporte ao ecossistema AEGIS

Princípio importante:

O processamento pesado deve residir aqui sempre que possível.

## End Bootstrap Context