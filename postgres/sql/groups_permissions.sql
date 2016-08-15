GRANT CONNECT ON DATABASE ea TO gr_ea_editors_ldap;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO gr_ea_editors_ldap;
GRANT SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO gr_ea_editors_ldap;

GRANT CONNECT ON DATABASE ea TO gr_ea_viewers_ldap;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO gr_ea_viewers_ldap;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO gr_ea_viewers_ldap;

