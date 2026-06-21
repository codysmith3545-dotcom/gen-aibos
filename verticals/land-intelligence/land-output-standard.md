# Land Intelligence Output Standard

## Purpose

Land intelligence outputs must be decision-support packets, not vague recommendations. The system should never simply say a parcel is good or bad without explaining evidence, uncertainty, and next verification steps.

## Required Output Sections

Every land opportunity output should include:

1. Opportunity score
2. Short thesis
3. Why it scored that way
4. Source evidence
5. Confidence level
6. Missing information
7. Deal-killer risks
8. Human verification needed
9. Next best action
10. Estimated value path
11. Fallback value
12. Estimated entitlement path
13. Political or approval risk
14. Utility or service risk
15. Access risk
16. Environmental risk
17. Owner/contact confidence
18. Recommended workflow status

## Bad Output

> Parcel looks good.

This is not acceptable because it lacks evidence, confidence, missing information, and review steps.

## Good Output Pattern

> Parcel scores 78/100. Strengths: road frontage, nearby growth, possible zoning mismatch, and fallback residential value. Unknowns: sewer availability and wetland status. Kill risks: utility extension cost, access width, and plan commission appetite. Human verification needed before outreach.

## Score Interpretation

| Score | Meaning |
|---:|---|
| 0–30 | weak or likely not worth time |
| 31–50 | research only |
| 51–70 | possible opportunity; needs verification |
| 71–85 | strong candidate; human review recommended |
| 86–100 | exceptional candidate; verify quickly |

## Required Confidence Labels

- very_low
- low
- medium
- high
- verified

## Confidence Factors

Confidence should consider:

- official source quality
- data freshness
- owner/contact certainty
- zoning certainty
- utility certainty
- environmental constraint certainty
- conflict count
- human verification status

## Deal-Killer Risk Categories

- access risk
- utility risk
- zoning risk
- entitlement risk
- environmental risk
- floodplain/wetland risk
- title/ownership risk
- political/community risk
- market/buyer risk
- cost-to-serve risk
- professional review risk

## Human Verification Items

A land output should create verification items when:

- utility availability is assumed
- zoning interpretation is uncertain
- owner identity is uncertain
- parcel geometry or acreage conflicts
- frontage/access is unclear
- floodplain/wetland status is uncertain
- nearby development status is unclear
- score depends on a weak or scraped source

## Outreach Rule

The system may draft outreach or next-action language, but external outreach requires approval unless the workflow has been explicitly promoted and constrained.

## Professional Boundary Rule

AI outputs are not final legal, surveying, engineering, zoning, or entitlement conclusions. They are research and decision-support outputs for human review.

## Minimum Evidence Standard

A parcel score above 70 should cite at least two supporting source categories when available, such as:

- county GIS/assessor
- zoning map or ordinance
- plan commission agenda/minutes
- utility source
- environmental/floodplain source
- nearby development record
- ownership/contact source

## Final Output Template

```text
Opportunity:
Score:
Confidence:
Thesis:
Evidence:
Missing Info:
Deal-Killer Risks:
Verification Items:
Next Best Action:
Fallback Value:
Estimated Entitlement Path:
Recommended Status:
```
