# System Overview

Claude Code + Codex → GitHub → Supabase → n8n → Trigger.dev/Inngest later → external systems → Command Center → observability/testing.

## Layer Responsibilities

GitHub stores code/SOPs/policies/migrations. Supabase stores canonical business state, logs, approvals, and workflow state. n8n routes integrations. Trigger/Inngest eventually handle durable workflows. Google Workspace stores original communications/files/calendar. QuickBooks/Xero holds accounting truth. Stripe handles payments. Attio is a CRM interface. Vercel/Cloudflare deploy dashboards/APIs. Context7 supplies current docs. Playwright tests browser/UI flows.
