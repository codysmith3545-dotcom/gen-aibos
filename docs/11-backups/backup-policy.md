# Backup Policy

Required backups: Supabase database, n8n workflow exports to GitHub, GitHub repository, secrets manager recovery path, Google Drive folder structure, agent memory exports, critical docs.

Important n8n workflows must be exported to GitHub. Schema changes require migration files. Production destructive changes require backup confirmation. Restore process must be tested.
