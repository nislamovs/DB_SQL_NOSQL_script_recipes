SELECT
    FIRST_VALUE(firstname) OVER (
        ORDER BY lastname
    ) firstname,
    lastname,
    email
FROM pupils
LIMIT 20                                                                -- result : Ab


SELECT
    first_value(firstname) OVER (
        ORDER BY firstname DESC
    ) firstname,
    lastname,
    email
FROM pupils
LIMIT 20                                                                -- result : Zulema


---

SELECT
    last_value(firstname) OVER (
        ORDER BY firstname
        RANGE BETWEEN
            UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING
    ) firstname,
    lastname,
    email
FROM pupils
LIMIT 20                                                                -- result : Zulema