DROP TABLE IF EXISTS classes_statistics;
CREATE TABLE IF NOT EXISTS classes_statistics (
    id SERIAL PRIMARY KEY NOT NULL,
	class_id INTEGER,
	class_name VARCHAR(50),
	created DATE,
	pupil_count INTEGER,


	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 	created_by varchar(50) DEFAULT CURRENT_USER,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, --ON UPDATE CURRENT_TIMESTAMP,
 	modified_by varchar(50) DEFAULT CURRENT_USER

)

