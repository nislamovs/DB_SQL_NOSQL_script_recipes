DROP FUNCTION IF EXISTS TABLE_TO_CSV;
CREATE OR REPLACE FUNCTION TABLE_TO_CSV(path TEXT) RETURNS VOID
    LANGUAGE plpgsql
AS $$
DECLARE
    tables RECORD;
    statement TEXT;
BEGIN
    FOR tables IN
        SELECT nspname||'.'||relname AS full_rel_name
        FROM pg_class, pg_namespace
        WHERE relnamespace = pg_namespace.oid
          AND nspname = 'school'
          AND relkind = 'r'

        LOOP
            statement := 'COPY ' || tables.full_rel_name || ' TO ''' || path || '/' || tables.full_rel_name || '.csv' ||''' DELIMITER '';'' CSV HEADER';
            EXECUTE statement;
        END LOOP;
    RETURN;
END;
$$;

-- select TABLE_TO_CSV('/tmp/');