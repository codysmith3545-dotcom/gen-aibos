# Workflow Spec — Daily Business Summary

## Workflow name

Daily Business Summary

## Business purpose

Create a daily operating brief that summarizes what changed, what needs attention, and what should be reviewed by the human owner.

## Trigger

Scheduled daily run, normally early morning.

## Input systems

- Supabase
- n8n workflow logs
- agent_runs
- approval_requests
- workflow_runs
- tasks
- opportunities
- verification_items
- optional: Google Workspace summaries later

## Output systems

- Supabase summary record or document metadata
- optional: email or dashboard notification after review

## Canonical Supabase tables

- agent_runs
- workflow_runs
- approval_requests
- tasks
- opportunities
- projects
- verification_items
- audit_events

## External systems touched

None in v0.

## Risk level

Low.

## Approval tier

Tier 0 for generating internal summary.

Tier 1 if sending summary notification externally.

## Autonomy level

Level 3 for internal summary generation.

## Can it contact humans externally?

No in v0.

## Can it affect finances?

No.

## Can it modify production data?

It may create an internal summary record and workflow log only.

## Expected monthly cost

Low.

## Failure mode

- summary misses important events
- summary contains stale data
- workflow fails silently
- summary is too long or noisy

## Rollback plan

Disable scheduled workflow. Existing summaries can remain as historical records.

## Logging required

- write to `workflow_runs`
- write to `agent_runs` if AI summarizes or prioritizes
- write `audit_events` only for major status changes

## Test cases

1. No activity yesterday.
2. Multiple failed workflows.
3. Pending approvals exist.
4. High-priority tasks exist.
5. Verification items are stale.
6. Agent run failed.
7. Summary should not invent facts.

## Output format

```text
Daily Business Summary
Date:

1. Top priorities
2. Pending approvals
3. Failed workflows
4. New or changed opportunities
5. Open verification items
6. Data quality warnings
7. Cost/budget warnings
8. Recommended next actions
```

## What not to do

- Do not send external emails in v0.
- Do not change business records except summary/log records.
- Do not create new strategy unless asked.
