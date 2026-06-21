# Source of Truth Policy

Use many tools, but only one canonical business graph.

| Domain | Source of Truth |
|---|---|
| Code/SOPs/schemas/policies | GitHub |
| Business data | Supabase |
| Original email/calendar/files | Google Workspace |
| Accounting ledger | QuickBooks/Xero |
| Payment processor records | Stripe |
| CRM interface | Attio, mirrored to Supabase |
| Tasks/work queue | Linear, mirrored to Supabase |
| Workflow execution | n8n/Trigger/Inngest logs mirrored to Supabase |
| AI memory | Retrieval aid only |
| AI chat history | Not truth |

Rules: external records map through `external_objects`; summaries are not source records; memory is not truth; scraped data is unverified until provenance/confidence are recorded.
