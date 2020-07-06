
-- Check version
SHOW VARIABLES LIKE 'version';

-- Executed queries
SELECT * FROM sys.statements_with_full_table_scans

-- Executed queries with errors and warnings
SELECT * FROM sys.statements_with_errors_or_warnings

-- Check OS from MySQL
show variables where variable_name like 'version%'