-- GEN-AIBOS Development Seed Data
-- Use only in local/development environments.
-- Do not run this against production.

insert into organizations (name, website, status, notes, source_system, confidence_score)
values
  ('Example Client LLC', 'https://example.com', 'active', 'Development seed organization.', 'seed', 100),
  ('Example County Planning Department', null, 'active', 'Development seed public agency.', 'seed', 100)
on conflict do nothing;

insert into people (full_name, email, phone, status, notes, source_system, confidence_score)
values
  ('Example Contact', 'example@example.com', null, 'active', 'Development seed contact.', 'seed', 100)
on conflict do nothing;

insert into opportunities (title, status, stage, value_estimate, confidence_score, next_action, source_system)
values
  ('Example Generic Opportunity', 'new', 'intake', null, 50, 'Review as seed example.', 'seed')
on conflict do nothing;

insert into tasks (title, description, status, priority, assigned_to)
values
  ('Review GEN-AIBOS foundation', 'Confirm docs, schema, and workflow standards are ready for first implementation pass.', 'open', 'high', 'human_owner'),
  ('Create first workflow spec', 'Use workflow-intake-template.md to create the first real workflow spec.', 'open', 'normal', 'agent_operator')
on conflict do nothing;

insert into data_sources (name, source_type, url, access_method, reliability_score, refresh_frequency, cost_notes, known_issues)
values
  ('Example Source Registry Entry', 'internal_note', null, 'manual', 50, 'as_needed', 'none', 'development seed only')
on conflict do nothing;

insert into verification_items (entity_type, question, why_it_matters, priority, status)
values
  ('system', 'Does the development schema match the foundation docs?', 'Needed before building live workflows.', 'high', 'open')
on conflict do nothing;
