# Workflow Spec — Approval Request Notifier

## Workflow name

Approval Request Notifier

## Business purpose

Notify the human owner when an approval request is created or becomes urgent.

## Trigger

New or updated `approval_requests` row with `approval_status = pending`.

## Input systems

- Supabase approval_requests
- Supabase related entity tables
- optional Google Workspace notification channel later

## Output systems

- notification channel
- audit_events
- workflow_runs

## Canonical Supabase tables

- approval_requests
- workflow_runs
- audit_events

## External systems touched

None in v0 if notification remains inside dashboard.

Optional later:

- Gmail
- Slack
- Google Chat

## Risk level

Low for dashboard notification. Medium if sending external notifications.

## Approval tier

Tier 0 for internal dashboard notification.

Tier 1 for sending owner-only notification.

## Autonomy level

Level 3 for internal notification.

## Can it contact humans externally?

Not in v0.

## Can it affect finances?

No.

## Can it modify production data?

Only notification status and audit log.

## Expected monthly cost

Low.

## Failure mode

- notification not sent
- duplicate notification
- low-priority request treated as urgent
- approval expires without alert

## Rollback plan

Disable notifier workflow. Approval requests remain visible in dashboard.

## Logging required

- workflow_runs
- audit_events if notification sent or failed

## Test cases

1. New low-risk approval.
2. New high-risk approval.
3. Expiring approval.
4. Duplicate approval event.
5. Notification channel disabled.

## Output format

```text
Approval Needed
Action type:
Target system:
Risk level:
Approval tier:
Proposed action:
Related record:
Expires:
```

## What not to do

- Do not auto-approve.
- Do not execute the proposed action.
- Do not send notifications to third parties.
