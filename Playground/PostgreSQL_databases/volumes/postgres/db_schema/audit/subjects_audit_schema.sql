DROP TABLE IF EXISTS audit_subjects;
CREATE TABLE IF NOT EXISTS audit_subjects (
    id SERIAL PRIMARY KEY NOT NULL,
    auditAction optype NOT NULL,

    recordId INTEGER NOT NULL,
    fieldName text NOT NULL,
    oldValue text,
    newValue text,

	done_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 	done_by VARCHAR(50) DEFAULT CURRENT_USER NOT NULL

)
