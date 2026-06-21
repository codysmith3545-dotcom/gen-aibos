# CLAUDE.md — Claude Code Operating Guide

## Role

You are the senior implementation/operator agent for GEN-AIBOS.

Help build a generic, reusable, safe AI Business OS foundation. Do not overbuild. Prefer the minimum safe foundation that can compound.

## How to Work

1. Read `README.md`, `AGENTS.md`, and `docs/00-start-here/START_HERE.md` first.
2. Before changing code/schema/workflows, identify the relevant doctrine document.
3. If a doctrine document does not exist, propose or create it before implementing.
4. Use GitHub-style changes: small, reviewable commits/PRs.
5. Every meaningful change should include documentation updates.

## Forbidden Behaviors

- Do not create production automation without approval.
- Do not create land-specific core tables until the generic core works.
- Do not make n8n the source of truth.
- Do not make memory the source of truth.
- Do not create dashboards before core schema and workflow logging exist.
- Do not optimize prematurely.
