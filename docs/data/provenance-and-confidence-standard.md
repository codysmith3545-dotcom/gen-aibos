# Provenance and Confidence Standard

## Purpose

GEN-AIBOS must distinguish between source records, normalized records, AI summaries, and memory. This is especially important for land intelligence, public records, CRM data, financial data, and any decision that could trigger outreach or investment.

## Core Rule

No source-derived insight is considered decision-ready unless it has provenance and confidence metadata.

## Required Provenance Fields

Important source-derived records should include:

- `source_system`
- `source_url`
- `source_file_id`
- `source_record_id`
- `pulled_at`
- `last_verified_at`
- `verification_status`
- `confidence_score`
- `confidence_reason`
- `human_verified`
- `conflict_count`

## Verification Status Values

Recommended values:

- `unverified`
- `machine_checked`
- `human_review_needed`
- `human_verified`
- `conflicting_sources`
- `stale`
- `rejected`

## Confidence Score Scale

| Score | Meaning |
|---:|---|
| 0–20 | Very low confidence; do not act |
| 21–40 | Low confidence; use only for research queue |
| 41–60 | Medium confidence; human review required |
| 61–80 | High confidence; usable with normal review |
| 81–100 | Very high confidence; verified or strongly supported |

## Confidence Inputs

Confidence should consider:

1. Source reliability
2. Data freshness
3. Field completeness
4. Conflicts with other sources
5. Whether the data was human verified
6. Business impact if wrong
7. Whether the source is official or third-party
8. Whether the source is structured or scraped
9. Whether the record has been seen consistently over time

## Source Reliability Examples

| Source Type | Default Reliability |
|---|---:|
| Official county GIS/assessor/tax source | 70–90 |
| Official recorded document | 80–95 |
| Official plan commission agenda/minutes | 70–90 |
| State/federal data source | 75–95 |
| Utility provider record | 70–90 |
| Third-party real estate listing | 40–70 |
| Scraped webpage without official status | 30–60 |
| AI-extracted PDF text | 30–70 depending on quality |
| User-entered note | 40–80 depending on source |

## AI Summary Rule

AI summaries are convenience layers. They must reference source records and should never be treated as the official fact.

## Memory Rule

Memory may help retrieve context and lessons. Memory may not override source records, verified decisions, accounting state, payment state, or approved commitments.

## Conflict Handling

If two sources disagree, do not silently choose one. Create a conflict or verification item.

Examples:

- owner name differs between assessor and recorder
- zoning shown differently in GIS and ordinance map
- parcel acreage differs by source
- mailing address differs across datasets
- utility availability is implied but not confirmed

## Land Intelligence Minimum Output

Any land opportunity score must include:

- source evidence
- confidence score
- missing information
- deal-killer risks
- human verification required
- next best action

## Decision Rule

If the record could trigger money, outreach, professional judgment, legal action, or client commitment, confidence and provenance are required.
