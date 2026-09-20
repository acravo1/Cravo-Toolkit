# CURRENT CONTEXT

Generated: 2026-09-19 18:33:02

---

# PROJECTS

## AEGIS-Home-Guardian


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


## Home-Assistant


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


## Homelab


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


## MORADIA


Projeto de planeamento da futura propriedade.

Foco atual:

- lote A28
- paisagismo
- água
- lago
- regato
- aquaponia

Decisões consolidadas:

- lago mantido
- regato mantido
- ponte mantida
- poço como elemento central

Objetivo:

Evoluir para o conceito AEGIS Smart Property.


---

# CORE


O CTK utiliza quatro áreas principais:

- 01-PROJECTS
- 02-CORE
- 03-SESSIONS
- 04-LOGBOOK

As Single Sources Of Truth são:

- 01-PROJECTS
- 02-CORE
- 03-SESSIONS

Princípios principais:

- Context Preservation Is The Primary Purpose
- Workspace Is A View
- Structure Over Configuration
- README Is The Fundamental Context Unit

Fluxo principal:

ctk start
↓
CURRENT-CONTEXT.md
↓
Sessão
↓
SESSION-OUTPUT.md
↓
ctk ingest
↓
03-SESSIONS

00-WIP é uma área temporária e descartável.



---

# RECENT SESSIONS

## 2026-09-19-183246


- Nova arquitetura CTK V2 consolidada
- Bootstrap Context implementado para Projects, Core e Sessions
- Context Builder V2 validado
- ctk start validado
- Recuperação automática das sessões recentes funcional
- Próximo passo: validar ingest V2


## 2026-09-18-221150


- Context Builder V2 validado
- Recuperação de contexto funcional
- Próximo passo: validar ingest


## 2026-09-18-220540


- teste ingest
- sessão arquivada automaticamente
- validar recuperação de contexto


