-- Here will be displayed all changes of all db
DROP TABLE IF EXISTS audit_generic;
CREATE TABLE IF NOT EXISTS audit_generic (
    id SERIAL PRIMARY KEY NOT NULL,
    auditAction optype NOT NULL,

    tableName VARCHAR(50) NOT NULL,
    recordId INTEGER NOT NULL,
    fieldName text NOT NULL,
    oldValue text,
    newValue text,

	done_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 	done_by VARCHAR(50) DEFAULT CURRENT_USER NOT NULL

)
