CREATE FUNCTION classes_validation_insert_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
BEGIN

END;
$$;

CREATE TRIGGER classes_validation_insert_trigger BEFORE INSERT
ON classes
FOR EACH ROW EXECUTE PROCEDURE classes_validation_insert_trigger_function();

----------------------------------------------------------------------------------------------------------

CREATE FUNCTION classes_validation_update_trigger_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS $$
BEGIN

END;
$$;

CREATE TRIGGER classes_validation_update_trigger BEFORE UPDATE
ON classes
FOR EACH ROW EXECUTE PROCEDURE classes_validation_update_trigger_function();