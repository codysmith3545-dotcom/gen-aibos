# Workflow Promotion Process

## Purpose

No workflow should go from idea to production in one jump. GEN-AIBOS promotes workflows gradually so bad logic, prompt injection, unexpected costs, or bad data do not create business risk.

## Lifecycle

1. Idea
2. Spec
3. Local test
4. Staging test
5. Shadow mode
6. Human-reviewed mode
7. Limited production
8. Full production
9. Deprecated
10. Retired

## Stage Definitions

### 1. Idea

A rough concept. No automation is built yet.

Required output:

- short purpose
- expected business value
- likely systems touched
- obvious risks

### 2. Spec

A completed workflow intake document.

Required:

- trigger
- inputs
- outputs
- canonical Supabase tables
- external systems touched
- risk level
- approval tier
- autonomy level
- logging requirements
- failure mode
- rollback plan
- cost estimate
- test cases

### 3. Local Test

Run only with fake data or isolated local resources.

Allowed:

- local database
- mock payloads
- local scripts
- test credentials

Not allowed:

- live external actions
- client-facing messages
- production data changes

### 4. Staging Test

Run against staging or sandbox resources.

Required:

- logs to `workflow_runs`
- no live external action unless sandboxed
- failure behavior observed
- expected cost confirmed

### 5. Shadow Mode

The workflow predicts what it would do but does not execute external actions.

Required for:

- outreach
- payments/accounting
- production writes
- land scoring that could trigger outreach
- workflows using new data sources
- workflows affecting client reputation

### 6. Human-Reviewed Mode

The workflow prepares actions and a human reviews each action before execution.

Examples:

- draft client email
- draft invoice
- draft opportunity score
- draft property outreach list
- draft CRM update

### 7. Limited Production

The workflow runs in production with constraints.

Required constraints:

- limited volume
- clear owner
- logs enabled
- budget cap or monitoring
- rollback plan
- approval tier enforced

### 8. Full Production

The workflow is trusted for its defined scope.

Still required:

- `workflow_runs` logging
- `system_status` checks
- failure alerts
- periodic review
- retirement path

### 9. Deprecated

Workflow should not be expanded. It exists temporarily for compatibility or transition.

### 10. Retired

Workflow is disabled and archived.

## Promotion Criteria

A workflow can move forward only if:

- it has a written spec
- it logs correctly
- it handles errors
- it has a documented rollback plan
- it has a cost-risk estimate
- it has test/eval cases
- it maps external objects correctly
- it uses the correct approval tier
- the human owner approves promotion

## Autonomy Rules

No new workflow starts above Level 3.

External actions normally require Level 4 or higher and must be approval-gated.

Recurring workflows may reach Level 5 only after successful shadow/human-reviewed operation.

## Required Database Touchpoints

Every workflow should use at least one of:

- `workflow_runs`
- `agent_runs`
- `approval_requests`
- `external_objects`
- `audit_events`

## Review Cadence

- New workflow: review weekly until stable
- Production workflow: review monthly
- High-risk workflow: review after every incident or major change

## Retirement Questions

During review, ask:

- Is this workflow still used?
- Did it save time or create value?
- Did it create bad data?
- Did it cost too much?
- Does another workflow now replace it?
- Should it be paused, simplified, or retired?
