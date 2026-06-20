# Kill Switch Policy

`system_status` flags: automation_enabled, external_actions_enabled, outreach_enabled, payment_actions_enabled, scraping_enabled, production_writes_enabled, emergency_mode.

When emergency_mode is true: no external actions, no outreach, no payment actions, no production writes. Workflows may log and notify only.
