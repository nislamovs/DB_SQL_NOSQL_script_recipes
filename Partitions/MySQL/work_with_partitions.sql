------------------------------------------------------------------------------------------------------------

--show all partitions

/* Select a list of all partitions from a table */

SELECT
`table_name`,`partition_ordinal_position`,`table_rows`,`partition_method`,`partitions`.*
FROM information_schema.partitions
WHERE 1=1
    AND`table_schema` = 'school'
    AND`table_name` = 'pupils';

------------------------------------------------------------------------------------------------------------

--Data retrieve

--Time consumption higher

/* Select without specifying a partition */

SELECT *
FROM`school`.`pupils`
WHERE 1=1
    AND YEAR(`pupils`.`joined`) = '1985'
    AND MONTH(`pupils`.`joined`) = 3
    LIMIT 10;

--Time consumption lower

SELECT */* Select within a particular partition */
FROM`school`.`pupils` PARTITION (`p3`)
WHERE 1=1
    AND YEAR(`pupils`.`joined`) = '1985'
    AND MONTH(`pupils`.`joined`) = 3
    LIMIT 10;

------------------------------------------------------------------------------------------------------------
-- Data retrieve from particular partition

SELECT * FROM `school`.`pupils` PARTITION (`p3`)

------------------------------------------------------------------------------------------------------------

-- Add partition to table                                                           partition by range


-- Only if no max value partition set
ALTER TABLE pupils ADD PARTITION (PARTITION p5 VALUES MORE THAN (1950));

--else better use reorganization
ALTER TABLE pupils REORGANIZE PARTITION p4 INTO (
    PARTITION p4 VALUES LESS THAN (2000),
    PARTITION p5 VALUES LESS THAN MAXVALUE
);

------------------------------------------------------------
--                                                                                   partition by list

CREATE TABLE tt (
    id INT,
    data INT
)
PARTITION BY LIST(data) (
    PARTITION p0 VALUES IN (5, 10, 15),
    PARTITION p1 VALUES IN (6, 12, 18)
);

ALTER TABLE tt ADD PARTITION (PARTITION p2 VALUES IN (7, 14, 21));
------------------------------------------------------------------------------------------------------------

-- Drop partition from table - partition will be deleted, but all data in it will remain unchanged

ALTER TABLE pupils DROP PARTITION p0, p1;


-- Remove all partitions - data remains unchanged
ALTER TABLE pupils REMOVE PARTITIONING;

------------------------------------------------------------------------------------------------------------


-- Stuff

ALTER TABLE pupils ANALYZE PARTITION p3;

ALTER TABLE pupils CHECK PARTITION p3;
