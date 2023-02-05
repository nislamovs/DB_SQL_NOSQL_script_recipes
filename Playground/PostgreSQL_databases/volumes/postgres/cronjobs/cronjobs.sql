CREATE EXTENSION IF NOT EXISTS pg_cron;

CREATE FUNCTION DeleteTempTables() RETURNS boolean
    LANGUAGE plpgsql
AS
$$
DECLARE
    TABLE_RECORD RECORD;
BEGIN
    FOR TABLE_RECORD IN (SELECT c.relname as RelationName
                         FROM pg_catalog.pg_class c
                                  LEFT JOIN pg_catalog.pg_namespace n
                                            ON n.oid = c.relnamespace
                         WHERE  c.relkind IN ('r','s')
                           AND  (n.nspname !~ '^pg_toast' and nspname like 'pg_temp%')
                         ORDER BY pg_relation_size(n.nspname ||'.'|| c.relname) DESC)

        LOOP
            DROP TABLE TABLE_RECORD;
        END LOOP;

    RETURN TRUE;
END
$$;

SELECT cron.schedule ('Delete temporary tables', '20 * * * *', 'SELECT DeleteTempTables();');













