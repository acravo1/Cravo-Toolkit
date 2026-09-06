Current State

Project: CKS

Status: Active

Phase: Architecture and Operationalization

Last Updated: 2026-09-06

Purpose

CKS (Cravo Knowledge System) exists to preserve context between work sessions.

The objective is not documentation.

The objective is preventing context loss and reducing the effort required to recover project knowledge in future sessions.

Vision

Any future session should be able to recover enough context to continue productive work within minutes.

The system should allow both humans and AI systems to understand:

Where a project currently stands
How it reached the current state
What is currently being discussed
Which decisions were made
What remains to be done

without relying on memory or previous conversations.

Current Understanding

The project has evolved from a documentation-centric approach into a context-preservation approach.

Documentation alone is insufficient.

Additional artefacts are required to preserve reasoning, discoveries and operational context.

The current conceptual model is:

Conversation

↓

Logbook

↓

Knowledge ADR Current State

↓

Generated Artefacts

Core Concepts
Documentation

Explains how something works.

ADR

Explains why a decision was taken.

Current State

Explains where the project currently stands.

Knowledge

Captures discoveries, insights, lessons learned and patterns.

Logbook

Captures recent activity that has not yet been promoted to permanent knowledge.

Repository Structure

Current structure:

adr/
current-state/
knowledge/
logbook/
generated/
docs/
templates/
exporters/
modules/
Validated Concepts

The following concepts are considered validated:

Repository export workflow
Multi-repository aggregation
Context reconstruction using exports
Current State as first-class entity
Knowledge as first-class entity
Logbook as first-class entity
Bootstrap context generation
Maritime watch-log analogy
Working Principles
Principle 1

Conversations are not memory.

Principle 2

Knowledge must be promoted out of conversations.

Principle 3

Current State must represent reality.

Principle 4

Generated artefacts are never the source of truth.

Principle 5

Workspace is a representation.

Workspace is not the system.

Principle 6

The cost of context recovery should continuously decrease over time.

Current Problems
Context Loss

Important conclusions can disappear when they are not promoted to permanent artefacts.

Knowledge Capture

There is not yet a formal workflow for transforming conversations into knowledge.

Bootstrap Generation

Bootstrap generation still needs implementation.

Export Scope

Repository exports still require optimisation and better exclusion of generated artefacts.

Recent Discoveries
Discovery 001

The primary problem is context preservation.

Discovery 002

Workspace should be treated as a view.

Discovery 003

Logbook acts as the bridge between conversation and knowledge.

Discovery 004

The maritime watch-log model provides an accurate operational analogy.

Current Priorities

Priority 1

Formalise Logbook workflow.

Priority 2

Formalise Current State workflow.

Priority 3

Formalise Knowledge workflow.

Priority 4

Create Bootstrap Context generation.

Priority 5

Improve export performance and filtering.

Planned Commands

Planned CTK commands:

ctk logbook
ctk bootstrap
ctk current-state
Success Criteria

The system will be considered successful when:

Context can be recovered without conversation history.

The latest project state is always available.

Knowledge survives the end of a session.

Important discoveries are preserved.

A new AI session can resume work within minutes.

Immediate Next Action

Create standard templates for:

Logbook
Current State
Knowledge
ADR

Then implement automatic Bootstrap Context generation.

One Sentence Summary

CKS is a Context Preservation System whose purpose is to transform temporary conversation into permanent, recoverable project context.