#!/bin/bash
set -e

mkdir -p /var/ssl
echo "$SERVER_CRT" > /var/ssl/server.crt
echo "$SERVER_KEY" > /var/ssl/server.key
echo "$ROOT_CRT" > /var/ssl/root.crt

chmod 400 /var/ssl/*

chown postgres.postgres /var/ssl/*
