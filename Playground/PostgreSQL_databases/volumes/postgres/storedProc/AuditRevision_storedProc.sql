-- Unfortunatelly You cannot use prepared statements from triggers, and call storedProcedures, that contains prepared statements as well;

DROP PROCEDURE IF EXISTS ADD_AUDIT_REC;
CREATE OR REPLACE PROCEDURE ADD_AUDIT_REC(
    IN pusername VARCHAR(50),
    IN pauditaction VARCHAR(10),
    IN ptablename VARCHAR(50),
    IN precordid INTEGER,
    IN pfieldname VARCHAR(50),
    IN poldvalue TEXT,
    IN pnewvalue TEXT)
    LANGUAGE plpgsql AS $$

    DECLARE generic_audit_sql_query TEXT := CONCAT('INSERT INTO audit_generic(done_by, auditAction, tableName, recordId, fieldName, oldValue, newValue)
                                           VALUES ("', pusername, '", "', pauditaction, '", "', ptablename, '", "', precordid, '", "', pfieldname, '", "', poldvalue, '", "', pnewvalue, '");');

    DECLARE table_audit_sql_query TEXT := CONCAT('INSERT INTO ', 'audit_', ptablename, '(done_by, auditAction, recordId, fieldName, oldValue, newValue)
                                           VALUES ("', pusername, '", "', pauditaction, '", "', precordid, '", "',  pfieldname, '", "', poldvalue, '", "', pnewvalue, '");');
    BEGIN
        START TRANSACTION;
            EXECUTE generic_audit_sql_query;
            EXECUTE table_audit_sql_query;
        COMMIT;
    END;
$$;