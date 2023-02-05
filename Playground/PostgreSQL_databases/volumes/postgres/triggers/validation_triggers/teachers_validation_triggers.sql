CREATE FUNCTION teachers_validation_insert_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
    BEGIN
        IF (NEW.email NOT LIKE '^[a-zA-Z0-9][+a-zA-Z0-9._-]*@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]*\\.[a-zA-Z]{2,4}$') THEN
            RAISE EXCEPTION 'Teacher`s email does not fit into email regex pattern';
        END IF;

        IF (NEW.birthdate > NOW()) THEN
            RAISE EXCEPTION 'Teacher`s birthdate cannot be put in future';
        END IF;

        IF ( (ABS(DATE_PART('YEAR', NEW.birthdate, CURRENT_DATE) > 65)) || (ABS(DATE_PART('YEAR', NEW.birthdate, CURRENT_DATE) < 21)) ) THEN
            RAISE EXCEPTION 'Teacher`s age does not fit into interval: [21-65] years';
        END IF;
    END;
$$;

CREATE TRIGGER teachers_validation_insert_trigger BEFORE INSERT
ON teachers
FOR EACH ROW EXECUTE PROCEDURE teachers_validation_insert_trigger_function();

------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION teachers_validation_update_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
    BEGIN
      IF OLD.email <> NEW.email && (NEW.email NOT LIKE '^[a-zA-Z0-9][+a-zA-Z0-9._-]*@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]*\\.[a-zA-Z]{2,4}$') THEN
            RAISE EXCEPTION 'Teacher`s email does not fit into email regex pattern';
      END IF;

      IF OLD.birthdate <> NEW.birthdate && (NEW.birthdate > NOW()) THEN
            RAISE EXCEPTION 'Teacher`s birthdate cannot be put in future';
      END IF;

      IF ( (ABS(DATE_PART('YEAR', NEW.birthdate, CURRENT_DATE) > 65)) || (ABS(DATE_PART('YEAR', NEW.birthdate, CURRENT_DATE) < 21)) ) THEN
            RAISE EXCEPTION 'Teacher`s age does not fit into interval: [21-65] years';
      END IF;
    END;
$$;

CREATE TRIGGER teachers_validation_update_trigger BEFORE UPDATE
ON teachers
FOR EACH ROW EXECUTE PROCEDURE teachers_validation_update_trigger_function();