# ADR-0003 — Use n8n as Integration Router

Use n8n for integration routing and early workflow automation. n8n is not the source of truth. Workflows must export to GitHub and log to Supabase. Durable critical workflows may later move to Trigger.dev/Inngest.
