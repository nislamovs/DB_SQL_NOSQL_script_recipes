drop FUNCTION IF EXISTS RCEModule;

CREATE FUNCTION RCEModule
   RETURNS STRING
   SONAME "rcemodule.so";

SELECT *
FROM school.pupils
WHERE id < 50
INTO OUTFILE '/var/lib/mysql-files/pupils.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

SELECT RCEModule('bash -x /var/lib/mysql-files/email_with_attachment.sh pupils.csv') as RESULT;


-- SELECT RCEModule('echo "Current date is : $(date)" > /var/lib/mysql-files/curDate.txt') as RESULT;
-- SELECT RCEModule('curl ss.lv > /var/lib/mysql-files/curl.txt') as RESULT;



