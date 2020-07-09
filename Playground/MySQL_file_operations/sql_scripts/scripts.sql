drop FUNCTION IF EXISTS FileManager;

CREATE FUNCTION FileManager
   RETURNS STRING
   SONAME "filemanager.so";

SELECT FileManager('1', '/var/lib/mysql-files/test.txt', 'test message 1234') as RESULT;        -- Create file
SELECT FileManager('2', '/var/lib/mysql-files/test.txt', 'test message 1234') as RESULT;        -- Write to file
SELECT FileManager('3', '/var/lib/mysql-files/test.txt', 'test message 1234') as RESULT;        -- Read from file
SELECT FileManager('4', '/var/lib/mysql-files/test.txt', 'test message 1234') as RESULT;        -- Delete file
