SELECT *
FROM pupils
WHERE id < 50
INTO OUTFILE '/var/lib/mysql-files/pipils.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';