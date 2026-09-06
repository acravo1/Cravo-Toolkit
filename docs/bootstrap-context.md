Bootstrap Context

Status:

Draft

Version:

1.0

Purpose

Bootstrap Context exists to provide a compact view of the current state of the system.

The objective is to allow rapid context recovery without requiring full repository exports.

This document is intended for:

Daily project startup
Session recovery
AI onboarding
Human onboarding
Problem

Repository exports contain complete information.

However, they may contain hundreds of pages of content.

While useful for deep reconstruction, they are inefficient for daily context recovery.

Solution

Generate a Bootstrap Context document containing only the information required to resume work.

The Bootstrap Context does not replace:

ADRs
Current State
Knowledge
Logbook

Instead it aggregates the most relevant information from those sources.

Information Sources

Bootstrap Context should be generated from:

Current State

Provides:

Project status
Active priorities
Next actions
Recent Logbooks

Provides:

Recent activity
Recent discoveries
Recent conclusions
Recent Knowledge

Provides:

Validated insights
Relevant discoveries
Lessons learned
Recent ADRs

Provides:

Active decisions
Architectural direction
Target Audience
Human

Project owner.

AI

Assistant responsible for continuing ongoing work.

Recommended Structure

Project Summary

Current State

Recent Discoveries

Recent Decisions

Recent Activity

Open Questions

Current Risks

Immediate Next Actions

Recovery Objective

A new session should recover enough context to continue productive work within minutes.

No repository export should be required for routine context recovery.

Repository exports remain the fallback mechanism for deep reconstruction.

Generation Workflow

Current State ↓ ADR ↓ Knowledge ↓ Recent Logbooks ↓ Bootstrap Context

Typical Daily Workflow

Start Session

↓

Generate Bootstrap Context

↓

Review Bootstrap Context

↓

Continue Work

↓

Generate Logbook Entry

↓

Promote Knowledge

↓

Update Current State

↓

End Session

Success Criteria

A project can be resumed using:

Bootstrap Context
Latest Current State
Recent Logbooks

without requiring access to previous conversations.

One Sentence Summary

Bootstrap Context is the daily operational snapshot of the Knowledge System.