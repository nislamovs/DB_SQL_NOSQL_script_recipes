CREATE FUNCTION classes_statistics_validation_insert_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
BEGIN
    IF (NEW.created > NOW()) THEN
        RAISE EXCEPTION 'School class creation date cannot be in future!';
    END IF;
END;
$$;

CREATE TRIGGER classes_statistics_validation_insert_trigger BEFORE INSERT
ON classes_statistics
FOR EACH ROW EXECUTE PROCEDURE classes_statistics_validation_insert_trigger_function();

----------------------------------------------------------------------------------------------------------

CREATE FUNCTION classes_statistics_validation_update_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
BEGIN
    IF (OLD.created != NEW.created AND NEW.created > NOW()) THEN
        RAISE EXCEPTION 'School class creation date cannot be in future!';
    END IF;
END;
$$;

CREATE TRIGGER classes_statistics_validation_update_trigger BEFORE UPDATE
ON classes_statistics
FOR EACH ROW EXECUTE PROCEDURE classes_statistics_validation_update_trigger_function();


