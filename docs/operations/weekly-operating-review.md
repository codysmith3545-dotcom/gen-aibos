# Weekly Operating Review

## Purpose

The weekly operating review keeps GEN-AIBOS from drifting into a pile of automations. It checks whether the system is creating value, saving time, reducing risk, and learning from mistakes.

## Core Questions

Every week, answer:

1. What did AI do this week?
2. What saved time?
3. What created value?
4. What failed?
5. What was too expensive?
6. What needs approval?
7. What should be automated next?
8. What should be simplified?
9. What should be retired?
10. What did we learn?

## Review Sections

### Agent Activity

Review agent_runs count, task types, tools used, failed runs, proposed higher-risk actions, and approvals required.

### Workflow Health

Review workflow_runs count, failed workflows, slow workflows, expensive workflows, repeated errors, shadow-mode workflows, promotion candidates, and retirement candidates.

### Business Value

Review leads created, opportunities qualified, projects advanced, proposals drafted, client responses prepared, documents classified, time saved, manual steps reduced, and value created.

### Data Quality

Review open verification items, conflicting records, stale data sources, low-confidence records, duplicate entity candidates, and bad imports.

### Cost

Review total software cost, estimated agent cost, estimated workflow cost, browser or data acquisition cost, cost per useful output, and budget alerts.

### Mistakes and Learning

Review mistake_log entries, root causes, fixes added, evals added, docs updated, and workflow changes needed.

### Next Week Priorities

Choose no more than three system improvements for the next week.

## Metrics to Track

- cost_per_agent_run
- cost_per_lead_created
- cost_per_qualified_opportunity
- cost_per_parcel_screened
- cost_per_proposal_drafted
- cost_per_hour_saved
- cost_per_closed_deal
- cost_per_mistake_caught

## Review Output

Each weekly review should produce:

- summary
- wins
- failures
- cost notes
- decisions made
- follow-up issues
- retired workflows
- new eval cases

## Rule

If a workflow creates cost or risk but does not create value, improve it, pause it, or retire it.
