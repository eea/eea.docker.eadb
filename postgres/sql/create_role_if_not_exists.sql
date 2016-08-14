CREATE OR REPLACE FUNCTION create_role_if_not_exists(rolename TEXT, groupname TEXT)
RETURNS TEXT AS $$
BEGIN
    IF NOT EXISTS (SELECT * FROM pg_roles WHERE rolname = $1) THEN
        EXECUTE 'CREATE ROLE ' || $1 || ' INHERIT NOREPLICATION LOGIN IN ROLE ' || $2 || ';';
        RETURN 'ROLE ' || $1 || ' CREATED';
    ELSE
        RETURN 'ROLE ' || $1 || ' ALREADY EXISTS';
    END IF;

END;
$$
LANGUAGE plpgsql;
