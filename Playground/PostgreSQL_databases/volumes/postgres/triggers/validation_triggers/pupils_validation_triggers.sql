CREATE FUNCTION pupils_validation_insert_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
    BEGIN
      IF (NEW.email NOT LIKE '^[a-zA-Z0-9][+a-zA-Z0-9._-]*@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]*\\.[a-zA-Z]{2,4}$') THEN
          RAISE EXCEPTION 'Pupil`s email does not fit into email regex pattern';
      END IF;

      IF (NEW.birthdate > NOW()) THEN
          RAISE EXCEPTION 'Pupil`s birthdate cannot be put in future';
      END IF;

      IF ( (ABS(DATE_PART('YEAR', NEW.birthdate, CURRENT_DATE) > 19)) || (ABS(DATE_PART('YEAR', NEW.birthdate, CURRENT_DATE) < 6)) ) THEN
          RAISE EXCEPTION 'Pupil`s age does not fit into interval: [6-19] years';
      END IF;
    END;
$$;

CREATE TRIGGER pupils_validation_insert_trigger BEFORE INSERT
ON pupils
FOR EACH ROW EXECUTE PROCEDURE pupils_validation_insert_trigger_function();

-------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION pupils_validation_update_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
    BEGIN
        IF OLD.email <> NEW.email && (NEW.email NOT LIKE '^[a-zA-Z0-9][+a-zA-Z0-9._-]*@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]*\\.[a-zA-Z]{2,4}$') THEN
            RAISE EXCEPTION 'Pupil`s email does not fit into email regex pattern';
        END IF;

        IF OLD.birthdate <> NEW.birthdate && (NEW.birthdate > NOW()) THEN
            RAISE EXCEPTION 'Pupil`s birthdate cannot be put in future';
        END IF;

        IF ( (ABS(DATE_PART('YEAR', NEW.birthdate, CURRENT_DATE) > 19)) || (ABS(DATE_PART('YEAR', NEW.birthdate, CURRENT_DATE) < 6)) ) THEN
            RAISE EXCEPTION 'Pupil`s age does not fit into interval: [6-19] years';
        END IF;
    END;
$$;

CREATE TRIGGER pupils_validation_update_trigger BEFORE UPDATE
ON pupils
FOR EACH ROW EXECUTE PROCEDURE pupils_validation_update_trigger_function();


