DROP PROCEDURE IF EXISTS CREATE_CLASS;
CREATE OR REPLACE PROCEDURE CREATE_CLASS()
LANGUAGE plpgsql AS $$

    DECLARE id INTEGER := (SELECT c.id FROM classes c ORDER BY c.id DESC LIMIT 1) + 1;
    DECLARE classType VARCHAR(25) := GET_RANDOM_CLASS_TYPE();
    DECLARE class_head_id INTEGER := ( SELECT t.id FROM teachers t WHERE t.class_id IS NOT NULL AND t.is_head IS TRUE ORDER BY t.id DESC LIMIT 1 ) + 1;
    DECLARE className VARCHAR(5) := GET_RANDOM_CLASS_NAME();

    BEGIN
        INSERT INTO classes (id, type, class_head_id, name)
        VALUES (id, classType, class_head_id, className);
    END;
$$;

-- call CREATE_CLASS()

DROP PROCEDURE IF EXISTS CREATE_TEACHER;
CREATE OR REPLACE PROCEDURE CREATE_TEACHER(IN ishead BOOLEAN)
LANGUAGE plpgsql AS $$

    DECLARE id INTEGER := (SELECT t.id FROM teachers t ORDER BY t.id DESC LIMIT 1) + 1;
    DECLARE firstname VARCHAR(20) := GET_RANDOM_FIRSTNAME();
    DECLARE lastname VARCHAR(20) := GET_RANDOM_LASTNAME();
    DECLARE email VARCHAR(100) := GET_EMAIL(firstname, lastname);
    DECLARE birthdate DATE := GET_RANDOM_BIRTHDATE(28, 56);
    DECLARE class_id INTEGER := (
                        SELECT tt.class_id FROM teachers tt
                        WHERE tt.class_id IS NOT NULL
                        AND tt.is_head IS TRUE
                        ORDER BY tt.id DESC LIMIT 1
                    ) + 1;
    DECLARE subject_id INTEGER := (SELECT FLOOR(1 + (RANDOM() * (SELECT COUNT(*) FROM subjects))) );

    BEGIN   
        INSERT INTO teachers (id, firstname, lastname, email, birthdate, class_id, subject_id, is_head)
        VALUES (id, firstname, lastname, email, birthdate, class_id, subject_id, ishead);
    END;
$$;

-- call CREATE_TEACHER(TRUE)

DROP PROCEDURE IF EXISTS CREATE_PUPILS_FOR_CLASS;
CREATE OR REPLACE PROCEDURE CREATE_PUPILS_FOR_CLASS(IN pupilCount INTEGER)
LANGUAGE plpgsql AS $$
  
    DECLARE class_id INTEGER := (
        SELECT t.id FROM teachers t
        WHERE t.class_id IS NOT NULL
          AND t.is_head IS TRUE
        ORDER BY t.id DESC LIMIT 1
    );
    DECLARE class_head_id INTEGER := (
        SELECT tt.class_id FROM teachers tt
        WHERE tt.class_id IS NOT NULL
          AND tt.is_head IS TRUE
        ORDER BY tt.id DESC LIMIT 1
    );

    DECLARE IND_OFFSET INTEGER := (SELECT p.id FROM pupils p ORDER BY p.id DESC LIMIT 1);
    DECLARE i INTEGER := IND_OFFSET + 1;
    DECLARE boundVal INTEGER := IND_OFFSET + pupilCount + 1 ;

    DECLARE pupil_firstname VARCHAR(20);
    DECLARE pupil_lastname VARCHAR(20);
    DECLARE email VARCHAR(100);
    DECLARE pupil_gender VARCHAR(20);
    DECLARE pupil_birthdate DATE;

    BEGIN
        WHILE i < boundVal LOOP
            pupil_firstname = GET_RANDOM_FIRSTNAME();
            pupil_lastname = GET_RANDOM_LASTNAME();
            email = GET_EMAIL(pupil_firstname, pupil_lastname);
            pupil_gender = GET_RANDOM_GENDER();
            pupil_birthdate = GET_RANDOM_BIRTHDATE(7, 18);

            INSERT INTO pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id)
            VALUES (i, pupil_firstname, pupil_lastname, email, pupil_gender::genderType, pupil_birthdate, class_id, class_head_id);

            i := i + 1;
        END LOOP;
    END;
$$;

-- call CREATE_PUPILS_FOR_CLASS(30);

DROP PROCEDURE IF EXISTS CREATE_MARKS_FOR_PUPILS;
CREATE OR REPLACE PROCEDURE CREATE_MARKS_FOR_PUPILS(IN pupilCount INTEGER)
LANGUAGE plpgsql AS $$

    DECLARE ID_OFFSET INTEGER := (SELECT id FROM marks ORDER BY id DESC LIMIT 1);
    DECLARE id INTEGER := ID_OFFSET;
    DECLARE pupil_id_start INTEGER := (SELECT p.id FROM pupils p ORDER BY p.id DESC LIMIT 1) - pupilCount;
    DECLARE pupil_id_end INTEGER := pupil_id_start + pupilCount;
    DECLARE pupil_id INTEGER := pupil_id_start;

    DECLARE marks_count INTEGER;

    DECLARE subject_id INTEGER;
    DECLARE dateVal DATE;
    DECLARE valueVal INTEGER;

    BEGIN

        WHILE pupil_id < pupil_id_end + 1 LOOP
            pupil_id := pupil_id + 1;
            marks_count := (SELECT (FLOOR( 1 + RANDOM( ) * 4 )) );
            WHILE marks_count > 0 LOOP
                    marks_count := marks_count - 1;

                    id := id + 1;
                    subject_id := GET_RANDOM_SUBJECT_ID();

                    dateVal :=  GET_RANDOM_MARK_DATE(100);
                    valueVal := (SELECT (FLOOR( 1 + RANDOM( ) * 10 )) );

                    INSERT INTO marks (id, subject_id, pupil_id, date, value)
                    VALUES (id, subject_id, pupil_id, dateVal, valueVal);
            END LOOP;
        END LOOP;

    END;
$$;

-- call CREATE_MARKS_FOR_PUPILS(30);

DROP PROCEDURE IF EXISTS GENERATE_NEW_CLASS;
CREATE OR REPLACE PROCEDURE GENERATE_NEW_CLASS(IN pupilCount INTEGER)
LANGUAGE plpgsql AS $$

    BEGIN
        CALL CREATE_CLASS();
        CALL CREATE_TEACHER(true);
        CALL CREATE_PUPILS_FOR_CLASS(pupilCount);
        CALL CREATE_MARKS_FOR_PUPILS(pupilCount);
    END;

$$;

-- call GENERATE_NEW_CLASS(30);