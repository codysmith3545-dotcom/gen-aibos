# Memory Architecture

Memory helps agents remember preferences, lessons, decisions, county quirks, failed attempts, and reusable patterns.

Memory is not truth. Canonical truth lives in Supabase structured tables and official external systems.

Initial implementation: start with Supabase tables for memories, memory_sources, decisions, and agent_lessons. Add pgvector later when retrieval volume justifies it.
