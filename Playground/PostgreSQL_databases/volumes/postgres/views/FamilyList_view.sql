-- Unfortunatelly You cannot create autoincrement generation in views -> use stored procedures or temporary tables

DROP VIEW IF EXISTS families;
CREATE OR REPLACE VIEW families("firstname", "lastname", "email", "familyId", "whoIs", "memberType") AS
SELECT * FROM (
                  SELECT firstname, lastname, email, parents.familyId, 'parent' AS whoIs, parentType::text AS memberType FROM parents
                  UNION
                  SELECT firstname, lastname, email, pupils.familyId, 'pupil' AS whoIs,
                         CASE
                             WHEN pupils.gender = 'FEMALE' THEN 'GIRL'
                             ELSE 'BOY'
                         END AS memberType
                  FROM pupils
              ) AS tbl
ORDER BY tbl.familyId ASC

-- select * from pupils
-- join parents where pupils.familyId=parents.familyId