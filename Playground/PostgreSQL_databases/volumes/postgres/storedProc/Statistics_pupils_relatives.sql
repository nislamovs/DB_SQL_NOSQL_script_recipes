DROP PROCEDURE IF EXISTS GET_PUPILS_RELATIVES;
CREATE OR REPLACE PROCEDURE GET_PUPILS_RELATIVES()
LANGUAGE plpgsql AS $$
    BEGIN

        DROP TABLE IF EXISTS pupilsRelativesTempTable;
--         CREATE TABLE pupilsRelativesTempTable (
--              familyId VARCHAR(100),
--              id1 INTEGER NOT NULL,
--              firstname1 VARCHAR(20),
--              lastname1 VARCHAR(20),
--              email1 VARCHAR(20),
--              id2 INTEGER NOT NULL,
--              firstname2 VARCHAR(20),
--              lastname2 VARCHAR(20),
--              email2 VARCHAR(20)
--         );
select * from
        (SELECT tbl1.familyId AS familyid,
             tbl1.id AS id1,
             tbl1.firstname AS firstname1,
             tbl1.lastname AS lastname1,
             tbl1.email AS email1,
             tbl2.id AS id2,
             tbl2.firstname AS firstname2,
             tbl2.lastname AS lastname2,
             tbl2.email AS email2

        INTO pupilsRelativesTempTable
        FROM pupils tbl1
        group by familyid)
        INNER JOIN pupils tbl2 ON tbl1.familyid = tbl2.familyid
        WHERE tbl1.id <> tbl2.id;

        SELECT * FROM pupilsRelativesTempTable ;

    END;
$$;


-- call GET_PUPILS_RELATIVES();