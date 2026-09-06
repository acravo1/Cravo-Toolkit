Knowledge Item

ID:

KN-002

Title:

Workspace Is A View

Status:

Validated

Created:

2026-09-06

Updated:

2026-09-06

Owner:

António

Project:

CKS

Summary

Workspace is not the system.

Workspace is a representation of the system.

The workspace exists to expose, organize and consume information maintained by the Knowledge System.

Context

While analysing the architecture of the CKS, the initial model was represented as:

Schema

↓

Workspace

↓

Current State

Over time it became clear that Workspace was being treated as the centre of the system even though it merely presents information derived from other artefacts.

Observation

The system already contained several distinct information sources:

Documentation
Decisions
Knowledge
Project State
Generated Artefacts

Workspace did not own these artefacts.

Workspace merely exposed them.

Insight

Workspace should be treated as a view.

Knowledge should be treated as the system.

The repository structure, reports and generated files are consumers of knowledge rather than the source of knowledge.

Evidence

Evidence supporting this conclusion:

Analysis of repository exports.
Analysis of project information flow.
Creation of Current State and Logbook concepts.
Identification of Knowledge as a first-class entity.
Implications

The conceptual model becomes:

Schema

↓

Knowledge System

↓

Workspace

↓

Generated Artefacts

This changes the role of Workspace from:

System

to:

Representation

Relationships

Related ADRs:

ADR-001 Context Preservation

Related Current States:

current-state/cks.md

Related Projects:

CKS
CTK

Related Knowledge:

KN-001 Context Preservation
Proposed Actions
Review architecture documentation.
Remove references that place Workspace at the centre of the system.
Position Knowledge System as the primary conceptual layer.
Generate Current State from knowledge rather than from Workspace.
Validity

Validated

Notes

This discovery emerged during the recovery of lost conversational context.

The distinction between Knowledge System and Workspace clarified several architectural decisions that were previously ambiguous.

One Sentence Summary

Workspace is a representation of knowledge, not the knowledge system itself.