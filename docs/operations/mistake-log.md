# Mistake Log

## Purpose

The mistake log turns system errors into system improvements. Mistakes should not be hidden. They should become better docs, better evals, better workflows, and better guardrails.

## Core Rule

Every meaningful AI or workflow mistake should create a `mistake_log` entry and, when possible, a new eval case.

## Mistake Log Fields

- agent_run_id
- workflow_run_id
- mistake_type
- what_happened
- impact
- root_cause
- fix
- preventive_rule
- eval_added
- docs_updated
- workflow_updated
- reviewer
- created_at

## Mistake Types

- bad_data
- duplicate_record
- wrong_tool
- missing_approval
- poor_summary
- hallucinated_source
- bad_classification
- workflow_loop
- excessive_cost
- failed_sync
- wrong_entity_match
- incomplete_output
- unclear_instruction

## Mistake Handling Process

1. Detect the mistake.
2. Log what happened.
3. Identify impact.
4. Identify root cause.
5. Add a fix.
6. Add or update a rule.
7. Add an eval case when possible.
8. Update docs or workflow spec.
9. Re-test.
10. Review in weekly operating review.

## Example

Mistake: Gmail lead intake created a duplicate opportunity.

Root cause: same sender was already mapped through a different alias.

Fix: create match_candidate instead of confirmed person when email/domain evidence is incomplete.

Preventive rule: new contact creation must check `external_objects`, email, domain, and entity_aliases.

Eval added: duplicate sender with different display name.

## Rule

A repeated mistake means the system is missing either a rule, an eval, a workflow check, or a data-quality guardrail.
