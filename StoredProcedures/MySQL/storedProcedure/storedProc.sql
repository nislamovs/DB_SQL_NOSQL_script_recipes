CREATE DATABASE IF NOT EXISTS school ;
use school ;

create table pupils (
	id INT,
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	email VARCHAR(50),
	gender VARCHAR(50),
	birthdate DATE,
	class_id INT,
	class_head_id INT
);


DELIMITER ;;

DROP PROCEDURE IF EXISTS generate_pupils;
CREATE PROCEDURE generate_pupils(count INTEGER)
  BEGIN

    SET @i = 1;
    WHILE @i < count+1 DO
      SET @pupil_firstname = concat('pupilFirstname_', @i);
      SET @pupil_laststname = concat('pupilLastname_', @i);
      SET @email = concat('pupil_', @i, '@gmail.com');

      insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id)
       values (@i, @user_firstname, @user_laststname, @email, 'Female',  STR_TO_DATE('02/16/2019',  '%m/%d/%Y'), 3, 2);

      SET @i = @i + 1;
    END WHILE;

  END;
;;

DELIMITER ;

CALL generate_pupils(800);