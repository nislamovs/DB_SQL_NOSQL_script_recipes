CREATE FUNCTION marks_validation_insert_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
BEGIN
    IF (NEW.value < 1 OR NEW.value > 10) THEN
        RAISE EXCEPTION 'Mark value does not fit into interval [1-10]';
    END IF;

    IF NEW.date > NOW() THEN
        RAISE EXCEPTION 'Mark value cannot be put in future';
    END IF;
END;
$$;

CREATE TRIGGER marks_validation_insert_trigger BEFORE INSERT
ON marks
FOR EACH ROW EXECUTE PROCEDURE marks_validation_insert_trigger_function();

----------------------------------------------------------------------------------------------------------

CREATE FUNCTION marks_validation_update_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
BEGIN
    IF OLD.value <> NEW.value AND (NEW.value < 1 OR NEW.value > 10) THEN
        RAISE EXCEPTION 'Mark value does not fit into interval [1-10]';
    END IF;

    IF OLD.date <> NEW.date AND (NEW.date > NOW()) THEN
        RAISE EXCEPTION 'Mark value cannot be put in future';
    END IF;
END;
$$;

CREATE TRIGGER marks_validation_update_trigger BEFORE UPDATE
ON marks
FOR EACH ROW EXECUTE PROCEDURE marks_validation_update_trigger_function();