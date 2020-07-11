CREATE DATABASE IF NOT EXISTS school ;
use school ;

CREATE TABLE IF NOT EXISTS pupils (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	email VARCHAR(50) UNIQUE,
	gender ENUM('MALE', 'FEMALE') NOT NULL,
	birthdate DATE,
	class_id INTEGER,
	class_head_id INTEGER,


	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 	created_by varchar(50) DEFAULT "Admin",
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	modified_by varchar(50) DEFAULT "Admin"

) ENGINE = InnoDB DEFAULT CHARSET=utf8;


insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (1, 'Gert', 'Bilbrook', 'gbilbrook0@nature.com', 'Female',  STR_TO_DATE('02/16/2019',  '%m/%d/%Y'), 3, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (2, 'Jamil', 'Vonasek', 'jvonasek1@howstuffworks.com', 'Male',  STR_TO_DATE('06/04/2004',  '%m/%d/%Y'), 2, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (3, 'Nevsa', 'Esberger', 'nesberger2@bluehost.com', 'Female',  STR_TO_DATE('08/06/2008',  '%m/%d/%Y'), 4, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (4, 'Rorke', 'Valentinuzzi', 'rvalentinuzzi3@google.com.au', 'Male',  STR_TO_DATE('10/24/2018',  '%m/%d/%Y'), 4, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (5, 'Augie', 'Defew', 'adefew4@blinklist.com', 'Male',  STR_TO_DATE('09/26/2002',  '%m/%d/%Y'), 2, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (6, 'Shanta', 'Penkethman', 'spenkethman5@mediafire.com', 'Female',  STR_TO_DATE('12/07/2010',  '%m/%d/%Y'), 5, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (7, 'Cesare', 'Shelsher', 'cshelsher6@umich.edu', 'Male',  STR_TO_DATE('02/15/2016',  '%m/%d/%Y'), 3, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (8, 'Dimitri', 'Borles', 'dborles7@hp.com', 'Male',  STR_TO_DATE('05/12/2004',  '%m/%d/%Y'), 2, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (9, 'Ab', 'Grinsted', 'agrinsted8@nationalgeographic.com', 'Male',  STR_TO_DATE('06/04/2006',  '%m/%d/%Y'), 2, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (10, 'Hernando', 'Bisp', 'hbisp9@mlb.com', 'Male',  STR_TO_DATE('07/18/2004',  '%m/%d/%Y'), 4, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (11, 'Stearne', 'Monument', 'smonumenta@craigslist.org', 'Male',  STR_TO_DATE('02/27/2012',  '%m/%d/%Y'), 1, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (12, 'Artemis', 'Morriss', 'amorrissb@scientificamerican.com', 'Male',  STR_TO_DATE('10/01/2005',  '%m/%d/%Y'), 3, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (13, 'Rodolphe', 'Pantin', 'rpantinc@answers.com', 'Male',  STR_TO_DATE('06/16/2019',  '%m/%d/%Y'), 3, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (14, 'Mortie', 'Hartless', 'mhartlessd@tinypic.com', 'Male',  STR_TO_DATE('02/28/2018',  '%m/%d/%Y'), 2, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (15, 'Yuri', 'Borrows', 'yborrowse@illinois.edu', 'Male',  STR_TO_DATE('04/18/2003',  '%m/%d/%Y'), 4, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (16, 'Owen', 'Fidilis', 'ofidilisf@sfgate.com', 'Male',  STR_TO_DATE('06/20/2014',  '%m/%d/%Y'), 1, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (17, 'Chance', 'Allix', 'callixg@tripod.com', 'Male',  STR_TO_DATE('12/22/2016',  '%m/%d/%Y'), 2, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (18, 'Beitris', 'Guymer', 'bguymerh@hugedomains.com', 'Female',  STR_TO_DATE('11/14/2003',  '%m/%d/%Y'), 1, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (19, 'Rozalin', 'Gobert', 'rgoberti@howstuffworks.com', 'Female',  STR_TO_DATE('11/30/2009',  '%m/%d/%Y'), 4, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (20, 'Donavon', 'Lovick', 'dlovickj@ovh.net', 'Male',  STR_TO_DATE('07/10/2019',  '%m/%d/%Y'), 3, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (21, 'Juline', 'Case', 'jcasek@statcounter.com', 'Female',  STR_TO_DATE('03/17/2005',  '%m/%d/%Y'), 4, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (22, 'Ber', 'Spata', 'bspatal@usa.gov', 'Male',  STR_TO_DATE('06/07/2004',  '%m/%d/%Y'), 2, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (23, 'Had', 'Wintersgill', 'hwintersgillm@comsenz.com', 'Male',  STR_TO_DATE('07/01/2011',  '%m/%d/%Y'), 1, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (24, 'Ivory', 'Tidmas', 'itidmasn@nationalgeographic.com', 'Female',  STR_TO_DATE('06/15/2017',  '%m/%d/%Y'), 1, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (25, 'Max', 'Birchenhead', 'mbirchenheado@ning.com', 'Female',  STR_TO_DATE('01/16/2006',  '%m/%d/%Y'), 4, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (26, 'Roderich', 'Litel', 'rlitelp@mail.ru', 'Male',  STR_TO_DATE('03/03/2006',  '%m/%d/%Y'), 1, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (27, 'Mehetabel', 'Lyte', 'mlyteq@seesaa.net', 'Female',  STR_TO_DATE('05/05/2011',  '%m/%d/%Y'), 3, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (28, 'Louie', 'Tunnow', 'ltunnowr@google.fr', 'Male',  STR_TO_DATE('06/26/2011',  '%m/%d/%Y'), 5, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (29, 'Adore', 'Annion', 'aannions@netscape.com', 'Female',  STR_TO_DATE('06/11/2012',  '%m/%d/%Y'), 3, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (30, 'Baillie', 'Casaro', 'bcasarot@bbb.org', 'Male',  STR_TO_DATE('09/15/2004',  '%m/%d/%Y'), 4, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (31, 'Elias', 'Speaks', 'espeaksu@mit.edu', 'Male',  STR_TO_DATE('10/08/2017',  '%m/%d/%Y'), 1, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (32, 'Brande', 'Schoenfisch', 'bschoenfischv@trellian.com', 'Female',  STR_TO_DATE('11/29/2013',  '%m/%d/%Y'), 3, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (33, 'Abramo', 'Curmi', 'acurmiw@unicef.org', 'Male',  STR_TO_DATE('05/24/2011',  '%m/%d/%Y'), 4, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (34, 'Tracey', 'Joseph', 'tjosephx@hp.com', 'Male',  STR_TO_DATE('06/24/2017',  '%m/%d/%Y'), 5, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (35, 'Derwin', 'Marder', 'dmardery@skype.com', 'Male',  STR_TO_DATE('02/05/2007',  '%m/%d/%Y'), 4, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (36, 'Budd', 'Fumagalli', 'bfumagalliz@cyberchimps.com', 'Male',  STR_TO_DATE('05/22/2002',  '%m/%d/%Y'), 4, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (37, 'Annie', 'Mazella', 'amazella10@omniture.com', 'Female',  STR_TO_DATE('08/11/2013',  '%m/%d/%Y'), 4, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (38, 'Mareah', 'Darlington', 'mdarlington11@mapy.cz', 'Female',  STR_TO_DATE('11/19/2014',  '%m/%d/%Y'), 1, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (39, 'Bevon', 'Eilles', 'beilles12@bandcamp.com', 'Male',  STR_TO_DATE('10/01/2005',  '%m/%d/%Y'), 2, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (40, 'Dukey', 'Camilleri', 'dcamilleri13@tmall.com', 'Male',  STR_TO_DATE('11/05/2018',  '%m/%d/%Y'), 5, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (41, 'Randell', 'Waldron', 'rwaldron14@ameblo.jp', 'Male',  STR_TO_DATE('04/02/2010',  '%m/%d/%Y'), 3, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (42, 'Garik', 'Annesley', 'gannesley15@w3.org', 'Male',  STR_TO_DATE('04/17/2012',  '%m/%d/%Y'), 3, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (43, 'Kristin', 'Bessant', 'kbessant16@narod.ru', 'Female',  STR_TO_DATE('11/01/2006',  '%m/%d/%Y'), 2, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (44, 'Dodi', 'Creegan', 'dcreegan17@squarespace.com', 'Female',  STR_TO_DATE('04/12/2007',  '%m/%d/%Y'), 5, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (45, 'Aurthur', 'Skurm', 'askurm18@baidu.com', 'Male',  STR_TO_DATE('06/28/2007',  '%m/%d/%Y'), 4, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (46, 'Christophe', 'Tansley', 'ctansley19@ebay.com', 'Male',  STR_TO_DATE('11/22/2005',  '%m/%d/%Y'), 2, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (47, 'Bartolomeo', 'Brotherheed', 'bbrotherheed1a@is.gd', 'Male',  STR_TO_DATE('06/17/2013',  '%m/%d/%Y'), 4, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (48, 'Zulema', 'Rugieri', 'zrugieri1b@epa.gov', 'Female',  STR_TO_DATE('06/02/2011',  '%m/%d/%Y'), 4, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (49, 'Codie', 'Ive', 'cive1c@wikispaces.com', 'Male',  STR_TO_DATE('01/20/2007',  '%m/%d/%Y'), 4, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (50, 'Caddric', 'Scrivens', 'cscrivens1d@un.org', 'Male',  STR_TO_DATE('01/21/2009',  '%m/%d/%Y'), 4, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (51, 'Byram', 'Filon', 'bfilon1e@creativecommons.org', 'Male',  STR_TO_DATE('02/27/2006',  '%m/%d/%Y'), 4, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (52, 'Estevan', 'Leyshon', 'eleyshon1f@howstuffworks.com', 'Male',  STR_TO_DATE('01/06/2016',  '%m/%d/%Y'), 4, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (53, 'Cyril', 'Belson', 'cbelson1g@bloglines.com', 'Male',  STR_TO_DATE('06/26/2017',  '%m/%d/%Y'), 5, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (54, 'Frederica', 'Missington', 'fmissington1h@tamu.edu', 'Female',  STR_TO_DATE('05/21/2014',  '%m/%d/%Y'), 1, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (55, 'Rosita', 'Divine', 'rdivine1i@abc.net.au', 'Female',  STR_TO_DATE('11/07/2019',  '%m/%d/%Y'), 2, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (56, 'Rabi', 'Crudge', 'rcrudge1j@ca.gov', 'Male',  STR_TO_DATE('05/30/2007',  '%m/%d/%Y'), 2, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (57, 'Georgena', 'Graves', 'ggraves1k@smh.com.au', 'Female',  STR_TO_DATE('12/25/2004',  '%m/%d/%Y'), 1, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (58, 'Vladimir', 'Orrum', 'vorrum1l@abc.net.au', 'Male',  STR_TO_DATE('03/16/2019',  '%m/%d/%Y'), 4, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (59, 'Kelby', 'Blasl', 'kblasl1m@ibm.com', 'Male',  STR_TO_DATE('09/03/2016',  '%m/%d/%Y'), 3, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (60, 'Dodie', 'Gadd', 'dgadd1n@whitehouse.gov', 'Female',  STR_TO_DATE('10/04/2016',  '%m/%d/%Y'), 5, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (61, 'Anestassia', 'Conkling', 'aconkling1o@eventbrite.com', 'Female',  STR_TO_DATE('05/25/2003',  '%m/%d/%Y'), 2, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (62, 'Lawton', 'Dalzell', 'ldalzell1p@bbb.org', 'Male',  STR_TO_DATE('03/08/2008',  '%m/%d/%Y'), 2, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (63, 'Kym', 'Cowp', 'kcowp1q@whitehouse.gov', 'Female',  STR_TO_DATE('07/04/2003',  '%m/%d/%Y'), 2, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (64, 'Sharia', 'Roberti', 'sroberti1r@slashdot.org', 'Female',  STR_TO_DATE('02/08/2016',  '%m/%d/%Y'), 3, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (65, 'Heinrick', 'Caunter', 'hcaunter1s@elpais.com', 'Male',  STR_TO_DATE('11/24/2002',  '%m/%d/%Y'), 1, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (66, 'Hunter', 'Chappelow', 'hchappelow1t@unicef.org', 'Male',  STR_TO_DATE('09/19/2018',  '%m/%d/%Y'), 4, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (67, 'Clarke', 'Poveleye', 'cpoveleye1u@mozilla.org', 'Male',  STR_TO_DATE('08/12/2018',  '%m/%d/%Y'), 2, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (68, 'Eleanore', 'Sears', 'esears1v@wsj.com', 'Female',  STR_TO_DATE('07/31/2016',  '%m/%d/%Y'), 1, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (69, 'Jeramey', 'Ravens', 'jravens1w@dailymail.co.uk', 'Male',  STR_TO_DATE('10/26/2007',  '%m/%d/%Y'), 3, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (70, 'Kelvin', 'Arndtsen', 'karndtsen1x@pen.io', 'Male',  STR_TO_DATE('11/24/2011',  '%m/%d/%Y'), 1, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (71, 'Gena', 'Tankard', 'gtankard1y@linkedin.com', 'Female',  STR_TO_DATE('01/18/2016',  '%m/%d/%Y'), 2, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (72, 'Teddi', 'Martell', 'tmartell1z@alibaba.com', 'Female',  STR_TO_DATE('03/25/2017',  '%m/%d/%Y'), 4, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (73, 'Piper', 'Delves', 'pdelves20@prweb.com', 'Female',  STR_TO_DATE('02/05/2010',  '%m/%d/%Y'), 4, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (74, 'Lea', 'Matthiae', 'lmatthiae21@sitemeter.com', 'Female',  STR_TO_DATE('12/07/2007',  '%m/%d/%Y'), 1, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (75, 'Helli', 'Mardee', 'hmardee22@princeton.edu', 'Female',  STR_TO_DATE('02/11/2013',  '%m/%d/%Y'), 2, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (76, 'Nancee', 'Haysom', 'nhaysom23@wsj.com', 'Female',  STR_TO_DATE('11/20/2006',  '%m/%d/%Y'), 2, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (77, 'Hershel', 'Howlett', 'hhowlett24@istockphoto.com', 'Male',  STR_TO_DATE('06/15/2009',  '%m/%d/%Y'), 4, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (78, 'Mina', 'Adanet', 'madanet25@webnode.com', 'Female',  STR_TO_DATE('06/25/2014',  '%m/%d/%Y'), 3, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (79, 'Dar', 'Alesbrook', 'dalesbrook26@sina.com.cn', 'Male',  STR_TO_DATE('07/20/2011',  '%m/%d/%Y'), 4, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (80, 'Octavia', 'Venmore', 'ovenmore27@yolasite.com', 'Female',  STR_TO_DATE('08/21/2015',  '%m/%d/%Y'), 5, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (81, 'Brynna', 'Delgado', 'bdelgado28@posterous.com', 'Female',  STR_TO_DATE('08/06/2009',  '%m/%d/%Y'), 5, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (82, 'Mia', 'Tatters', 'mtatters29@nba.com', 'Female',  STR_TO_DATE('08/31/2010',  '%m/%d/%Y'), 5, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (83, 'Cherilynn', 'Kuschek', 'ckuschek2a@shinystat.com', 'Female',  STR_TO_DATE('09/04/2018',  '%m/%d/%Y'), 4, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (84, 'Isabelle', 'Biever', 'ibiever2b@tinypic.com', 'Female',  STR_TO_DATE('07/22/2016',  '%m/%d/%Y'), 5, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (85, 'Basia', 'Giacomini', 'bgiacomini2c@amazonaws.com', 'Female',  STR_TO_DATE('04/29/2019',  '%m/%d/%Y'), 2, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (86, 'Sherman', 'Pawel', 'spawel2d@weebly.com', 'Male',  STR_TO_DATE('08/06/2016',  '%m/%d/%Y'), 1, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (87, 'Arlee', 'Geggie', 'ageggie2e@mac.com', 'Female',  STR_TO_DATE('05/20/2002',  '%m/%d/%Y'), 2, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (88, 'Rozamond', 'Caze', 'rcaze2f@europa.eu', 'Female',  STR_TO_DATE('03/28/2008',  '%m/%d/%Y'), 4, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (89, 'Angy', 'Faulds', 'afaulds2g@pinterest.com', 'Female',  STR_TO_DATE('07/08/2002',  '%m/%d/%Y'), 3, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (90, 'Austina', 'Stead', 'astead2h@washingtonpost.com', 'Female',  STR_TO_DATE('07/24/2015',  '%m/%d/%Y'), 5, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (91, 'Elijah', 'Josovich', 'ejosovich2i@google.cn', 'Male',  STR_TO_DATE('06/15/2004',  '%m/%d/%Y'), 2, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (92, 'Fredric', 'Winterborne', 'fwinterborne2j@globo.com', 'Male',  STR_TO_DATE('09/12/2014',  '%m/%d/%Y'), 2, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (93, 'Cleopatra', 'Nisby', 'cnisby2k@angelfire.com', 'Female',  STR_TO_DATE('03/14/2013',  '%m/%d/%Y'), 1, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (94, 'Erick', 'O''Hoolahan', 'eohoolahan2l@cnet.com', 'Male',  STR_TO_DATE('07/11/2008',  '%m/%d/%Y'), 4, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (95, 'Frazer', 'Ximenez', 'fximenez2m@timesonline.co.uk', 'Male',  STR_TO_DATE('03/18/2006',  '%m/%d/%Y'), 2, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (96, 'Wallie', 'MacKnight', 'wmacknight2n@jugem.jp', 'Male',  STR_TO_DATE('01/20/2004',  '%m/%d/%Y'), 1, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (97, 'Erick', 'Edling', 'eedling2o@yellowpages.com', 'Male',  STR_TO_DATE('12/11/2016',  '%m/%d/%Y'), 5, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (98, 'Flor', 'Benedito', 'fbenedito2p@sogou.com', 'Female',  STR_TO_DATE('09/21/2009',  '%m/%d/%Y'), 4, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (99, 'Katherina', 'Biglin', 'kbiglin2q@wsj.com', 'Female',  STR_TO_DATE('08/01/2013',  '%m/%d/%Y'), 3, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (100, 'Gwendolen', 'Fann', 'gfann2r@psu.edu', 'Female',  STR_TO_DATE('05/12/2008',  '%m/%d/%Y'), 2, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (101, 'Hogan', 'Lamburn', 'hlamburn2s@qq.com', 'Male',  STR_TO_DATE('02/20/2003',  '%m/%d/%Y'), 2, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (102, 'Torr', 'Douthwaite', 'tdouthwaite2t@mashable.com', 'Male',  STR_TO_DATE('09/20/2003',  '%m/%d/%Y'), 5, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (103, 'Devi', 'Godrich', 'dgodrich2u@springer.com', 'Female',  STR_TO_DATE('06/16/2015',  '%m/%d/%Y'), 1, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (104, 'Jody', 'Djurevic', 'jdjurevic2v@ibm.com', 'Female',  STR_TO_DATE('03/31/2013',  '%m/%d/%Y'), 3, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (105, 'Robby', 'Haye', 'rhaye2w@alibaba.com', 'Female',  STR_TO_DATE('01/01/2005',  '%m/%d/%Y'), 5, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (106, 'Pen', 'Willavoys', 'pwillavoys2x@moonfruit.com', 'Male',  STR_TO_DATE('04/01/2018',  '%m/%d/%Y'), 2, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (107, 'Bertram', 'Sibille', 'bsibille2y@phpbb.com', 'Male',  STR_TO_DATE('06/08/2009',  '%m/%d/%Y'), 5, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (108, 'Catie', 'Westcott', 'cwestcott2z@reverbnation.com', 'Female',  STR_TO_DATE('09/23/2003',  '%m/%d/%Y'), 4, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (109, 'Frayda', 'Dike', 'fdike30@bloglovin.com', 'Female',  STR_TO_DATE('10/22/2017',  '%m/%d/%Y'), 3, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (110, 'Roxanna', 'Foro', 'rforo31@intel.com', 'Female',  STR_TO_DATE('01/01/2003',  '%m/%d/%Y'), 1, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (111, 'Lock', 'Boodell', 'lboodell32@examiner.com', 'Male',  STR_TO_DATE('01/07/2016',  '%m/%d/%Y'), 3, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (112, 'Tomasina', 'Hickenbottom', 'thickenbottom33@usda.gov', 'Female',  STR_TO_DATE('12/06/2010',  '%m/%d/%Y'), 2, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (113, 'Tiffy', 'Leaburn', 'tleaburn34@imageshack.us', 'Female',  STR_TO_DATE('05/30/2003',  '%m/%d/%Y'), 4, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (114, 'Dare', 'Goldhill', 'dgoldhill35@sun.com', 'Male',  STR_TO_DATE('07/03/2009',  '%m/%d/%Y'), 3, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (115, 'Aurilia', 'Deneve', 'adeneve36@skyrock.com', 'Female',  STR_TO_DATE('05/12/2008',  '%m/%d/%Y'), 2, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (116, 'Guthrie', 'Myrtle', 'gmyrtle37@webeden.co.uk', 'Male',  STR_TO_DATE('04/06/2004',  '%m/%d/%Y'), 3, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (117, 'Vaclav', 'Corzor', 'vcorzor38@sun.com', 'Male',  STR_TO_DATE('05/08/2006',  '%m/%d/%Y'), 5, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (118, 'Dita', 'Biaggioni', 'dbiaggioni39@blogger.com', 'Female',  STR_TO_DATE('03/02/2009',  '%m/%d/%Y'), 2, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (119, 'Brannon', 'Hullett', 'bhullett3a@vinaora.com', 'Male',  STR_TO_DATE('12/29/2008',  '%m/%d/%Y'), 5, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (120, 'Dwight', 'Lillee', 'dlillee3b@amazon.co.jp', 'Male',  STR_TO_DATE('02/27/2010',  '%m/%d/%Y'), 2, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (121, 'Collete', 'Facchini', 'cfacchini3c@independent.co.uk', 'Female',  STR_TO_DATE('11/02/2002',  '%m/%d/%Y'), 2, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (122, 'Morry', 'Jakeway', 'mjakeway3d@mozilla.com', 'Male',  STR_TO_DATE('11/09/2012',  '%m/%d/%Y'), 3, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (123, 'Farrel', 'Kilborn', 'fkilborn3e@zimbio.com', 'Male',  STR_TO_DATE('02/17/2018',  '%m/%d/%Y'), 4, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (124, 'Dorian', 'Aguilar', 'daguilar3f@ucla.edu', 'Male',  STR_TO_DATE('03/24/2005',  '%m/%d/%Y'), 1, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (125, 'Rob', 'Wherry', 'rwherry3g@360.cn', 'Male',  STR_TO_DATE('07/11/2012',  '%m/%d/%Y'), 1, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (126, 'Beverie', 'Pideon', 'bpideon3h@pcworld.com', 'Female',  STR_TO_DATE('03/21/2016',  '%m/%d/%Y'), 5, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (127, 'Jorry', 'McDougal', 'jmcdougal3i@github.io', 'Female',  STR_TO_DATE('07/28/2008',  '%m/%d/%Y'), 2, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (128, 'Robinson', 'Brendel', 'rbrendel3j@51.la', 'Male',  STR_TO_DATE('09/01/2018',  '%m/%d/%Y'), 5, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (129, 'Iorgos', 'Rowet', 'irowet3k@msu.edu', 'Male',  STR_TO_DATE('12/01/2008',  '%m/%d/%Y'), 1, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (130, 'Lotte', 'Sante', 'lsante3l@bbb.org', 'Female',  STR_TO_DATE('04/10/2014',  '%m/%d/%Y'), 4, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (131, 'Jeno', 'St Leger', 'jstleger3m@si.edu', 'Male',  STR_TO_DATE('09/29/2008',  '%m/%d/%Y'), 2, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (132, 'Darbee', 'Whitehall', 'dwhitehall3n@about.com', 'Male',  STR_TO_DATE('07/08/2013',  '%m/%d/%Y'), 5, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (133, 'Hulda', 'Jerzycowski', 'hjerzycowski3o@usatoday.com', 'Female',  STR_TO_DATE('11/21/2006',  '%m/%d/%Y'), 5, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (134, 'Arvin', 'Leinster', 'aleinster3p@cafepress.com', 'Male',  STR_TO_DATE('08/21/2008',  '%m/%d/%Y'), 3, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (135, 'Gino', 'Givens', 'ggivens3q@mlb.com', 'Male',  STR_TO_DATE('10/17/2019',  '%m/%d/%Y'), 2, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (136, 'Zeb', 'Monketon', 'zmonketon3r@edublogs.org', 'Male',  STR_TO_DATE('01/14/2011',  '%m/%d/%Y'), 3, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (137, 'Inger', 'Boatright', 'iboatright3s@vk.com', 'Male',  STR_TO_DATE('11/29/2008',  '%m/%d/%Y'), 5, 3);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (138, 'Torrance', 'Braithwaite', 'tbraithwaite3t@cbslocal.com', 'Male',  STR_TO_DATE('05/26/2017',  '%m/%d/%Y'), 2, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (139, 'Alisun', 'Grono', 'agrono3u@thetimes.co.uk', 'Female',  STR_TO_DATE('01/04/2009',  '%m/%d/%Y'), 5, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (140, 'Jolyn', 'Kyberd', 'jkyberd3v@weebly.com', 'Female',  STR_TO_DATE('03/09/2010',  '%m/%d/%Y'), 3, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (141, 'Camellia', 'Cogman', 'ccogman3w@amazonaws.com', 'Female',  STR_TO_DATE('05/24/2018',  '%m/%d/%Y'), 4, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (142, 'Bronny', 'Cuff', 'bcuff3x@desdev.cn', 'Male',  STR_TO_DATE('12/08/2005',  '%m/%d/%Y'), 4, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (143, 'Philipa', 'Mardoll', 'pmardoll3y@sbwire.com', 'Female',  STR_TO_DATE('11/02/2002',  '%m/%d/%Y'), 3, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (144, 'Nydia', 'Kiljan', 'nkiljan3z@shareasale.com', 'Female',  STR_TO_DATE('01/12/2011',  '%m/%d/%Y'), 2, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (145, 'Gunner', 'Maykin', 'gmaykin40@nih.gov', 'Male',  STR_TO_DATE('07/27/2007',  '%m/%d/%Y'), 4, 5);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (146, 'Hayyim', 'Ganniclifft', 'hganniclifft41@shinystat.com', 'Male',  STR_TO_DATE('02/04/2009',  '%m/%d/%Y'), 2, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (147, 'Charley', 'Hinrichsen', 'chinrichsen42@squidoo.com', 'Male',  STR_TO_DATE('06/05/2019',  '%m/%d/%Y'), 2, 4);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (148, 'Reuben', 'Bubeer', 'rbubeer43@free.fr', 'Male',  STR_TO_DATE('11/22/2012',  '%m/%d/%Y'), 5, 1);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (149, 'Stacey', 'Galero', 'sgalero44@bluehost.com', 'Female',  STR_TO_DATE('11/03/2011',  '%m/%d/%Y'), 5, 2);
insert into pupils (id, firstname, lastname, email, gender, birthdate, class_id, class_head_id) values (150, 'Melany', 'Wakeling', 'mwakeling45@telegraph.co.uk', 'Female',  STR_TO_DATE('09/07/2008',  '%m/%d/%Y'), 4, 1);
