insert into pupils (firstname, lastname, email, gender, birthdate, class_id, class_head_id) values ('Gert', 'Bilbrook', 'gbilbrook0@nature.com', 'Female',  STR_TO_DATE('02/16/2009',  '%m/%d/%Y'), 3, 2);

SELECT LAST_INSERT_ID();


-- returns 151