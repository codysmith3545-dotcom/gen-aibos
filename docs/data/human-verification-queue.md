# Human Verification Queue

## Purpose

The human verification queue turns uncertainty into explicit review work. It prevents AI from silently treating incomplete or conflicting information as truth.

## Core Principle

If a fact matters and is uncertain, create a verification item instead of guessing.

## Verification Item Fields

A verification item should include:

- entity_type
- entity_id
- question
- why_it_matters
- source_evidence
- risk_if_wrong
- priority
- assigned_to
- status
- verified_answer
- verified_at
- verification_source
- follow_up_action

## Status Values

- open
- assigned
- in_review
- verified
- rejected
- blocked
- no_longer_needed

## When To Create Verification Items

Create verification items when:

- source records conflict
- confidence is below threshold
- information could trigger outreach
- information could affect pricing or value
- information could affect professional review
- data is stale
- scraped data is not confirmed by an official source
- AI extraction quality is uncertain

## Land Intelligence Examples

- Does parcel X have sewer access?
- Is the owner mailing address current?
- Is zoning agricultural, residential, commercial, or transitional?
- Is road frontage sufficient and usable?
- Is this parcel in floodplain or wetlands?
- Is utility extension economically feasible?
- Is this parcel already listed or under discussion?
- Are nearby developments approved or only proposed?
- Is the parcel potentially splitable under current ordinance?
- Does access require easement review?

## Survey / Drone Examples

- What datum is the project on?
- Has control been independently checked?
- Is the client-provided benchmark reliable?
- Are vertical discrepancies documented?
- Is the deliverable draft-only or approved for release?

## CRM / Business Examples

- Is this contact the actual decision maker?
- Is this company the same as another record?
- Has this lead already been contacted?
- Did the client approve the proposal?
- Is this invoice ready for review?

## Agent Behavior

Agents may create verification items freely.

Agents may not resolve high-impact verification items without human review unless the workflow has been explicitly promoted and the source is trusted.

## Review Flow

1. Agent detects uncertainty.
2. Agent creates verification item.
3. Command Center shows open item.
4. Human or approved workflow verifies.
5. Verified answer updates canonical record.
6. audit_events records the change.
7. If the issue revealed a recurring problem, add an eval or data-quality rule.

## Done Criteria

A verification item is done only when:

- the question is answered
- the source is recorded
- the canonical record is updated if needed
- follow-up action is created if needed
- confidence score is updated if applicable
