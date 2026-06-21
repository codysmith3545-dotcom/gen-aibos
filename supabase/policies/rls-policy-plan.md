# RLS and Access-Control Policy Plan

## Purpose

This document defines the access-control plan before Row Level Security policies are implemented in Supabase.

Do not implement broad permissive RLS policies just to make development easy. Plan first, test in development, then promote carefully.

## Environment Model

### Development

- Test data only.
- Agents may write using scoped development credentials.
- Service role key should still be protected in secrets manager.
- RLS may be relaxed while schema is under development, but production assumptions must be documented.

### Staging

- Realistic test data.
- Agents may write only through expected paths.
- RLS should resemble production.
- External actions should be sandboxed or disabled.

### Production

- Read-only by default for agents.
- Writes happen only through approved workflows or human-reviewed interfaces.
- Service role key never exposed to prompts, repo files, or general agents.

## Role Model

Recommended roles:

- human_owner
- agent_builder
- agent_researcher
- agent_operator
- agent_finance_assistant
- agent_data_quality
- agent_admin_readonly
- service_workflow_runner

## Table Access Defaults

| Table | Human Owner | Builder | Researcher | Operator | Finance Assistant | Data Quality | Admin Readonly |
|---|---|---|---|---|---|---|---|
| people | read/write | dev only | read/create draft | read/update limited | read | read | read |
| organizations | read/write | dev only | read/create draft | read/update limited | read | read | read |
| opportunities | read/write | dev only | read/create draft | read/update limited | read | read | read |
| projects | read/write | dev only | read | read/update limited | read | read | read |
| tasks | read/write | dev only | create/update | create/update | read/create finance tasks | create/update quality tasks | read |
| documents | read/write | dev only | read/create metadata | read/update metadata | read | read/update quality fields | read |
| messages | read/write | dev only | read/create summaries | read/create drafts | read | read | read |
| external_objects | read/write | dev only | read/create for allowed systems | read/update allowed systems | read | read/update quality mappings | read |
| agent_runs | read/write | write own | write own | write own | write own | write own | read |
| approval_requests | read/write | create | create | create/update assigned | create | create | read |
| workflow_runs | read/write | write dev | read/write assigned workflows | read/write assigned workflows | read | read/write quality workflows | read |
| system_status | read/write | read | read | read | read | read | read |
| audit_events | read/write | write event | write event | write event | write event | write event | read |

## Service Role Key Rules

- Store only in secrets manager.
- Do not expose to agents directly.
- Prefer server-side workflow runners or controlled backend functions.
- Rotate if exposed.
- Never paste into prompts.

## Initial RLS Sequence

1. Document roles and access model.
2. Add RLS comments in schema docs.
3. Enable RLS in a development branch/schema.
4. Start with read policies for human owner and readonly agents.
5. Add insert policies for logging tables:
   - agent_runs
   - workflow_runs
   - audit_events
6. Add controlled insert policies for approval_requests.
7. Add limited update policies for tasks and verification_items.
8. Test with non-owner roles.
9. Only then consider production.

## First Tables To Protect

High priority:

- people
- organizations
- messages
- documents
- approval_requests
- system_status
- external_objects

Medium priority:

- opportunities
- projects
- tasks
- workflow_runs
- agent_runs
- audit_events

## Special Policy Notes

### system_status

Only human_owner or a tightly controlled service role should update system_status.

Agents may read it.

### approval_requests

Agents may create approval requests.

Only human_owner or approved review interface should approve/reject.

### agent_runs and workflow_runs

Agents/workflows may insert logs.

Updates should be limited to completing the same run, not modifying historical runs arbitrarily.

### external_objects

Writes should be constrained by allowed system and workflow. This table controls anti-silo mapping and should not be casually overwritten.

## Testing Requirements

Before enabling RLS in production, test:

- agent can write agent_runs
- workflow can write workflow_runs
- agent can create approval_request but cannot approve it
- readonly agent cannot mutate business data
- system_status can stop external workflows
- unauthorized update is rejected

## Open Questions

- Which auth system will front the Command Center?
- Will agents use Supabase directly, via MCP, or through server functions?
- Will production agents have only read-only SQL access?
- Will workflow runners use one service identity or separate scoped identities?

## Default Recommendation

Start with strict production defaults and permissive development only. Prefer controlled backend functions and workflow runners over direct agent production writes.
