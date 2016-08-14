#!/bin/bash
set -e

sh /create_roles_file.sh
sh /create_ssl_files.sh

exec /docker-entrypoint.sh "$@"
