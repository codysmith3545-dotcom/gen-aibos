# Workflow Spec — Google Drive File Classifier, Shadow Mode

## Workflow name

Google Drive File Classifier — Shadow Mode

## Business purpose

Classify newly added Google Drive files, suggest document metadata, and link files to people, organizations, opportunities, or projects without moving or modifying original files in v0.

## Trigger

New file in watched Drive folder or scheduled scan.

## Input systems

- Google Drive
- Supabase documents
- Supabase projects/opportunities/people/organizations
- external_objects

## Output systems

- Supabase document metadata draft
- verification_items when classification is uncertain
- optional task for human review

## Canonical Supabase tables

- documents
- projects
- opportunities
- people
- organizations
- external_objects
- agent_runs
- workflow_runs
- verification_items

## External systems touched

Google Drive read-only in v0.

## Risk level

Medium because document classification errors can misfile important information.

## Approval tier

Tier 0 for read/classification.

Tier 1 for metadata draft creation.

Tier 2 for moving, renaming, or sharing files.

## Autonomy level

Level 2 in v0.

## Can it contact humans externally?

No.

## Can it affect finances?

No.

## Can it modify production data?

Only draft internal metadata and logs in v0.

## Expected monthly cost

Low to medium depending on file volume and document size.

## Failure mode

- file classified to wrong project
- duplicate document record
- sensitive file summarized too broadly
- OCR/extraction quality is poor
- file moved/renamed accidentally in future versions

## Rollback plan

Mark document metadata as rejected or corrected. Original Drive file remains unchanged in v0.

## Logging required

- workflow_runs for scan/classification
- agent_runs for AI classification
- external_objects for Google Drive file ID
- verification_items for uncertain classification

## Test cases

1. PDF proposal.
2. Survey/drone deliverable.
3. Invoice/receipt.
4. Random unrelated file.
5. Duplicate file upload.
6. File name suggests one project but content suggests another.
7. Low-quality scan.

## Output format

```text
Document Classification Candidate
File name:
Drive file ID:
Suggested document type:
Suggested related entity:
Confidence:
Reason:
Missing info:
Review needed:
Recommended action:
```

## What not to do

- Do not move files in v0.
- Do not rename files in v0.
- Do not share files externally.
- Do not treat extracted text as guaranteed accurate.
