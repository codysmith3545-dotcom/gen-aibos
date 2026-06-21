# Tool Roles

| Tool | Role | Source of Truth? |
|---|---|---|
| GitHub | Code, docs, migrations, policies, PRs | Yes, for code/process |
| Supabase | Canonical business graph | Yes, for business state |
| n8n | Integration router | No |
| Trigger.dev/Inngest | Durable workflow execution | No |
| Google Workspace | Original human comms/files/calendar | Yes, for originals |
| QuickBooks/Xero | Accounting ledger | Yes, for accounting |
| Stripe | Payment processing | Yes, for processor state |
| Attio | CRM working interface | No, synced interface |
| Linear | Work/task queue | No, synced task interface |
| Memory layer | Retrieval aid | No |
