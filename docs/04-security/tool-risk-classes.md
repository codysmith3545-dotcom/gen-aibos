# Tool Risk Classes

| Class | Description | Examples |
|---|---|---|
| Read-only | Can only read/reference | Context7, docs lookup |
| Draft-only | Can prepare but not send | email draft, invoice draft |
| Internal-write | Can write internal records | Supabase dev, Linear tasks |
| External-action | Can contact people/change external state | Gmail send, Attio update |
| Financial | Can affect money/accounting | Stripe, QuickBooks/Xero |
| Destructive | Can delete/overwrite production data | DB delete, workflow deletion |
| Credential | Can expose/modify secrets | Doppler, Infisical |
