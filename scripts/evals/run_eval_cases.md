# Eval Runner Placeholder

## Purpose

This file describes the first eval runner before implementation code is added.

The eval runner should eventually load `scripts/evals/eval-cases.json`, run each case against the relevant agent/workflow prompt, and produce a report.

## First Implementation Target

Create a simple script later that:

1. Loads eval cases from JSON.
2. Prints each case and expected behavior.
3. Allows manual pass/fail entry.
4. Writes results to a local report file.
5. Later writes to Supabase `eval_runs` and `eval_results` tables after those tables exist.

## Report Fields

- eval_case_id
- run_id
- tested_component
- result
- notes
- created_at

## Rule

Do not connect eval runner to live production systems in v0.
