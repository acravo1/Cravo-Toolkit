# Knowledge Lifecycle

Version:

1.0

Status:

Active

---

## Purpose

This document defines how information flows inside the Cravo Knowledge System (CKS).

The objective is to prevent knowledge and context loss while keeping the system simple and maintainable.

---

## Core Principle

Conversations are temporary.

Knowledge is permanent.

Important information must be promoted out of conversations before a session ends.

---

## Information Sources

Information may originate from:

- Conversations
- Meetings
- Documents
- Repository changes
- Research
- Observations
- Experiments

These sources are not considered permanent context.

---

## Lifecycle

Conversation

↓

Logbook

↓

Knowledge

↓

ADR

↓

Current State

↓

Generated Artefacts

---

## Stage 1 - Conversation

Conversations are considered temporary.

They are useful for:

- Exploration
- Reasoning
- Discussion
- Problem solving

They are not considered a reliable long-term source of context.

---

## Stage 2 - Logbook

The Logbook captures information that should survive the session.

Questions answered:

- What happened?
- What was discussed?
- What was discovered?

Output:

logbook/YYYY-MM-DD-topic.md

---

## Stage 3 - Knowledge

Knowledge captures discoveries that remain relevant beyond a single session.

Questions answered:

- What do we know?

Examples:

- Architectural insights
- Lessons learned
- Patterns
- Observations

Output:

knowledge/knowledge-XXX-title.md

---

## Stage 4 - ADR

Architectural Decision Records capture decisions that influence the future of the system.

Questions answered:

- Why was this decision taken?

Examples:

- Technology choices
- Process changes
- Architectural principles

Output:

adr/ADR-XXX-title.md

---

## Stage 5 - Current State

Current State represents the current reality of a project.

Questions answered:

- Where are we now?

Current State should reflect:

- Active decisions
- Known constraints
- Current priorities
- Immediate next actions

Output:

current-state/project.md

---

## Stage 6 - Generated Artefacts

Generated artefacts are derived from knowledge.

They are not considered source material.

Examples:

- Bootstrap Context
- Reports
- Dashboards
- Summaries

Outputs:

generated/

---

## Promotion Rules

Conversation -> Logbook

Always.

Every meaningful session should generate a Logbook entry.

---

Logbook -> Knowledge

When a discovery remains relevant beyond the session.

---

Logbook -> ADR

When a decision is accepted and expected to influence future work.

---

Knowledge -> Current State

When a discovery affects the current understanding of a project.

---

ADR -> Current State

When a decision changes the current operational reality.

---

## Source Of Truth

Generated artefacts are never the source of truth.

The source of truth is:

- ADR
- Current State
- Knowledge
- Logbook

in that order of authority.

---

## Success Criteria

The lifecycle is considered successful when:

1. Knowledge survives the end of a session.

2. Context can be recovered without conversation history.

3. Important discoveries are not lost.

4. Future sessions can continue work quickly.

5. AI systems can reconstruct context from repository artefacts.

---

## One Sentence Summary

The purpose of the Knowledge Lifecycle is to transform temporary conversations into permanent and recoverable context.