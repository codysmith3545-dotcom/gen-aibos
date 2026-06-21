# Approval Tiers

| Tier | Name | Behavior |
|---|---|---|
| 0 | Auto-run | Safe internal action |
| 1 | Notify after | Low-risk action; notify human |
| 2 | Approval before action | Risky action requires approval |
| 3 | Approval + second check | High-risk action |
| 4 | Never autonomous | AI may only prepare/draft |

Examples: summarize email = 0; create internal task = 0; draft client email = 1; send client email = 2; send invoice = 2; modify production DB = 2; refund = 3; delete production data = 3; sign contract/file legal docs/move money = 4.
