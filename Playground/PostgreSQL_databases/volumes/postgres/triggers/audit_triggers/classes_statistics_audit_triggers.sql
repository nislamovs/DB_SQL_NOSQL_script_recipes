CREATE FUNCTION classes_statistics_insert_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
DECLARE recordid INTEGER := NEW.id;
DECLARE auditaction VARCHAR(10) := 'INSERT';
DECLARE username VARCHAR(10) := SESSION_USER;
DECLARE tablename VARCHAR(20) := 'classes_statistics';
DECLARE oldvalue VARCHAR(10) := '<EMPTY>';

DECLARE fieldlist TEXT := (SELECT FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CURRENT_SCHEMA AND TABLE_NAME = tablename GROUP BY COLUMN_NAME);
DECLARE newvalue TEXT := CONCAT('<',
    ' ', NEW.id,
    ' ', NEW.type,
    ' ', NEW.class_head_id,
    ' ', NEW.name,
    ' ', NEW.created_at,
    ' ', NEW.created_by,
    ' ', NEW.modified_at,
    ' ', NEW.modified_by,
    ' ', '>');

BEGIN
INSERT INTO audit_generic ( done_by, auditAction, tableName, recordId, fieldName, oldValue, newValue)
VALUES (username, auditaction, tablename, recordid, fieldlist, oldvalue, newvalue);

INSERT INTO audit_classes_statistics ( done_by, auditAction, recordid, fieldName, oldValue, newValue)
VALUES (username, auditaction, recordid, fieldlist, oldvalue, newvalue);
END;
$$;

CREATE TRIGGER classes_statistics_insert_trigger AFTER INSERT
ON classes_statistics
FOR EACH ROW EXECUTE PROCEDURE classes_statistics_insert_trigger_function();

-----------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION classes_statistics_update_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
DECLARE recordid INTEGER := NEW.id;
DECLARE auditaction VARCHAR(10) := 'UPDATE';
DECLARE username VARCHAR(10) := SESSION_USER;
DECLARE tablename VARCHAR(20) := 'classes_statistics';

DECLARE fieldlist TEXT := ' ';
DECLARE oldvalue TEXT := ' ';
DECLARE newvalue TEXT := ' ';

BEGIN
IF (NEW.type <> OLD.type) THEN
            fieldlist := CONCAT(fieldlist, ',', 'type');
oldvalue := CONCAT(oldvalue, ',', OLD.type);
newvalue := CONCAT(newvalue, ',', NEW.type);
END IF;

IF (NEW.class_head_id <> OLD.class_head_id) THEN
            fieldlist := CONCAT(fieldlist, ',', 'class_head_id');
oldvalue := CONCAT(oldvalue, ',', OLD.class_head_id);
newvalue := CONCAT(newvalue, ',', NEW.class_head_id);
END IF;

IF (NEW.name <> OLD.name) THEN
            fieldlist := CONCAT(fieldlist, ',', 'name');
oldvalue := CONCAT(oldvalue, ',', OLD.name);
newvalue := CONCAT(newvalue, ',', NEW.name);
END IF;

IF (oldvalue <> newvalue) THEN

            -- Delete space and comma from the beginning
            oldvalue := REPLACE(oldvalue,' ,','');
newvalue := REPLACE(newvalue,' ,','');
fieldlist := REPLACE(fieldlist,' ,','');

oldvalue := CONCAT('<', oldvalue, '>');
newvalue := CONCAT('<', newvalue, '>');

INSERT INTO audit_generic(done_by, auditAction, tableName, recordId, fieldName, oldValue, newValue)
VALUES (username, auditaction, tablename, recordid, fieldlist, oldvalue, newvalue);

INSERT INTO audit_classes_statistics(done_by, auditAction, recordid, fieldName, oldValue, newValue)
VALUES (username, auditaction, recordid, fieldlist, oldvalue, newvalue);
END IF;
END;
$$;

CREATE TRIGGER classes_statistics_update_trigger AFTER UPDATE
ON classes_statistics
FOR EACH ROW EXECUTE PROCEDURE classes_statistics_update_trigger_function();

-----------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION classes_statistics_delete_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
    DECLARE recordid INTEGER := OLD.id;
    DECLARE auditaction VARCHAR(10) := 'DELETE';
    DECLARE username VARCHAR(10) := SESSION_USER;
    DECLARE tablename VARCHAR(20) := 'classes_statistics';
    DECLARE newvalue VARCHAR(10) := '<DELETED>';

    DECLARE fieldlist TEXT := (SELECT FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CURRENT_SCHEMA AND TABLE_NAME = tablename GROUP BY COLUMN_NAME);
    DECLARE oldvalue TEXT := (CONCAT('<',
        ' ', OLD.id,
        ' ', OLD.type,
        ' ', OLD.class_head_id,
        ' ', OLD.name,
        ' ', OLD.created_at,
        ' ', OLD.created_by,
        ' ', OLD.modified_at,
        ' ', OLD.modified_by,
        ' ', '>'));

    BEGIN
        INSERT INTO audit_generic(done_by, auditAction, tableName, recordId, fieldName, oldValue, newValue)
        VALUES (username, auditaction, tablename, recordid, fieldlist, oldvalue, newvalue);

        INSERT INTO audit_classes_statistics(done_by, auditAction, recordid, fieldName, oldValue, newValue)
        VALUES (username, auditaction, recordid, fieldlist, oldvalue, newvalue);
    END;
$$;

CREATE TRIGGER classes_statistics_delete_trigger AFTER DELETE
ON classes_statistics
FOR EACH ROW EXECUTE PROCEDURE classes_statistics_delete_trigger_function();


