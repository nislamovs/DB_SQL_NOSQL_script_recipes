-- -- Load audit specific triggers
--
\i /docker-entrypoint-initdb.d/triggers/audit_triggers/classes_audit_triggers.sql;
\i /docker-entrypoint-initdb.d/triggers/audit_triggers/marks_audit_triggers.sql;
\i /docker-entrypoint-initdb.d/triggers/audit_triggers/classes_statistics_audit_triggers.sql
\i /docker-entrypoint-initdb.d/triggers/audit_triggers/pupils_audit_triggers.sql;
\i /docker-entrypoint-initdb.d/triggers/audit_triggers/parents_audit_triggers.sql;
\i /docker-entrypoint-initdb.d/triggers/audit_triggers/subjects_audit_triggers.sql;
\i /docker-entrypoint-initdb.d/triggers/audit_triggers/teachers_audit_triggers.sql;

-- Load validation specific triggers

\i /docker-entrypoint-initdb.d/triggers/validation_triggers/classes_validation_triggers.sql;
\i /docker-entrypoint-initdb.d/triggers/validation_triggers/marks_validation_triggers.sql;
\i /docker-entrypoint-initdb.d/triggers/validation_triggers/classes_statistics_validation_triggers.sql;
\i /docker-entrypoint-initdb.d/triggers/validation_triggers/pupils_validation_triggers.sql;
\i /docker-entrypoint-initdb.d/triggers/validation_triggers/parents_validation_triggers.sql;
\i /docker-entrypoint-initdb.d/triggers/validation_triggers/subjects_validation_triggers.sql;
\i /docker-entrypoint-initdb.d/triggers/validation_triggers/teachers_validation_triggers.sql;