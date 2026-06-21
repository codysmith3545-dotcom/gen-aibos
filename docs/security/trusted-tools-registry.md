# Trusted Tools Registry

## Purpose

The trusted tools registry defines what each external tool is allowed to do, which agents may use it, which environments it may touch, and which actions require approval.

This registry prevents tool sprawl and prevents agents from seeing or using tools they do not need.

## Registry Fields

Every tool entry should include:

- tool_name
- purpose
- risk_class
- allowed_agents
- allowed_environments
- can_read
- can_write
- can_contact_external_humans
- can_affect_finances
- can_modify_production
- approval_tier
- emergency_disable_method
- notes

## Risk Classes

| Risk Class | Meaning |
|---|---|
| Read-only | Can retrieve context or docs only |
| Draft-only | Can prepare work but not execute externally |
| Internal-write | Can write internal records or repo files |
| External-action | Can change external state or contact people |
| Financial | Can affect invoices, payments, accounting, or billing |
| Destructive | Can delete, overwrite, or irreversibly change important data |
| Credential | Can expose, modify, or grant access to secrets |

## Initial Tool Registry

### GitHub

- Purpose: code, docs, schemas, policies, issues, pull requests, ADRs
- Risk class: internal-write
- Allowed agents: agent_builder, agent_operator, agent_admin_readonly
- Allowed environments: all, but production changes via PR only
- Can read: yes
- Can write: yes, through branches/PRs
- Can contact external humans: no, except GitHub comments/issues
- Can affect finances: no
- Can modify production: indirectly through reviewed deployment workflows
- Approval tier: Tier 0 for docs/branches, Tier 2 for production-impacting changes
- Emergency disable: revoke GitHub app/token or disable agent access

### Supabase

- Purpose: canonical business graph, logs, approvals, workflow state
- Risk class: internal-write / destructive if production writes are allowed
- Allowed agents: agent_builder in dev/staging, agent_operator with limited workflows, agent_admin_readonly for read-only
- Allowed environments: dev/staging write; production read-only by default
- Can read: yes
- Can write: dev/staging yes; production only via approved workflows
- Can contact external humans: no
- Can affect finances: only by storing records, not by executing financial actions
- Can modify production: only with approval
- Approval tier: Tier 2 for production writes, Tier 3 for destructive changes
- Emergency disable: set `system_status.production_writes_enabled = false`, revoke keys

### n8n

- Purpose: integration router and workflow automation
- Risk class: internal-write / external-action depending on workflow
- Allowed agents: agent_builder for dev workflow creation, agent_operator for approved workflow monitoring
- Allowed environments: dev/staging initially; production only after workflow promotion
- Can read: yes
- Can write: yes, depending on connected credentials
- Can contact external humans: only if workflow approval tier permits
- Can affect finances: only if connected to financial tools; normally disabled
- Can modify production: only through approved workflows
- Approval tier: workflow-specific
- Emergency disable: disable workflows, revoke n8n credentials, set `system_status.automation_enabled = false`

### Google Workspace

- Purpose: email, calendar, files, Docs, Sheets, Drive originals
- Risk class: read-only, draft-only, or external-action depending on use
- Allowed agents: agent_operator, agent_researcher, agent_admin_readonly
- Allowed environments: production read/draft; external sends approval-gated
- Can read: yes
- Can write: drafts and internal files; final sends require approval unless workflow promoted
- Can contact external humans: yes, but approval required
- Can affect finances: no, except document/invoice drafts
- Can modify production: not applicable
- Approval tier: Tier 1 for drafts, Tier 2 for external sends
- Emergency disable: revoke OAuth or disable Gmail/Drive workflows

### QuickBooks/Xero

- Purpose: accounting truth
- Risk class: financial
- Allowed agents: agent_finance_assistant read/draft only, human_owner final approval
- Allowed environments: production read; writes approval-gated
- Can read: yes
- Can write: draft or approved only
- Can contact external humans: possible through invoices, approval required
- Can affect finances: yes
- Can modify production: yes, approval required
- Approval tier: Tier 2 for invoices, Tier 3 for adjustments/reconciliations
- Emergency disable: revoke accounting integration token

### Stripe

- Purpose: payment processor and revenue events
- Risk class: financial
- Allowed agents: agent_finance_assistant read/draft, agent_operator for webhook sync, human_owner for approvals
- Allowed environments: test mode for development; live mode approval-gated
- Can read: yes
- Can write: approved payment links/invoices/subscription changes only
- Can contact external humans: payment emails/receipts, approval required if initiated by AI
- Can affect finances: yes
- Can modify production: yes, approval required
- Approval tier: Tier 2 for sending invoice/payment link, Tier 3 for refunds or high-impact changes
- Emergency disable: revoke live key, switch to test mode, disable payment actions

### Attio

- Purpose: CRM interface for people, companies, deals, notes, and pipeline
- Risk class: internal-write / external-action if used for outreach
- Allowed agents: agent_researcher, agent_operator, agent_admin_readonly
- Allowed environments: production with scoped write rules
- Can read: yes
- Can write: yes for records/notes/tasks
- Can contact external humans: not by default
- Can affect finances: indirectly through pipeline only
- Can modify production: yes, record changes; bulk changes require approval
- Approval tier: Tier 0/1 for notes/tasks, Tier 2 for bulk stage changes or outreach-triggering actions
- Emergency disable: revoke Attio token

### Linear

- Purpose: agent work queue and implementation tasks
- Risk class: internal-write
- Allowed agents: agent_builder, agent_operator, agent_admin_readonly
- Allowed environments: production okay for task tracking
- Can read: yes
- Can write: yes
- Can contact external humans: internal comments only
- Can affect finances: no
- Can modify production: no
- Approval tier: Tier 0 for task creation/updates
- Emergency disable: revoke Linear token

### Context7

- Purpose: current documentation for coding agents
- Risk class: read-only
- Allowed agents: agent_builder, agent_researcher
- Allowed environments: all
- Can read: external docs
- Can write: no
- Approval tier: Tier 0
- Emergency disable: remove MCP config

### Playwright MCP

- Purpose: browser/UI verification and testing
- Risk class: read-only or external-action depending on target site
- Allowed agents: agent_builder, agent_data_quality
- Allowed environments: local/staging by default
- Can read: yes
- Can write: only in test/staging unless explicitly approved
- Can contact external humans: no
- Approval tier: Tier 0 for local tests, Tier 2 for production or third-party sites
- Emergency disable: remove browser automation credentials and disable workflows

### Browserbase / Apify

- Purpose: managed browser sessions and public data acquisition
- Risk class: external-action / cost-risk
- Allowed agents: agent_researcher, agent_data_quality
- Allowed environments: limited production only after source review
- Can read: public or authorized sources
- Can write: no unless explicitly designed
- Can contact external humans: no
- Can affect finances: through usage cost only
- Approval tier: Tier 2 for new scraping/monitoring jobs
- Emergency disable: stop jobs, revoke keys, set `scraping_enabled = false`

### Vercel / Cloudflare

- Purpose: dashboard, deployment, edge/API/security layer
- Risk class: internal-write / production-impacting
- Allowed agents: agent_builder in branches/staging; production approval-gated
- Can read: logs/config
- Can write: deployments/config with approval
- Approval tier: Tier 1 for preview deployments, Tier 2 for production config changes
- Emergency disable: pause deployments, revoke tokens, rollback deployment

### PostHog / Sentry

- Purpose: observability, analytics, debugging, error-to-PR loop
- Risk class: read-only / internal-write for flags or config
- Allowed agents: agent_builder, agent_operator, agent_admin_readonly
- Can read: yes
- Can write: feature flags/config only with approval
- Approval tier: Tier 0 read, Tier 2 production feature flag changes
- Emergency disable: revoke tokens

### Doppler / Infisical / 1Password CLI

- Purpose: secrets management
- Risk class: credential
- Allowed agents: none by default for raw secret values; agents may reference secret names only
- Can read: secret names only unless human explicitly permits
- Can write: human only
- Approval tier: Tier 3 for credential changes
- Emergency disable: rotate credentials and revoke tokens

## Maintenance Rule

Any new tool must be added to this registry before agents can use it.
