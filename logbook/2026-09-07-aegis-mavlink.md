# Logbook Entry

Date:

2026-09-07

Project:

AEGIS

Type:

Architecture Discovery

---

## Context

Análise da possível integração do protocolo MAVLink e do
QGroundControl no projeto AEGIS.

O objetivo foi perceber se existia valor em introduzir
conceitos típicos de robótica móvel e veículos autónomos
na arquitetura atual baseada em:

- RP2040
- ESP32-S3
- ESP32-CAM
- Home Assistant

---

## Activity

Foi analisado:

- QGroundControl
- MAVLink
- MAVLink Server
- MAVLink2Rest

Foi estudada a possibilidade de utilizar o Homelab como
camada intermédia para processamento e distribuição de
telemetria.

---

## Discoveries

QGroundControl não deve ser visto como substituto do
Home Assistant.

QGroundControl deve ser visto como consola técnica
especializada para o AEGIS.

O Homelab pode assumir o papel de processamento pesado
e de barramento de comunicações MAVLink.

A arquitetura atual do AEGIS continua válida sem
necessidade de adicionar novos processadores.

---

## Conclusions

Home Assistant passa a ser considerado uma camada de
integração.

QGroundControl passa a ser considerado uma potencial
camada de navegação e diagnóstico.

MAVLink Server surge como candidato principal para
funcionar como router/broker MAVLink.

O Lenovo M710 do Homelab pode desempenhar o papel de
camada de processamento pesado para funções futuras.

---

## Decisions

Nenhuma alteração à arquitetura física do AEGIS.

Arquitetura continua:

- RP2040
- ESP32-S3
- ESP32-CAM

A investigação futura deverá centrar-se em:

- MAVLink
- MAVLink Server
- QGroundControl

antes da aquisição de novo hardware.

---

## Risks

A introdução de MAVLink aumenta a complexidade.

Existe risco de sobre-engenharia se o foco passar da
execução física do robô para a infraestrutura de suporte.

O Home Assistant não deve ser transformado numa camada
de navegação.

---

## Next Actions

1. Investigar MAVLink Server em Docker.

2. Identificar conjunto mínimo de mensagens MAVLink
   necessárias para o AEGIS.

3. Testar comunicação:

   ESP32-S3
        ↓
   MAVLink UDP
        ↓
   QGroundControl

4. Avaliar exposição da telemetria para Home Assistant.

---

## Promote To Knowledge

- Home Assistant como camada de integração.
- QGroundControl como consola técnica.
- Homelab como camada de processamento pesado.

---

## Session Summary

Foi identificada uma arquitetura potencialmente muito
elegante para a evolução futura do AEGIS.

A utilização de MAVLink permite acrescentar capacidades
de navegação e telemetria avançadas sem alterar a
arquitetura física já definida.

---

## One Sentence Summary

Home Assistant integra, QGroundControl navega,
MAVLink transporta e o AEGIS continua simples.