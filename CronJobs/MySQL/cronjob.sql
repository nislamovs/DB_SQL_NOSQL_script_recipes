SET GLOBAL event_scheduler = ON;

DELIMITER $$

CREATE EVENT IF NOT EXISTS email_filler_event
    ON SCHEDULE
        EVERY 1 MINUTE
        STARTS (CURRENT_TIMESTAMP + INTERVAL 1 MINUTE + INTERVAL 10 SECOND)
    COMMENT 'Fills email field for each pupil.'
        DO
            BEGIN
                SET @total_rows = 0;
                SET @row_number = 1;
                SELECT COUNT(*) FROM pupils INTO @total_rows;
                WHILE @row_number <= @total_rows DO
                    SET @email_value = (SELECT email FROM pupils where id = @row_number);
                    IF LENGTH(@email_value) < 10 THEN
                        SET @firstname = (SELECT firstname FROM pupils where id = @row_number);
                        SET @lastname = (SELECT lastname FROM pupils where id = @row_number);

                        UPDATE pupils
                        SET email = CONCAT(@firstname, '.', @lastname, '@gmail.com')
                        WHERE id = @row_number;
                    END IF;
                    SET @row_number = @row_number + 1;
                END WHILE;
            END;
$$

DELIMITER ;