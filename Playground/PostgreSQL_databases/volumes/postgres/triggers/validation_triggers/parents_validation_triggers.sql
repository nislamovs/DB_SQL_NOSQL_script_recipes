CREATE FUNCTION parents_validation_insert_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
BEGIN
    IF (NEW.email NOT LIKE '^[a-zA-Z0-9][+a-zA-Z0-9._-]*@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]*\\.[a-zA-Z]{2,4}$') THEN
        RAISE EXCEPTION 'Parent`s email does not fit into email regex pattern';
    END IF;

    IF (NEW.birthdate > NOW()) THEN
        RAISE EXCEPTION 'Parent`s birthdate cannot be put in future';
    END IF;

    IF (ABS(DATE_PART('YEAR', NEW.birthdate::DATE, CURRENT_DATE::DATE)) < 28) THEN
        RAISE EXCEPTION 'Parent`s age does not fit into interval: [28+] years';
    END IF;
END;
$$;

CREATE TRIGGER parents_validation_insert_trigger BEFORE INSERT
ON parents
FOR EACH ROW EXECUTE PROCEDURE parents_validation_insert_trigger_function();

----------------------------------------------------------------------------------------------------------

CREATE FUNCTION parents_validation_update_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
BEGIN
    IF OLD.email <> NEW.email && (NEW.email NOT LIKE '^[a-zA-Z0-9][+a-zA-Z0-9._-]*@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]*\\.[a-zA-Z]{2,4}$') THEN
        RAISE EXCEPTION 'Parent`s email does not fit into email regex pattern';
    END IF;

    IF OLD.birthdate <> NEW.birthdate && (NEW.birthdate > NOW()) THEN
        RAISE EXCEPTION 'Parent`s birthdate cannot be put in future';
    END IF;

    IF (ABS(DATE_PART('YEAR', NEW.birthdate::DATE, CURRENT_DATE::DATE)) < 28) THEN
        RAISE EXCEPTION 'Parent`s age does not fit into interval: [28+] years';
    END IF;
END;
$$;

CREATE TRIGGER parents_validation_update_trigger BEFORE UPDATE
ON parents
FOR EACH ROW EXECUTE PROCEDURE parents_validation_update_function();