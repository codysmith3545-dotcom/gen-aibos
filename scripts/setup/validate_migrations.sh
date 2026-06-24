#!/usr/bin/env bash
set -euo pipefail

# GEN-AIBOS migration validation helper.
# Run from the repository root.
# Requires: Supabase CLI and Docker.

if ! command -v supabase >/dev/null 2>&1; then
  echo "Supabase CLI is not installed or not on PATH."
  echo "Install it first, then rerun this script."
  exit 1
fi

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker is not installed or not on PATH."
  echo "Supabase local development requires Docker."
  exit 1
fi

echo "Checking migration files..."
ls -1 supabase/migrations/*.sql >/dev/null

echo "Starting Supabase local services if needed..."
supabase start

echo "Resetting local database and applying migrations + seed..."
supabase db reset

echo "Migration validation complete."
echo "Next: open Supabase Studio and verify core tables, RLS status, and seed data."
