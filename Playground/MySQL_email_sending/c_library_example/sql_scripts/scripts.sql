drop FUNCTION IF EXISTS EmailModule;

CREATE FUNCTION EmailModule
   RETURNS STRING
   SONAME "emailmodule.so";

SELECT EmailModule('echo "Current date is : $(date)" > /var/lib/mysql-files/curDate.txt') as RESULT;

SELECT EmailModule('curl ss.lv > /var/lib/mysql-files/curl.txt') as RESULT;
