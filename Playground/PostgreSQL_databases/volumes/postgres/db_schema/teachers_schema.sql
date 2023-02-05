DROP TABLE IF EXISTS teachers;
CREATE TABLE IF NOT EXISTS teachers (
    id SERIAL PRIMARY KEY NOT NULL,
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	email VARCHAR(50) UNIQUE,
	birthdate DATE,
	class_id INTEGER,
	subject_id INTEGER,
	is_head boolean,


	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 	created_by varchar(50) DEFAULT CURRENT_USER,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, --ON UPDATE CURRENT_TIMESTAMP,
 	modified_by varchar(50) DEFAULT CURRENT_USER

)