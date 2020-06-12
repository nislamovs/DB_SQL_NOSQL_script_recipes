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
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (1, 'Gert', 'Bilbrook', '', 'Female',  STR_TO_DATE('02/16/2019',  '%m/%d/%Y'), 3, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (2, 'Jamil', 'Vonasek', '', 'Male',  STR_TO_DATE('06/04/2004',  '%m/%d/%Y'), 2, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (3, 'Nevsa', 'Esberger', '', 'Female',  STR_TO_DATE('08/06/2008',  '%m/%d/%Y'), 4, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (4, 'Rorke', 'Valentinuzzi', '', 'Male',  STR_TO_DATE('10/24/2018',  '%m/%d/%Y'), 4, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (5, 'Augie', 'Defew', '', 'Male',  STR_TO_DATE('09/26/2002',  '%m/%d/%Y'), 2, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (6, 'Shanta', 'Penkethman', '', 'Female',  STR_TO_DATE('12/07/2010',  '%m/%d/%Y'), 5, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (7, 'Cesare', 'Shelsher', '', 'Male',  STR_TO_DATE('02/15/2016',  '%m/%d/%Y'), 3, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (8, 'Dimitri', 'Borles', '', 'Male',  STR_TO_DATE('05/12/2004',  '%m/%d/%Y'), 2, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (9, 'Ab', 'Grinsted', '', 'Male',  STR_TO_DATE('06/04/2006',  '%m/%d/%Y'), 2, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (10, 'Hernando', 'Bisp', '', 'Male',  STR_TO_DATE('07/18/2004',  '%m/%d/%Y'), 4, 2);