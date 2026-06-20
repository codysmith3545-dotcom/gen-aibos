-- GEN-AIBOS Core Foundation Schema
-- Safe starter migration. Review before running in production.

create extension if not exists "pgcrypto";

create table if not exists people (
  id uuid primary key default gen_random_uuid(),
  full_name text,
  email text,
  phone text,
  status text default 'active',
  notes text,
  source_system text,
  confidence_score numeric(5,2),
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists organizations (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  website text,
  status text default 'active',
  notes text,
  source_system text,
  confidence_score numeric(5,2),
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists opportunities (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  organization_id uuid references organizations(id),
  person_id uuid references people(id),
  status text default 'new',
  stage text,
  value_estimate numeric,
  confidence_score numeric(5,2),
  next_action text,
  source_system text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists projects (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  organization_id uuid references organizations(id),
  opportunity_id uuid references opportunities(id),
  status text default 'active',
  description text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists tasks (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text,
  status text default 'open',
  priority text default 'normal',
  due_at timestamptz,
  project_id uuid references projects(id),
  opportunity_id uuid references opportunities(id),
  assigned_to text,
  created_by_agent text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists documents (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  document_type text,
  storage_system text,
  storage_url text,
  project_id uuid references projects(id),
  opportunity_id uuid references opportunities(id),
  source_system text,
  source_file_id text,
  confidence_score numeric(5,2),
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists messages (
  id uuid primary key default gen_random_uuid(),
  message_type text,
  subject text,
  body_summary text,
  direction text,
  person_id uuid references people(id),
  organization_id uuid references organizations(id),
  project_id uuid references projects(id),
  opportunity_id uuid references opportunities(id),
  source_system text,
  source_thread_id text,
  source_message_id text,
  received_at timestamptz,
  created_at timestamptz default now()
);

create table if not exists external_objects (
  id uuid primary key default gen_random_uuid(),
  system_name text not null,
  external_id text not null,
  object_type text not null,
  internal_table text,
  internal_id uuid,
  raw_json jsonb,
  sync_status text default 'active',
  last_synced_at timestamptz,
  created_at timestamptz default now(),
  updated_at timestamptz default now(),
  unique(system_name, external_id, object_type)
);

create table if not exists agent_runs (
  id uuid primary key default gen_random_uuid(),
  agent_name text not null,
  task_type text,
  input_summary text,
  output_summary text,
  tools_used jsonb default '[]'::jsonb,
  status text default 'started',
  risk_level text,
  human_review_required boolean default false,
  related_table text,
  related_id uuid,
  started_at timestamptz default now(),
  completed_at timestamptz,
  created_at timestamptz default now()
);

create table if not exists approval_requests (
  id uuid primary key default gen_random_uuid(),
  requested_by_agent text,
  action_type text not null,
  target_system text,
  proposed_action text not null,
  proposed_payload jsonb,
  risk_level text not null,
  approval_tier integer not null default 2,
  approval_status text default 'pending',
  approved_by text,
  approved_at timestamptz,
  rejected_by text,
  rejected_at timestamptz,
  expires_at timestamptz,
  related_table text,
  related_id uuid,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists workflow_runs (
  id uuid primary key default gen_random_uuid(),
  workflow_name text not null,
  workflow_system text default 'n8n',
  workflow_external_id text,
  trigger_type text,
  status text default 'started',
  input_summary text,
  output_summary text,
  error_message text,
  cost_estimate numeric,
  risk_level text,
  started_at timestamptz default now(),
  completed_at timestamptz,
  created_at timestamptz default now()
);

create table if not exists system_status (
  id integer primary key default 1,
  automation_enabled boolean default true,
  external_actions_enabled boolean default false,
  outreach_enabled boolean default false,
  payment_actions_enabled boolean default false,
  scraping_enabled boolean default false,
  production_writes_enabled boolean default false,
  emergency_mode boolean default false,
  status_note text,
  updated_by text,
  updated_at timestamptz default now(),
  constraint single_system_status_row check (id = 1)
);

insert into system_status (id, status_note)
values (1, 'Initial safe defaults: external actions disabled.')
on conflict (id) do nothing;

create table if not exists audit_events (
  id uuid primary key default gen_random_uuid(),
  event_type text not null,
  actor text,
  actor_type text,
  target_table text,
  target_id uuid,
  summary text,
  payload jsonb,
  created_at timestamptz default now()
);

create table if not exists data_sources (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  source_type text,
  url text,
  access_method text,
  reliability_score numeric(5,2),
  refresh_frequency text,
  cost_notes text,
  terms_notes text,
  known_issues text,
  last_checked_at timestamptz,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists verification_items (
  id uuid primary key default gen_random_uuid(),
  entity_type text not null,
  entity_id uuid,
  question text not null,
  why_it_matters text,
  source_evidence text,
  priority text default 'normal',
  status text default 'open',
  assigned_to text,
  verified_answer text,
  verified_at timestamptz,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists mistake_log (
  id uuid primary key default gen_random_uuid(),
  agent_run_id uuid references agent_runs(id),
  mistake_type text,
  what_happened text,
  impact text,
  root_cause text,
  fix text,
  preventive_rule text,
  eval_added boolean default false,
  created_at timestamptz default now()
);

create index if not exists idx_external_objects_internal on external_objects(internal_table, internal_id);
create index if not exists idx_external_objects_system on external_objects(system_name, object_type);
create index if not exists idx_agent_runs_status on agent_runs(status);
create index if not exists idx_approval_requests_status on approval_requests(approval_status);
create index if not exists idx_workflow_runs_status on workflow_runs(status);
create index if not exists idx_tasks_status on tasks(status);
create index if not exists idx_opportunities_status on opportunities(status);
