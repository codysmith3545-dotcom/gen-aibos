# Supabase Local Validation Checklist

## Purpose

Use this checklist before connecting GEN-AIBOS to any live integrations.

The goal is to verify that the local database can start, migrations apply cleanly, seed data loads, and the safety tables exist.

## Prerequisites

- Docker installed and running
- Supabase CLI installed
- Repository cloned locally
- No production credentials in `.env`

## Commands

From the repository root:

```bash
chmod +x scripts/setup/validate_migrations.sh
./scripts/setup/validate_migrations.sh
```

Manual alternative:

```bash
supabase start
supabase db reset
```

## Expected Tables

Verify these tables exist in Supabase Studio:

- people
- organizations
- opportunities
- projects
- tasks
- documents
- messages
- external_objects
- agent_runs
- approval_requests
- workflow_runs
- system_status
- audit_events
- data_sources
- verification_items
- mistake_log

## Expected Safety Defaults

Check `system_status` has one row with:

- automation_enabled = true
- external_actions_enabled = false
- outreach_enabled = false
- payment_actions_enabled = false
- scraping_enabled = false
- production_writes_enabled = false
- emergency_mode = false

The important part is that external, outreach, payment, scraping, and production-write actions default to disabled.

## Expected Seed Data

Verify dev seed data exists:

- Example Client LLC
- Example County Planning Department
- Example Contact
- Example Generic Opportunity
- Review GEN-AIBOS foundation task
- Create first workflow spec task
- Example Source Registry Entry
- system verification item

## RLS Check

The RLS scaffold enables row-level security on the core tables but intentionally does not grant broad policies.

Expected in local development:

- tables exist
- RLS is enabled on protected tables
- app access policies are not production-ready yet

Do not treat this as production authorization.

## Failure Handling

If migration reset fails:

1. Read the first SQL error.
2. Identify which migration caused it.
3. Fix with a new migration or revise the branch before merge.
4. Do not work around failures by disabling safety tables.

## Definition of Done

This validation is complete when:

- Supabase starts locally
- migrations apply cleanly
- seed data loads
- core tables exist
- safety defaults are confirmed
- no production credentials were used
