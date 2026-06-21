# Workflow Standards

Every workflow must have purpose, trigger, inputs, outputs, canonical Supabase tables, external systems touched, risk level, approval tier, autonomy level, logging requirements, failure mode, rollback plan, cost risk estimate, and test cases.

All workflows write to `workflow_runs`. AI decisions write to `agent_runs`. Risky proposals create `approval_requests`. External syncs write/update `external_objects`.
