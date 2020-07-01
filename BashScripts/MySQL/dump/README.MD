#Dump whole database
    mysqldump -u username -ppassword database_name  > the_whole_database_dump.sql

#Dump single table
    mysqldump -u username -ppassword database_name table_name > single_table_dump.sql

#Dump only rows that meet a specific criteria
    mysqldump -u username -ppassword database_name table_name --where="date_created='2013-06-25'" > few_rows_dump.sql