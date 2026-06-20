# Environment Model

## Environments

Local, Development, Staging, Production.

## Rules

Local/dev allows agent writes with test data. Staging allows logged workflow testing. Production is read-only by default; writes happen only through approved workflows. External actions are gated by approval tier. Destructive operations require backup and explicit human authorization.
