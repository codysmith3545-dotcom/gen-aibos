-- GEN-AIBOS RLS Scaffold
-- This migration is intentionally conservative.
-- It enables RLS and creates documentation-first placeholder policies.
-- Review and test in development/staging before production.

-- Enable RLS on core tables.
alter table if exists people enable row level security;
alter table if exists organizations enable row level security;
alter table if exists opportunities enable row level security;
alter table if exists projects enable row level security;
alter table if exists tasks enable row level security;
alter table if exists documents enable row level security;
alter table if exists messages enable row level security;
alter table if exists external_objects enable row level security;
alter table if exists agent_runs enable row level security;
alter table if exists approval_requests enable row level security;
alter table if exists workflow_runs enable row level security;
alter table if exists system_status enable row level security;
alter table if exists audit_events enable row level security;
alter table if exists data_sources enable row level security;
alter table if exists verification_items enable row level security;
alter table if exists mistake_log enable row level security;

-- NOTE:
-- Do not add broad public policies here.
-- The app should define authenticated user roles and controlled service workflows before production policies are finalized.
-- For local/dev work, use Supabase local config or a development-only policy migration.

-- Recommended future policy categories:
-- 1. human_owner full access
-- 2. agent_admin_readonly read-only access
-- 3. workflow runner insert access for workflow_runs, agent_runs, audit_events
-- 4. agent-created approval_requests insert-only access
-- 5. controlled update access for tasks and verification_items
-- 6. strict update controls for system_status

-- This file is a scaffold and does not grant access by itself.
