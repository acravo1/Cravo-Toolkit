# AEGIS Home Guardian

## Status

ACTIVE

## Last Updated

2026-09-15

---

# Purpose

AEGIS Home Guardian é uma plataforma robótica autónoma destinada à integração com Home Assistant.

O projeto procura combinar:

- robótica móvel;
- automação residencial;
- interação por voz;
- observabilidade;
- operação autónoma;

numa plataforma modular e evolutiva.

---

# Vision

Criar um ecossistema AEGIS capaz de operar tanto em ambiente interior como exterior.

A visão de longo prazo evoluiu de:

```text
Smart Home
```

para:

```text
AEGIS Smart Property
```

onde vários subsistemas colaboram entre si.

---

# Current State

A arquitetura base encontra-se definida.

O sistema utiliza:

- RP2040 para controlo de movimento e sensores de baixo nível;
- ESP32-S3 para lógica principal;
- integração com Home Assistant;
- arquitetura modular por camadas.

O foco atual encontra-se na consolidação da plataforma terrestre e na preparação de futuras capacidades de navegação e observabilidade.

---

# Active Topics

## All Terrain

Desenvolvimento da plataforma de operação exterior.

Temas ativos:

- mobilidade;
- autonomia;
- sensores;
- navegação.

Ver:

```text
ALL_TERRAIN.md
```

---

## Drone

Exploração futura de capacidades aéreas.

Temas ativos:

- MAVLink;
- QGroundControl;
- telemetria;
- integração com Homelab.

Ver:

```text
DRONE.md
```

---

## Home Assistant Integration

Integração do AEGIS com:

- Home Assistant;
- MQTT;
- ESPHome;
- Homelab.

---

## Communications

Avaliação de:

- MQTT;
- MAVLink;
- serviços intermédios de telemetria;
- integração com sistemas distribuídos.

---

# Recent Decisions

- Arquitetura RP2040 + ESP32-S3 validada.
- Home Assistant permanece como camada de integração.
- Homelab assume funções de processamento pesado.
- O foco permanece na execução física da plataforma antes da expansão da infraestrutura.

---

# Open Questions

- Como deverá evoluir a integração MAVLink?
- Que papel terá o QGroundControl?
- Qual o conjunto mínimo de sensores necessário para operação exterior robusta?
- Qual a estratégia futura de navegação autónoma?

---

# Next Steps

- Continuar evolução da plataforma All Terrain.
- Explorar integração MAVLink.
- Consolidar capacidades de telemetria.
- Melhorar integração com Home Assistant.
- Evoluir observabilidade e diagnóstico.

---

# Related Documents

```text
ALL_TERRAIN.md
DRONE.md
```

---

# Long Term Vision

O AEGIS deverá evoluir para uma plataforma modular capaz de suportar múltiplos modos de operação:

- Interior
- Exterior
- Observação
- Monitorização
- Assistência

integrada num ecossistema mais amplo designado:

```text
AEGIS Smart Property
```

---

## CTK Managed Section

⚠️ Esta secção poderá ser atualizada automaticamente pelo CTK.

Não editar manualmente sem compreender o impacto.

## Bootstrap Context

AEGIS é uma plataforma robótica autónoma integrada com Home Assistant.

Arquitetura RP2040 + ESP32-S3 validada.

Focos atuais:

- All Terrain
- MAVLink
- Telemetria
- Home Assistant

Bloqueios atuais:

- Estratégia MAVLink
- Navegação autónoma

## End Bootstrap Context

## Session References

Reservado ao CTK.

## Context References

Reservado ao CTK.

## Generated Metadata

Reservado ao CTK.