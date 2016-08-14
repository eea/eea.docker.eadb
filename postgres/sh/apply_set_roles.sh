#!/bin/bash
set -e

sleep 5
psql -U postgres -d ea -f /set_roles.sql

