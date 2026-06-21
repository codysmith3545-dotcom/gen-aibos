# Entity Resolution

## Purpose

Entity resolution prevents duplicate or conflicting records when the same real-world person, company, property, parcel, document, or project appears across multiple systems.

## Core Problem

The same entity may appear as:

- Supabase person
- Attio contact
- Gmail sender
- Stripe customer
- QuickBooks/Xero customer
- Google Drive file owner
- Linear participant
- parcel owner
- company alias
- county record name

If the system does not resolve these correctly, it can create duplicate leads, duplicate follow-up, bad reports, and bad decisions.

## Core Tables

The minimum system uses `external_objects` for external ID mapping.

As the system matures, add:

- entities
- entity_aliases
- match_candidates
- merge_decisions

## Matching Signals

Possible signals include:

- exact email match
- normalized phone match
- company domain match
- external system ID match
- mailing address match
- parcel owner name match
- fuzzy name similarity
- shared document/project relationship
- known alias
- human-confirmed match

## Match Confidence

| Confidence | Meaning |
|---:|---|
| 0–40 | likely not a match |
| 41–70 | possible match, review needed |
| 71–90 | likely match, review recommended |
| 91–100 | confirmed match or exact trusted ID match |

## Review-Required Matches

Require human review when a match could affect:

- outreach
- payment/accounting records
- land ownership or property records
- professional deliverables
- high-value opportunities
- records with conflicting source data
- records matched only by fuzzy name similarity

## Merge Decision Requirements

A merge decision should record:

- candidate records
- match reason
- confidence score
- reviewer if applicable
- fields kept
- fields rejected
- timestamp
- rollback note

## Land Intelligence Examples

- Same owner appears as Smith Farms LLC, Smith Farm LLC, and Smith Farms L.L.C.
- Mailing address differs between assessor and recorder
- A parcel owner name matches a CRM company but not the mailing address
- Multiple parcels share one ownership entity
- County parcel ID format changes between exports

## Agent Behavior

Agents may create match candidates and recommendations.

Agents should not finalize high-impact matches without review.

Agents should explain why records appear related and what evidence supports or conflicts with the match.

## Output Standard

Every match recommendation should include:

- proposed canonical entity
- records being considered
- evidence for match
- evidence against match
- confidence score
- recommended action
- whether human review is required
