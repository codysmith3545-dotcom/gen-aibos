# External Objects Policy

`external_objects` maps records from outside systems to internal Supabase records.

Required for Attio contacts/companies/deals, Stripe customers/invoices/payments, Google Drive files, Gmail threads/messages, Calendar events, Linear issues, QuickBooks/Xero records, n8n workflow executions, Vercel deployments, and Sentry/PostHog events when needed.

Rule: if an outside system has an ID, preserve it.
