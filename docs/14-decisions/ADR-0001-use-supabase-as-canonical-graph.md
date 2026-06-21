# ADR-0001 — Use Supabase as Canonical Business Graph

## Decision

Use Supabase/Postgres as the canonical business graph.

## Reason

Supabase gives us Postgres, SQL, APIs, Auth, Storage, Realtime, Edge Functions, and strong agent-operability.

## Consequences

Business truth lives in Supabase. External SaaS records map through `external_objects`. Memory and summaries are not canonical truth.
