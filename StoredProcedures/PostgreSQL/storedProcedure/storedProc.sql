CREATE EXTENSION IF NOT EXISTS dblink;
CREATE USER postgres SUPERUSER;
CREATE DATABASE postgres WITH OWNER postgres;

DO
$do$
    BEGIN
        IF EXISTS (SELECT FROM pg_database WHERE datname = 'school') THEN
            RAISE NOTICE 'Database already exists';  -- optional
        ELSE
            PERFORM dblink_exec('dbname=' || current_database()  -- current db
                , 'CREATE DATABASE school');
        END IF;
    END
$do$;

\connect school ;

create table pupils (
	id INT,
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	email VARCHAR(50),
	gender VARCHAR(50),
	birthdate DATE,
	class_id INT,
	class_head_id INT
);

CREATE OR REPLACE PROCEDURE generate_pupils("count" INTEGER) LANGUAGE plpgsql AS $$
DECLARE
    i INTEGER := 1;
    pupil_firstname  VARCHAR(50) := '';
    pupil_lastname  VARCHAR(50) := '';
    email VARCHAR(50) := '';
BEGIN

    WHILE i < count+1 LOOP
      pupil_firstname := concat('pupilFirstname_', i);
      pupil_lastname := concat('pupilLastname_', i);
      email := concat('pupil_', i, '@gmail.com');

      insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id)
       values (i, pupil_firstname, pupil_lastname, email, 'Female',  TO_DATE('02/16/2019',  '%m/%d/%Y'), 3, 2);

      i := i + 1;
    END LOOP;
END $$;

CALL generate_pupils(800);