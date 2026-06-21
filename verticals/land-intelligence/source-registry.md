# Land Intelligence Source Registry

## Purpose

The land source registry tracks every source used by the Land Intelligence module, its reliability, refresh cadence, known issues, cost, and what fields it provides.

The registry prevents the system from treating every data source as equally trustworthy.

## Source Registry Fields

Each source should include:

- source_name
- source_type
- county
- state
- url
- access_method
- reliability_score
- refresh_frequency
- cost
- terms_notes
- fields_available
- known_issues
- last_checked_at
- owner
- notes

## Source Types

Potential source types:

- county_gis
- assessor_tax
- recorder
- zoning_ordinance
- zoning_map
- plan_commission_agenda
- plan_commission_minutes
- permit_portal
- utility_provider
- state_permit_source
- transportation_source
- floodplain_source
- wetland_source
- soils_source
- sheriff_sale
- tax_sale
- listing_site
- internal_note
- buyer_requirement

## Reliability Scoring

| Score | Meaning |
|---:|---|
| 0–30 | weak source; research only |
| 31–50 | useful but needs confirmation |
| 51–70 | moderate reliability |
| 71–90 | strong official or repeated source |
| 91–100 | highly reliable and recently verified |

## County Source Notes

Each county should eventually have a source profile:

- GIS portal URL
- assessor/tax URL
- recorder access
- planning/zoning page
- agenda/minutes page
- permit portal
- utility district notes
- known quirks
- data export availability
- update cadence
- scraping/browser automation needed?
- human review needs

## Initial Indiana Priority Counties

Start with the counties most relevant to the business plan:

- Hancock
- Henry
- Madison
- Marion
- Hamilton
- Shelby
- Rush
- Johnson

Then expand only after the core workflow works.

## Source Review Questions

For each source, ask:

1. Is this official or third-party?
2. How often is it updated?
3. Does it expose structured data?
4. Is scraping needed?
5. Does it require login?
6. Does it have terms or access constraints?
7. What fields are available?
8. What fields are missing?
9. What errors have been observed?
10. What decisions can this source safely support?

## Rule

No source should feed automated scoring until it has a registry entry, reliability score, and known-issues note.
