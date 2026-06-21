# Workflow and Module Retirement Policy

## Purpose

Old automations create hidden complexity. GEN-AIBOS must make it easy to pause, deprecate, and retire workflows, modules, and integrations that no longer create value.

## Status Values

Use these statuses for workflows and modules:

- draft
- testing
- shadow_mode
- active
- paused
- deprecated
- retired

## Retirement Triggers

Consider retiring or pausing a workflow when:

- it has not run in 30 days
- it repeatedly fails
- it creates low-quality data
- it duplicates another workflow
- it costs more than it saves
- it touches a system that is no longer used
- its owner is unclear
- its purpose is unclear
- it no longer fits the source-of-truth policy

## Monthly Cleanup Questions

Ask:

1. Which workflows were unused?
2. Which workflows produced bad outputs?
3. Which workflows created cost without clear value?
4. Which workflows duplicate another workflow?
5. Which workflows should be simplified?
6. Which workflows should be paused?
7. Which workflows should be fully retired?

## Retirement Steps

1. Mark workflow/module as deprecated.
2. Stop new dependencies from being added.
3. Export final config/docs to GitHub if applicable.
4. Confirm no active workflows depend on it.
5. Mark as retired.
6. Add note to weekly operating review.
7. Keep enough history for audit and learning.

## Rule

No automation is permanent by default. Workflows earn continued existence by creating value, reducing risk, or preserving important knowledge.
