# Sacred Tables

These tables make the system safe and non-siloed.

- `external_objects`: maps every external SaaS/platform record to an internal record.
- `agent_runs`: logs meaningful AI actions.
- `approval_requests`: routes risky proposed actions to humans.
- `workflow_runs`: tracks workflow execution and failures.
- `system_status`: kill switch and operating mode flags.
- `audit_events`: append-only record of important changes.
