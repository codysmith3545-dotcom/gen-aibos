# Workflow Spec — Failed Workflow Alert

## Workflow name

Failed Workflow Alert

## Business purpose

Create visible alerts when workflows fail, so broken automations do not silently degrade the system.

## Trigger

Workflow run status becomes failed, errored, timed out, or stuck.

## Input systems

- workflow_runs
- n8n execution logs later
- Trigger/Inngest logs later

## Output systems

- Supabase task or alert record
- Command Center failed workflow view
- optional owner notification later

## Canonical Supabase tables

- workflow_runs
- tasks
- audit_events

## External systems touched

None in v0.

## Risk level

Low.

## Approval tier

Tier 0 for internal alert/task creation.

Tier 1 for owner-only notification.

## Autonomy level

Level 3 for internal alerting.

## Can it contact humans externally?

Not in v0.

## Can it affect finances?

No.

## Can it modify production data?

It can create internal tasks and audit events.

## Expected monthly cost

Low.

## Failure mode

- alert not created
- duplicate alerts
- noisy alerts
- failure severity classified incorrectly

## Rollback plan

Disable alert workflow. Workflow failures remain visible in raw workflow_runs table.

## Logging required

- workflow_runs for the alert workflow itself
- audit_events for alert created
- task for follow-up when needed

## Test cases

1. Single workflow failure.
2. Repeated workflow failure.
3. Workflow timeout.
4. Non-critical warning.
5. Critical workflow failure.
6. Duplicate failure events.

## Output format

```text
Workflow Failure Alert
Workflow:
Run ID:
Status:
Error:
Severity:
First seen:
Repeated count:
Recommended action:
```

## What not to do

- Do not automatically retry high-risk workflows without review.
- Do not hide repeated failures.
- Do not create infinite alert loops.
