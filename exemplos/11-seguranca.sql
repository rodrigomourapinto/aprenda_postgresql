-- Execute este arquivo em ambiente de laboratório com uma role administrativa.

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'app_leitura_ptbr') THEN
        CREATE ROLE app_leitura_ptbr NOLOGIN;
    END IF;
END
$$;

GRANT CONNECT ON DATABASE postgresql_ptbr TO app_leitura_ptbr;
GRANT USAGE ON SCHEMA laboratorio TO app_leitura_ptbr;
GRANT SELECT ON ALL TABLES IN SCHEMA laboratorio TO app_leitura_ptbr;

-- Verificação
SELECT rolname, rolsuper, rolcanlogin
FROM pg_roles
WHERE rolname = 'app_leitura_ptbr';
