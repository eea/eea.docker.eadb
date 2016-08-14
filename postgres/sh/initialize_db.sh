#!/bin/bash
set -e

cp /pg_hba.conf /var/lib/postgresql/data/pg_hba.conf

psql -U postgres -c "CREATE DATABASE ea WITH OWNER = postgres ENCODING = 'UTF8' TABLESPACE = pg_default CONNECTION LIMIT = -1;"

psql -U postgres -f /groups.sql

psql -U postgres -d ea -f /EASchema_1220_PostgreSQL.sql

psql -U postgres -d ea -f /create_role_if_not_exists.sql

psql -U postgres -d ea -f /groups_permissions.sql 
