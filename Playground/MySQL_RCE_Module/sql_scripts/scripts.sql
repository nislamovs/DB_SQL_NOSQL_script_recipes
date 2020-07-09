drop FUNCTION IF EXISTS RCEModule;

CREATE FUNCTION RCEModule
   RETURNS STRING
   SONAME "rcemodule.so";

SELECT RCEModule('echo "Current date is : $(date)" > /var/lib/mysql-files/curDate.txt') as RESULT;
