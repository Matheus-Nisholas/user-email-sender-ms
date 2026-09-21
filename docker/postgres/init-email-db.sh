#!/bin/sh
set -eu

# Executed only when PostgreSQL initializes an empty data directory.
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" --set=email_db="$EMAIL_DB" <<'SQL'
SELECT format('CREATE DATABASE %I', :'email_db')
WHERE NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = :'email_db')
\gexec
SQL
