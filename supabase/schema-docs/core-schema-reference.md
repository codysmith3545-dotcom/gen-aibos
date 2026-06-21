# Core Schema Reference

## Purpose

This document explains the starter Supabase schema in `supabase/migrations/0001_core_foundation.sql`.

The schema is intentionally generic. It should support many business types before vertical-specific modules are added.

## Sacred Tables

These tables are required for anti-silo governance and safe agent operation.

### external_objects

Maps outside system records to internal Supabase records.

Use for:

- Attio contacts and companies
- Stripe customers and invoices
- Google Drive files
- Gmail threads
- Google Calendar events
- Linear issues
- QuickBooks/Xero records
- n8n workflow executions

Important fields:

- `system_name`: external system name
- `external_id`: source system object ID
- `object_type`: person, company, invoice, email, file, issue, etc.
- `internal_table`: Supabase table name
- `internal_id`: Supabase UUID
- `raw_json`: optional source payload snapshot
- `sync_status`: active, stale, error, ignored
- `last_synced_at`: last successful sync timestamp

Do not use this table as the canonical record itself. It is a map, not the business object.

### agent_runs

Logs meaningful AI actions.

Use for:

- research runs
- workflow decisions
- document classification
- lead scoring
- parcel scoring
- proposal drafting
- debugging sessions

Important fields:

- `agent_name`
- `task_type`
- `input_summary`
- `output_summary`
- `tools_used`
- `status`
- `risk_level`
- `human_review_required`
- `related_table`
- `related_id`

Do not store raw private chain-of-thought here. Store concise operational summaries.

### approval_requests

Routes risky proposed actions to humans.

Use for:

- client-facing messages
- invoice sending
- production changes
- high-impact CRM changes
- land outreach
- workflow promotion

Important fields:

- `requested_by_agent`
- `action_type`
- `target_system`
- `proposed_action`
- `proposed_payload`
- `risk_level`
- `approval_tier`
- `approval_status`
- `approved_by`
- `approved_at`
- `related_table`
- `related_id`

### workflow_runs

Tracks every workflow execution.

Use for:

- n8n workflows
- Trigger.dev/Inngest workflows
- scripts
- scheduled jobs
- data monitors
- daily summaries

Every workflow execution must write here.

Important fields:

- `workflow_name`
- `workflow_system`
- `workflow_external_id`
- `trigger_type`
- `status`
- `input_summary`
- `output_summary`
- `error_message`
- `cost_estimate`
- `risk_level`

### system_status

Global kill switch and operating mode table.

Important flags:

- `automation_enabled`
- `external_actions_enabled`
- `outreach_enabled`
- `payment_actions_enabled`
- `scraping_enabled`
- `production_writes_enabled`
- `emergency_mode`

Workflows must check this before external or production actions.

### audit_events

Append-style record of important changes.

Use for:

- approval decision recorded
- workflow promoted
- system status changed
- important record corrected
- incident response event
- manual override

## Core Business Tables

### people

Canonical people records.

Examples:

- lead contact
- client contact
- owner contact
- partner
- vendor contact

Do not duplicate the same person for every external system. Map external IDs through `external_objects`.

### organizations

Canonical company/entity records.

Examples:

- client company
- owner LLC
- buyer
- vendor
- county agency
- utility provider

### opportunities

Potential business opportunities.

Examples:

- land opportunity
- survey/drone job lead
- AI automation lead
- project inquiry
- partnership possibility

### projects

Active or accepted work.

Examples:

- survey project
- land due diligence project
- drone mapping job
- AI automation implementation
- internal system build project

### tasks

Work items for humans or agents.

Examples:

- verify sewer availability
- review draft email
- classify uploaded document
- run parcel scoring check
- update workflow spec

Tasks may mirror Linear issues later.

### documents

Metadata for files. Original files usually live in Google Drive, Supabase Storage, or another storage system.

Do not store large raw file bodies here.

### messages

Metadata and summaries for communications.

Examples:

- Gmail thread summary
- client message
- internal note
- outreach draft

Original messages remain in Google Workspace when applicable.

## Supporting Tables

### data_sources

Tracks source reliability, known issues, refresh frequency, access method, and cost notes.

### verification_items

Human or workflow review queue for uncertain facts.

### mistake_log

Learning loop for AI/workflow mistakes.

## General Rules

1. Canonical records live in Supabase.
2. External records map through `external_objects`.
3. Workflows log to `workflow_runs`.
4. AI actions log to `agent_runs`.
5. Risky actions create `approval_requests`.
6. System-level stop flags live in `system_status`.
7. Uncertain facts create `verification_items`.
8. Repeated errors create `mistake_log` entries.

## Future Schema Work

The next schema pass should add:

- invoices
- payments
- notes
- events
- tags
- entity_aliases
- match_candidates
- memories
- eval_cases
- eval_runs
- eval_results
- cost_events
- budget_alerts

Land-specific schema should be added only after the generic foundation is stable.
