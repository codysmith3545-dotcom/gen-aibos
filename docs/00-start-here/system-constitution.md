# System Constitution

## Mission

GEN-AIBOS exists to give a solo operator and AI agents a safe, reusable foundation for building and operating businesses.

## Core Principles

1. Truth before automation.
2. Approval before risk.
3. Logs before autonomy.
4. Workflows before improvisation.
5. Documentation before scale.
6. Generic core before vertical modules.
7. Memory supports truth but does not replace truth.
8. AI may draft, propose, build, test, and prepare.
9. Humans retain control over money, legal commitments, client reputation, credentials, and production changes.
10. Every automation should either save time, reduce risk, create revenue, preserve knowledge, or improve decision quality.

## Non-Negotiables

- One canonical business graph in Supabase.
- GitHub is truth for code, docs, schemas, and policies.
- Every external object maps through `external_objects`.
- Every meaningful AI action logs to `agent_runs`.
- Every risky action goes through `approval_requests`.
- Every workflow logs to `workflow_runs`.
- Every production-risk workflow checks `system_status`.
- Secrets never live in GitHub, Supabase tables, prompts, or n8n notes.
