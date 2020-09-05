-- Row number emulation - works with old MySQL (lower than 8th version)

SET @row_number = 0;
SELECT
    (@row_number:=@row_number + 1) AS num,
    firstName,
    lastName
FROM
    pupils
ORDER BY firstName, lastName
LIMIT 20;

------------------------------------------------------------------------------------

-- For newer MySQL versions

SELECT
    ROW_NUMBER() OVER (
	ORDER BY firstname
    ) AS row_num,
    firstname,
    lastname,
email
FROM pupils
ORDER BY firstname
limit 20