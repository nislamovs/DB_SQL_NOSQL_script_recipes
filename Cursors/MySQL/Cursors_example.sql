/*
To handle a result set inside a stored procedure, you use a cursor. A cursor allows you to iterate a set of rows returned by a query and process each row individually.
 */

DELIMITER $$

CREATE PROCEDURE createEmailList (
	INOUT emailList varchar(4000)
)
BEGIN
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE emailAddress varchar(100) DEFAULT "";

	-- declare cursor for pupils email
	DEClARE curEmail
		CURSOR FOR
			SELECT email FROM pupils;

	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET finished = 1;

	OPEN curEmail;

	getEmail: LOOP
		FETCH curEmail INTO emailAddress;
		IF finished = 1 THEN
			LEAVE getEmail;
		END IF;
		-- build email list
		SET emailList = CONCAT(emailAddress,";",emailList);
	END LOOP getEmail;
	CLOSE curEmail;

END$$

DELIMITER ;


SET @emailList = "";
CALL createEmailList(@emailList);
SELECT @emailList;