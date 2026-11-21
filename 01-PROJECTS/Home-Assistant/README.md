# Home Assistant

## Status

ACTIVE

## Last Updated

2026-09-15

---

# Purpose

Este projeto contém a configuração, personalização e integração da plataforma Home Assistant.

O Home Assistant funciona como a principal camada de:

- automação;
- monitorização;
- integração;
- controlo operacional;

do ecossistema doméstico e dos projetos associados.

---

# Vision

Utilizar o Home Assistant como plataforma central de observabilidade e integração.

O Home Assistant não é o sistema.

O Home Assistant é um dos componentes do ecossistema global.

---

# Current State

O sistema encontra-se em utilização ativa.

Atualmente é responsável pela integração de:

- dispositivos ESPHome;
- sensores;
- automações;
- MQTT;
- componentes do Homelab;
- componentes do ecossistema AEGIS.

---

# Active Topics

## Automations

Desenvolvimento e manutenção de automações.

---

## ESPHome

Integração de dispositivos baseados em:

- ESP32;
- ESP8266;
- RP2040 (quando aplicável).

---

## MQTT

Utilização do MQTT como barramento de comunicações para sistemas distribuídos.

---

## AEGIS Integration

Integração com:

- AEGIS Home Guardian;
- sensores;
- telemetria;
- sistemas futuros.

---

## Observability

Monitorização do estado da infraestrutura e dos serviços associados.

---

# Recent Decisions

- Home Assistant é considerado uma camada de integração.
- Home Assistant não deverá assumir funções de navegação robótica.
- A infraestrutura pesada deverá permanecer no Homelab.
- O ecossistema AEGIS deverá integrar-se com o Home Assistant sempre que fizer sentido.

---

# Open Questions

- Qual o papel futuro da telemetria MAVLink?
- Como expor informação robótica avançada ao Home Assistant?
- Que componentes deverão permanecer fora do Home Assistant por razões de desempenho ou complexidade?

---

# Next Steps

- Consolidar integrações existentes.
- Melhorar observabilidade da infraestrutura.
- Evoluir integração com o ecossistema AEGIS.
- Continuar a normalização dos dispositivos ESPHome.

---

# Related Systems

```text
Homelab
AEGIS-Home-Guardian
ESPHome
MQTT
```

---

# Long Term Vision

O Home Assistant deverá funcionar como a camada operacional de integração de toda a propriedade.

O objetivo não é concentrar toda a lógica no Home Assistant.

O objetivo é fornecer um ponto único de observação e controlo para:

- habitação;
- automação;
- sensores;
- água;
- energia;
- AEGIS;
- infraestrutura do Homelab.

---

## Bootstrap Context

Home Assistant é a camada principal de integração da propriedade.

Responsável por:

- automações
- observabilidade
- sensores
- MQTT
- integração AEGIS

Foco atual:

- integração com AEGIS
- ESPHome
- observabilidade

Princípio importante:

Home Assistant integra.
Não navega.
Não substitui o Homelab.

## End Bootstrap Context