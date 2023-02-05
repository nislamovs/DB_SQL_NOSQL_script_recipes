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

----------------------------------------------------------------------------------------------------------------------

-- Show list of all triggers

SELECT  event_object_table AS table_name ,trigger_name
FROM information_schema.triggers
GROUP BY table_name , trigger_name
ORDER BY table_name ,trigger_name;

----------------------------------------------------------------------------------------------------------------------

-- Show list of all triggers per schema

SELECT  event_object_table AS table_name ,trigger_name
FROM information_schema.triggers
WHERE event_object_table = 'your_table_name'
GROUP BY table_name, trigger_name
ORDER BY table_name, trigger_name;

----------------------------------------------------------------------------------------------------------------------

-- CREATE OR REPLACE FUNCTION strip_all_triggers() RETURNS text AS $$ DECLARE
--     triggNameRecord RECORD;
--     triggTableRecord RECORD;
-- BEGIN
--     FOR triggNameRecord IN SELECT DISTINCT (trigger_name) INTO information_schema.triggers WHERE trigger_schema = 'school' LOOP
--             SELECT DISTINCT (event_object_table) INTO triggTableRecord
--             FROM information_schema.triggers
--             WHERE trigger_name = triggNameRecord.trigger_name;
--             RAISE NOTICE 'Dropping trigger: % on table: %', triggNameRecord.trigger_name, triggTableRecord.event_object_table;
--             EXECUTE 'DROP TRIGGER ' || triggNameRecord.trigger_name || ' ON ' || triggTableRecord.event_object_table || ';';
--         END LOOP;
--
--     RETURN 'done';
-- END;
-- $$ LANGUAGE plpgsql SECURITY DEFINER;
--
-- select strip_all_triggers();

----------------------------------------------------------------------------------------------------------------------

SELECT 'DROP TRIGGER ' || trigger_name || ' ON ' || event_object_table || ';'
FROM information_schema.triggers
WHERE trigger_schema = 'school';

----------------------------------------------------------------------------------------------------------------------
-- Show all extentions

select extname from pg_extension ;

----------------------------------------------------------------------------------------------------------------------
-- List all temporary tables

SELECT
    n.nspname as SchemaName
     ,c.relname as RelationName
     ,CASE c.relkind
          WHEN 'r' THEN 'table'
          WHEN 'v' THEN 'view'
          WHEN 'i' THEN 'index'
          WHEN 'S' THEN 'sequence'
          WHEN 's' THEN 'special'
    END as RelationType
     ,pg_catalog.pg_get_userbyid(c.relowner) as RelationOwner
     ,pg_size_pretty(pg_relation_size(n.nspname ||'.'|| c.relname)) as RelationSize
FROM pg_catalog.pg_class c
         LEFT JOIN pg_catalog.pg_namespace n
                   ON n.oid = c.relnamespace
WHERE  c.relkind IN ('r','s')
  AND  (n.nspname !~ '^pg_toast' and nspname like 'pg_temp%')
ORDER BY pg_relation_size(n.nspname ||'.'|| c.relname) DESC;

----------------------------------------------------------------------------------------------------------------------

-- List all cron jobs

SELECT * FROM cron.job;


----------------------------------------------------------------------------------------------------------------------

-- Delete tables

CREATE OR REPLACE FUNCTION footgun(IN _schema TEXT, IN _parttionbase TEXT)
    RETURNS void
    LANGUAGE plpgsql
AS
$$
DECLARE
    row     record;
BEGIN
    FOR row IN
        SELECT
            table_schema,
            table_name
        FROM
            information_schema.tables
        WHERE
                table_type = 'BASE TABLE'
          AND
                table_schema = _schema
          AND
                table_name ILIKE (_parttionbase || '%')
        LOOP
            EXECUTE 'DROP TABLE ' || quote_ident(row.table_schema) || '.' || quote_ident(row.table_name) || ' CASCADE ';
            RAISE INFO 'Dropped table: %', quote_ident(row.table_schema) || '.' || quote_ident(row.table_name);
        END LOOP;
END;
$$;

SELECT footgun('public', 'tablename');

----------------------------------------------------------------------------------------------------------------------