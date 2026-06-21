# Detailed Setup Checklist

## Purpose

This checklist turns GEN-AIBOS from a repo into a working local/dev foundation while keeping live systems protected until the doctrine, logging, and approval paths are ready.

## Phase 0 — Review First

Read:

1. README.md
2. AGENTS.md
3. CLAUDE.md
4. docs/00-start-here/START_HERE.md
5. docs/00-start-here/system-constitution.md
6. docs/00-start-here/system-constitution-expanded.md
7. docs/security/trusted-tools-registry.md
8. docs/workflows/workflow-promotion-process.md

## Phase 1 — GitHub Repo

1. Clone repo locally.
2. Confirm default branch is main.
3. Enable branch protection when ready.
4. Confirm AGENTS.md and CLAUDE.md are visible at repo root.
5. Do not commit secrets or .env files.

## Phase 2 — Secrets Manager

Choose Doppler, Infisical, or 1Password CLI.

Create environments:

- development
- staging
- production

The repo may reference secret names but must not contain secret values.

## Phase 3 — Supabase Development Project

1. Create a development Supabase project.
2. Use test data only.
3. Save project URL and keys in the secrets manager.
4. Review supabase/migrations/0001_core_foundation.sql.
5. Run migration only against development first.
6. Verify sacred tables exist:
   - external_objects
   - agent_runs
   - approval_requests
   - workflow_runs
   - system_status
   - audit_events
7. Confirm system_status row exists with conservative defaults.

## Phase 4 — Access Policy Planning

Before live use:

1. Complete RLS policy plan.
2. Define human and agent roles.
3. Avoid broad permissive policies.
4. Keep service-role keys out of agent prompts.
5. Test policies in staging.

## Phase 5 — n8n

1. Create n8n workspace or local instance.
2. Start with shadow-mode workflows.
3. Create first workflow spec using workflow-intake-template.md.
4. Confirm workflows write to workflow_runs before any external action.
5. Export workflow JSON to GitHub.
6. Add workflow README/spec.

## Phase 6 — Context7 and Playwright MCP

1. Configure Context7 for coding-agent docs.
2. Configure Playwright MCP locally or in staging.
3. Use Playwright first for internal dashboard testing.
4. Third-party browser automation requires review.

## Phase 7 — Google Workspace

1. Set up business email/calendar/Drive.
2. Create expected folder structure.
3. Connect read/draft workflows before send workflows.
4. Sending workflows require approval.
5. Drive classification starts in shadow mode.

## Phase 8 — Accounting and Payments

1. Set up QuickBooks or Xero as accounting truth.
2. Set up Stripe test mode before live mode.
3. Sync summaries and IDs into Supabase.
4. Use drafts and review packets first.
5. Keep final account changes human-reviewed.

## Phase 9 — First Workflows

Start with:

1. Daily Business Summary
2. Gmail Lead Intake — shadow mode
3. Google Drive File Classifier — shadow mode
4. Approval Request Notifier
5. Failed Workflow Alert
6. n8n Export to GitHub

## Phase 10 — Command Center MVP

Build only the minimum dashboard:

- pending approvals
- agent runs
- failed workflows
- system status
- open verification items
- daily priorities

Do not build advanced dashboards until workflows produce real data.

## Phase 11 — Land Module

Only after generic core works:

1. Complete land source registry.
2. Create first county source profile.
3. Import a small test dataset.
4. Score in shadow mode.
5. Create human verification items.
6. Keep outreach in draft/review mode until promoted.

## Completion Criteria

The foundation is ready for serious use when:

- repo doctrine is complete
- Supabase dev schema runs
- secrets are managed outside repo
- n8n exports are versioned
- first workflows log correctly
- approvals show in Command Center
- system_status controls work
- errors create visible alerts
- weekly review process is active
