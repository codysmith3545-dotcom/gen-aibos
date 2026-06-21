# Agent Permissions

## Agent Identities

- agent_builder
- agent_researcher
- agent_operator
- agent_finance_assistant
- agent_data_quality
- agent_admin_readonly
- human_owner

## Defaults

Builder can write code/docs/migrations in dev but not production/money/outreach. Researcher can read public sources and draft opportunities but not outreach/money/schema. Operator can create internal tasks/drafts but not external messages without approval. Finance assistant can draft invoices/reports but not refunds/reconciliation/money movement. Admin readonly can write nothing.

Agents should see only the tools required for the current task.
