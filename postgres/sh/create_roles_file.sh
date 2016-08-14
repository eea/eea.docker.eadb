#!/bin/bash
set -e

echo "$VIEWERS" > /tmp/viewers_col.txt
echo "$EDITORS" > /tmp/editors_col.txt
echo "$REMOVE" > /tmp/remove_col.txt

awk 1 RS=" |\n" /tmp/viewers_col.txt > /viewers.txt
awk 1 RS=" |\n" /tmp/editors_col.txt > /editors.txt
awk 1 RS=" |\n" /tmp/remove_col.txt > /remove.txt

rm /tmp/*_col.txt

[ -e /set_roles.sql ] && rm /set_roles.sql

cat /viewers.txt | while read line
do
   echo "SELECT create_role_if_not_exists('$line'::TEXT, 'gr_ea_viewers_ldap'::TEXT);" >> /set_roles.sql
done

cat /editors.txt | while read line
do
   echo "SELECT create_role_if_not_exists('$line'::TEXT, 'gr_ea_editors_ldap'::TEXT);" >> /set_roles.sql
done

cat /remove.txt | while read line
do
   echo "DROP ROLE IF EXISTS $line;" >> /set_roles.sql
done

echo "SELECT pg_reload_conf();" >> /set_roles.sql
