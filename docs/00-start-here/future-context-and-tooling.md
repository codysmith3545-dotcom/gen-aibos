# Future Context and Tooling Inventory

## Purpose

This file preserves broader context from the design conversation that should not be lost, even if it is not part of the initial core stack.

The trusted tools registry governs the tools that agents may currently use. This file is broader: it captures tools, verticals, future modules, optional integrations, and domain-specific software that may matter later.

## Rule

A tool listed here is not automatically approved for agent use.

Before any tool is used by agents, it must be promoted into `docs/security/trusted-tools-registry.md` with purpose, risk class, allowed agents, environments, approval tier, and emergency disable method.

---

# Core Stack Already Represented

The core stack already appears in the trusted tools registry and architecture docs:

- GitHub
- Claude Code
- Codex
- Supabase
- n8n
- Google Workspace
- QuickBooks/Xero
- Stripe
- Attio
- Linear
- Context7
- Playwright MCP
- Browserbase / Apify
- Vercel / Cloudflare
- PostHog / Sentry
- Doppler / Infisical / 1Password CLI

---

# Durable Workflow Engines

These were discussed as future production workflow layers after n8n proves the early patterns.

## Trigger.dev

Use case:

- durable workflows
- long-running jobs
- retries
- typed workflow code
- production-grade task orchestration

Status:

- future candidate
- not initial source of truth
- add after n8n prototypes prove value

## Inngest

Use case:

- event-driven durable workflows
- retries and step functions
- production workflow orchestration

Status:

- future candidate
- not initial source of truth
- evaluate against Trigger.dev when workflows become critical

---

# Integration Platforms and Agent Tooling Candidates

These may be useful later but should not be added until a real workflow needs them.

## Pipedream

Use case:

- API integration
- event triggers
- developer-friendly automation

Status:

- optional alternative or complement to n8n

## Composio

Use case:

- agent tool integrations
- app connectors
- unified tool permissioning

Status:

- optional future layer
- only add if it meaningfully reduces custom connector work

## Zapier / Make

Use case:

- simple business automations
- quick prototypes

Status:

- not preferred as core
- may be used for one-off non-critical automations

## Browser-use / Stagehand-style Browser Automation

Use case:

- browser tasks where no API exists
- structured browser automation

Status:

- fallback only
- prefer APIs, exports, and official sources first

---

# Database, Backend, and Infrastructure Alternatives

These were discussed or implied as possible stack alternatives.

## PlanetScale

Use case:

- high-scale MySQL/Vitess database
- strong performance and branching

Status:

- not preferred first foundation
- may be useful later if scale/performance requirements justify it
- Supabase remains canonical first

## Prisma

Use case:

- ORM and type-safe database access

Status:

- optional if the app code benefits from it
- do not add before app architecture is known

## Drizzle

Use case:

- lightweight TypeScript SQL ORM

Status:

- optional alternative to Prisma

## Convex

Use case:

- reactive backend/app platform

Status:

- interesting but not canonical first
- avoid introducing competing source of truth

## Railway / Render / Fly.io

Use case:

- app hosting
- workers
- simple backend services

Status:

- optional if Vercel/Cloudflare are not sufficient

## Docker

Use case:

- reproducible local development
- self-hosting services
- local Supabase/n8n/dev environment

Status:

- likely useful for local/dev setup
- should be added when local dev workflow is created

---

# CRM, Operations, and Business Apps

## HubSpot

Use case:

- CRM
- email marketing
- sales pipeline

Status:

- optional alternative to Attio
- avoid duplicate CRM truth

## Airtable

Use case:

- lightweight operational tables
- manual review interfaces
- prototypes

Status:

- useful for prototypes
- should not become canonical business truth if Supabase is canonical

## Notion

Use case:

- notes
- lightweight docs
- planning

Status:

- optional personal/team interface
- GitHub remains source of truth for system docs

## Odoo / Zoho

Use case:

- all-in-one business suite
- ERP/CRM/accounting style workflows

Status:

- not core
- could replace some SaaS choices if business scale changes

## Shopify

Use case:

- ecommerce businesses

Status:

- future vertical-specific tool only

## Jobber

Use case:

- local service business operations
- scheduling, invoicing, customer management for lawn/service work

Status:

- relevant to local services module
- not core to GEN-AIBOS foundation

---

# Land, Real Estate, and Outreach Tools

These are relevant to the land intelligence and real estate modules.

## DealMachine

Use case:

- property lead lists
- owner data
- driving-for-dollars style workflows
- exported property datasets

Status:

- important for land/real-estate module
- should be added to trusted registry before syncing data

## BatchLeads

Use case:

- real estate lead enrichment
- property data
- skip tracing workflows

Status:

- future land/real-estate module candidate

## BatchDialer

Use case:

- calling workflows

Status:

- high-risk outreach tool
- must remain human-controlled and compliance-reviewed

## Launch Control

Use case:

- real estate texting/outreach

Status:

- high-risk outreach tool
- drafts/review only until compliance reviewed

## GoHighLevel

Use case:

- CRM and marketing automation
- campaign management

Status:

- optional; avoid duplicate CRM if Attio is used

## HubSpot / Attio Choice

Default:

- Attio as lean CRM interface

Alternative:

- HubSpot if marketing/sales operations require heavier CRM features

## Public Records and Government Sources

Examples:

- county GIS
- assessor/tax records
- recorder documents
- zoning ordinances
- zoning maps
- plan commission agendas/minutes
- permit portals
- IDEM/state permit records
- IURC/utility records
- INDOT/transportation records
- FEMA/floodplain
- wetlands/soils sources
- sheriff sale and tax sale sources

Status:

- these should be represented as `data_sources`, not generic tools
- source reliability, known issues, and refresh cadence are required

---

# Surveying, Drone, Civil, and GIS Software

These are relevant to the survey/drone vertical, but should not be part of the generic core unless a workflow needs them.

## Civil 3D

Use case:

- CAD drafting
- survey deliverables
- surfaces, alignments, plans, exhibits

Status:

- survey/drone vertical tool
- agent automation should be cautious and human-reviewed

## QGIS

Use case:

- GIS analysis
- parcel/source data processing
- map layers
- spatial joins

Status:

- valuable for land intelligence and GIS workflows
- likely early technical tool for land module

## Pix4Dmapper

Use case:

- photogrammetry processing
- drone mapping

Status:

- survey/drone vertical tool

## Virtual Surveyor

Use case:

- drone topo extraction
- surface cleanup
- survey deliverables

Status:

- survey/drone vertical tool

## CloudCompare

Use case:

- point cloud processing
- LiDAR/photogrammetry comparison

Status:

- survey/drone vertical tool

## Magnet Field / Topcon / Trimble / GNSS Tools

Use case:

- field data collection
- survey control
- staking
- machine control

Status:

- domain-specific field tools
- AI should assist documentation/checklists, not make final professional calls

## INCORS / State Plane / Coordinate Systems

Use case:

- geodetic control
- coordinate transformations
- datum tracking

Status:

- survey/geospatial doctrine should include datum/source tracking

---

# AI Frameworks and Agent Platforms

## Mastra.ai

Use case:

- agent framework
- workflows/evals/observability style AI app patterns

Status:

- research candidate
- not needed for initial GEN-AIBOS unless it clearly simplifies implementation

## MagicPath.ai

Use case:

- rapid AI product/service prototyping

Status:

- possible business-service accelerator
- not part of core foundation

## Claude Code

Use case:

- deep repo work
- architecture cleanup
- docs consistency
- schema reasoning
- workflow design
- refactors

Status:

- primary coding/architecture agent

## Codex

Use case:

- scoped implementation tasks
- SQL cleanup
- scripts/tests/evals
- PR generation
- GitHub/Linear issue execution

Status:

- primary implementation agent

## Hermès / Experimental Agents

Use case:

- experimental agent research

Status:

- not core
- do not depend on experimental agents for production operations

---

# Future Vertical Modules

## Land Intelligence

Status:

- first planned vertical
- docs and source registry started
- schema/workflows pending

## Survey / Drone Services

Future capabilities:

- project intake
- control/datum notes
- field visit records
- drone mission records
- deliverable tracking
- accuracy report templates
- client review items

## AI Agency / Automation Services

Future capabilities:

- client intake
- automation audit
- workflow blueprint
- implementation tasks
- client approvals
- case studies

## Local Services / Lawn Care

Future capabilities:

- customer records
- recurring jobs
- route/schedule tracking
- estimates/invoices
- seasonal campaigns
- Jobber integration

## Real Estate Acquisition / Wholesaling

Future capabilities:

- lead source imports
- owner/contact verification
- outreach draft review
- buyer pipeline
- property/deal thesis
- due diligence tasks

## Campground / Outdoor Visualization Concept

Future concept:

- campground mapping and visualization
- LiDAR/photogrammetry or 3D preview data
- booking decision support

Status:

- idea archive only
- not core

---

# Future Data Model Ideas

These should be considered after core workflow proves value:

- events
- notes
- tags
- assets
- invoices
- payments
- business_metrics_daily
- tool_calls
- source_records
- data_quality_checks
- entity_aliases
- match_candidates
- memories
- memory_sources
- decisions
- agent_lessons
- eval_cases
- eval_runs
- eval_results
- incident_reports
- cost_events
- budget_alerts
- restore_tests
- workflow_status_history
- weekly_reviews
- retired_workflows

---

# Future Build Roadmap

## Near Term

1. Supabase local config and migration validation.
2. Basic Command Center app scaffold.
3. Internal-only n8n workflow JSON exports.
4. Eval runner script.
5. Land intelligence v0 schema proposal.
6. Backup/export scripts.
7. Cost tracking placeholders.
8. GitHub Actions validation workflow.

## Medium Term

1. Real RLS policies.
2. Google Workspace read/draft workflows.
3. Attio/CRM sync.
4. Stripe test-mode sync.
5. QuickBooks/Xero read-only sync.
6. Land county source profiles.
7. Parcel import and scoring in shadow mode.
8. Command Center approval UI.

## Long Term

1. Durable workflows with Trigger.dev or Inngest.
2. pgvector or managed memory layer.
3. Entity resolution engine.
4. Cost/ROI dashboard.
5. Workflow self-improvement through PRs.
6. Land intelligence expansion across Indiana.
7. Survey/drone module.
8. AI agency module.
9. Local services module.

---

# Rule for Future Agents

This file is broad context, not permission.

Agents may not connect, purchase, configure, or use any tool from this file unless:

1. there is a real workflow need,
2. the tool is added to the trusted tools registry,
3. approval tier is defined,
4. secrets are managed correctly,
5. source-of-truth impact is understood,
6. rollback/emergency disable path is documented.
