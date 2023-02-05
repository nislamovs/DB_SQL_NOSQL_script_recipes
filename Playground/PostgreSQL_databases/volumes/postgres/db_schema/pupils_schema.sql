DROP TABLE IF EXISTS pupils;
CREATE TABLE IF NOT EXISTS pupils (
      id SERIAL PRIMARY KEY NOT NULL,
      firstname VARCHAR(50),
      lastname VARCHAR(50),
      email VARCHAR(50) UNIQUE,
      gender genderType NOT NULL,
      birthdate DATE,
      class_id INTEGER,
      class_head_id INTEGER,

      has_brother_sister boolean DEFAULT false,
      brother_sister_id INTEGER DEFAULT NULL,
      familyId varchar(50),

      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      created_by varchar(50) DEFAULT CURRENT_USER,
      modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, --ON UPDATE CURRENT_TIMESTAMP,
      modified_by varchar(50) DEFAULT CURRENT_USER

)
