CREATE FUNCTION subjects_validation_insert_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
BEGIN

END;
$$;

CREATE TRIGGER subjects_validation_insert_trigger BEFORE INSERT
ON subjects
FOR EACH ROW EXECUTE PROCEDURE subjects_validation_insert_trigger_function();

----------------------------------------------------------------------------------------------------------

CREATE FUNCTION subjects_validation_update_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
BEGIN

END;
$$;

CREATE TRIGGER subjects_validation_update_trigger BEFORE UPDATE
ON subjects
FOR EACH ROW EXECUTE PROCEDURE subjects_validation_update_trigger_function();