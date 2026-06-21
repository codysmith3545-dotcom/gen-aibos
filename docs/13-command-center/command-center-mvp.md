# Cody Command Center MVP

## Purpose

Cody Command Center is the human supervision cockpit for GEN-AIBOS.

The first version should be simple, useful, and safe. It should not be a fancy dashboard before the system produces real data.

## MVP Views

### 1. Pending Approvals

Source tables:

- approval_requests
- related business tables through related_table/related_id

Show:

- action type
- target system
- risk level
- approval tier
- proposed action
- created at
- expires at
- related record
- approve/reject/edit path

Allowed actions:

- approve
- reject
- request changes
- mark expired

Not allowed:

- bypass approval tier
- execute unknown action type
- approve without audit event

### 2. Agent Activity

Source tables:

- agent_runs
- tool_calls later

Show:

- agent name
- task type
- status
- risk level
- tools used
- input summary
- output summary
- human review required
- related record

Allowed actions:

- open related record
- create follow-up task
- mark reviewed
- log mistake if needed

### 3. Workflow Failures

Source tables:

- workflow_runs
- tasks
- audit_events

Show:

- workflow name
- workflow system
- status
- error message
- last run
- repeated failure count
- recommended action

Allowed actions:

- create task
- mark reviewed
- pause workflow if supported
- open workflow docs

### 4. System Status / Kill Switches

Source table:

- system_status

Show:

- automation_enabled
- external_actions_enabled
- outreach_enabled
- payment_actions_enabled
- scraping_enabled
- production_writes_enabled
- emergency_mode
- status note
- updated by
- updated at

Allowed actions:

- toggle conservative flags only after confirmation
- enable emergency mode
- add status note

Not allowed:

- hide status changes
- update without audit event

### 5. Open Verification Items

Source table:

- verification_items

Show:

- entity type
- question
- why it matters
- priority
- source evidence
- status
- assigned to
- verified answer

Allowed actions:

- assign
- answer
- mark verified
- mark rejected
- create follow-up task

### 6. Daily Priorities

Source tables:

- tasks
- opportunities
- approval_requests
- workflow_runs
- verification_items

Show:

- top tasks
- urgent approvals
- failed workflows
- high-value opportunities
- stale verification items

## MVP Technical Scope

First version can be:

- Next.js app later
- Supabase-powered read views
- basic approval update paths
- no advanced analytics
- no complex charts

## Security Requirements

- human owner authentication required
- production actions require approval path
- all approval decisions write audit_events
- system_status updates write audit_events
- no secrets exposed in UI
- raw payloads hidden by default

## What Not To Build Yet

- complex analytics dashboard
- mobile app
- multi-user admin system
- full CRM replacement
- full project-management app
- automated outreach console
- advanced land map UI

## Definition of Done for MVP

The MVP is done when the human owner can see and manage:

1. pending approvals
2. agent activity
3. failed workflows
4. system status
5. open verification items
6. daily priorities

If the owner can supervise the system in 10 minutes each morning, the MVP is successful.
