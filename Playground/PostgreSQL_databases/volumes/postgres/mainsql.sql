-- Setup DB

\i  /docker-entrypoint-initdb.d/db_settings/db_settings.sql;

-- Load enums

\i  /docker-entrypoint-initdb.d/enums/enums.sql;

-- Load schemas

\i /docker-entrypoint-initdb.d/db_schema/classes_schema.sql;
\i /docker-entrypoint-initdb.d/db_schema/classes_statistics_schema.sql;
\i /docker-entrypoint-initdb.d/db_schema/marks_schema.sql;
\i /docker-entrypoint-initdb.d/db_schema/pupils_schema.sql;
\i /docker-entrypoint-initdb.d/db_schema/parents_schema.sql;
\i /docker-entrypoint-initdb.d/db_schema/subjects_schema.sql;
\i /docker-entrypoint-initdb.d/db_schema/teachers_schema.sql;

-- Load audit schemas

\i /docker-entrypoint-initdb.d/db_schema/audit/classes_audit_schema.sql;
\i /docker-entrypoint-initdb.d/db_schema/audit/classes_statistics_audit_schema.sql;
\i /docker-entrypoint-initdb.d/db_schema/audit/marks_audit_schema.sql;
\i /docker-entrypoint-initdb.d/db_schema/audit/pupils_audit_schema.sql;
\i /docker-entrypoint-initdb.d/db_schema/audit/parents_audit_schema.sql;
\i /docker-entrypoint-initdb.d/db_schema/audit/subjects_audit_schema.sql;
\i /docker-entrypoint-initdb.d/db_schema/audit/teachers_audit_schema.sql;


-- Load data

\i /docker-entrypoint-initdb.d/db_data/classes_data.sql;
\i /docker-entrypoint-initdb.d/db_data/classes_statistics_data.sql;
\i /docker-entrypoint-initdb.d/db_data/marks_data.sql;
\i /docker-entrypoint-initdb.d/db_data/pupils_data.sql;
\i /docker-entrypoint-initdb.d/db_data/parents_data.sql;
\i /docker-entrypoint-initdb.d/db_data/subjects_data.sql;
\i /docker-entrypoint-initdb.d/db_data/teachers_data.sql;

-- -- Load data alterations



-- Load functions

\i /docker-entrypoint-initdb.d/functions/random_data_generation_functions.sql;
\i /docker-entrypoint-initdb.d/functions/system_functions.sql;

-- -- Load stored procedures
--
\i /docker-entrypoint-initdb.d/storedProc/GenNewClass_storedProc.sql;
\i /docker-entrypoint-initdb.d/storedProc/AuditRevision_storedProc.sql;
\i /docker-entrypoint-initdb.d/storedProc/Statistics_email_storedProc.sql;
-- \i /docker-entrypoint-initdb.d/storedProc/Statistics_pupils_relatives.sql;
--
-- -- Load triggers
--
\i /docker-entrypoint-initdb.d/triggers/triggers.sql;
--
-- -- Load views
--
\i /docker-entrypoint-initdb.d/views/AllPersons_view.sql
\i /docker-entrypoint-initdb.d/views/FamilyList_view.sql
--
-- -- Load events


-- -- Cron jobs
-- \i /docker-entrypoint-initdb.d/cronjobs/cronjobs.sql;

-- -- Extentions
-- \i /docker-entrypoint-initdb.d/extentions/extentions.sql;