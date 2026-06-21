# n8n Export and Backup Standard

## Purpose

n8n is the integration router, not the source of truth. Workflows must be documented, exported, reviewable, and recoverable.

## Core Rules

1. No workflow without a workflow spec.
2. No important workflow without GitHub export.
3. No production workflow without owner and purpose.
4. No secrets in workflow notes.
5. No external-action workflow without approval tier.
6. No workflow touching sensitive systems without system_status check.
7. Every workflow execution must log to `workflow_runs`.
8. AI decisions must log to `agent_runs`.
9. Risky proposals must create `approval_requests`.
10. External records must map through `external_objects`.

## Naming Convention

Use:

```text
<domain>__<action>__<stage>
```

Examples:

```text
generic__daily_business_summary__shadow
gmail__lead_intake__shadow
drive__file_classifier__shadow
system__approval_request_notifier__internal
system__failed_workflow_alert__internal
n8n__export_workflows__internal
```

## Folder Structure

```text
n8n/
  exports/
    generic__daily_business_summary__shadow.json
  docs/
    generic__daily_business_summary__shadow.md
  templates/
```

## Workflow README Requirements

Every workflow doc should include:

- workflow name
- business purpose
- trigger
- input systems
- output systems
- Supabase tables touched
- external systems touched
- approval tier
- autonomy level
- risk level
- expected monthly cost
- failure mode
- rollback plan
- owner
- status

## Export Process

For every important workflow:

1. Build or update in n8n.
2. Export workflow JSON.
3. Save JSON under `n8n/exports/`.
4. Update workflow doc under `n8n/docs/`.
5. Open GitHub PR.
6. Review before production activation.

## Backup Cadence

- Active workflows: export after every meaningful change.
- Production workflows: export at least monthly.
- Major n8n instance changes: full export before and after.

## Versioning Rules

- GitHub is the version history.
- n8n UI is not the only source of workflow history.
- Workflow exports should not include secrets.
- If export includes credential references, ensure they are safe references only.

## Failure Alerts

Workflow failure handling must:

- log failed run to `workflow_runs`
- create a visible Command Center alert
- avoid infinite alert loops
- create task if human follow-up is needed

## Review Checklist

Before activating a workflow:

- spec exists
- JSON export exists
- logging works
- system_status check exists if needed
- approval tier is correct
- test cases pass
- rollback plan exists
- expected cost is understood
- owner is assigned

## Anti-Spaghetti Rule

If a workflow becomes too complex, split it.

A workflow with many unrelated responsibilities should become multiple smaller workflows with clear inputs and outputs.
