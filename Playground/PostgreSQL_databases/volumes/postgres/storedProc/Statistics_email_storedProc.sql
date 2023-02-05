DROP PROCEDURE IF EXISTS GET_EMAIL_PROVIDER_STATS;
CREATE OR REPLACE PROCEDURE GET_EMAIL_PROVIDER_STATS(IN TBL_NAME VARCHAR(30))
LANGUAGE plpgsql AS $$

    DECLARE TBL_NAME VARCHAR(20) := (
        SELECT (CASE
            WHEN TBL_NAME = 'pupils'   THEN 'pupils'
            WHEN TBL_NAME = 'teachers' THEN 'teachers'
            WHEN TBL_NAME = 'parents'  THEN 'parents'
            WHEN TBL_NAME = 'persons'  THEN 'persons'
            ELSE 'persons'
        END)
    );

    DECLARE sql_part1 TEXT := '
        INSERT INTO
            TempTable(domain, count)
        SELECT
        CASE
            WHEN RIGHT(email, length(email) - POSITION(''@'' IN email)) = ''gmail.com'' THEN ''gmail.com''
            WHEN RIGHT(email, length(email) - POSITION(''@'' IN email)) = ''inbox.lv'' THEN ''inbox.lv''
            WHEN RIGHT(email, length(email) - POSITION(''@'' IN email)) = ''mail.ru'' THEN ''mail.ru''
            WHEN RIGHT(email, length(email) - POSITION(''@'' IN email)) = ''yahoo.com'' THEN ''yahoo.com''
            ELSE ''other''
        END AS domain,
        COUNT(*) AS count
        FROM ';

    DECLARE sql_part2 TEXT := '
        WHERE length(email) > 0
        GROUP BY domain
        ORDER BY count ASC ;
    ';

    DECLARE table_stats_query TEXT := CONCAT(sql_part1, TBL_NAME, sql_part2);

    BEGIN

        DROP TABLE IF EXISTS TempTable;
        CREATE TEMPORARY TABLE TempTable (
                                 id SERIAL NOT NULL,
                                 domain VARCHAR(20),
                                 count VARCHAR(20),
                                 PRIMARY KEY (id)
        );

        EXECUTE table_stats_query;

--         SELECT * FROM TempTable;  -- tris won't work in Postgres
--         DROP TABLE TempTable;

    END;
$$;

-- call GET_EMAIL_PROVIDER_STATS('pupils');
-- call GET_EMAIL_PROVIDER_STATS('persons');

-- SELECT * from TempTable;
