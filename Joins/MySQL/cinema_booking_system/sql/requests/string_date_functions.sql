
------------------------------   STRINGS   ------------------------------

-- Concatenate the film names and length from the films table

select concat('[',name, "] : ", length_min) as total_info from films;

-- Extract the customers email from the 5th character onwards

select substring(email, 1, 5) from customers
limit 20

-- Select the customers first name in lower case and their last name in upper case for each customer with a last name of 'Smith'

select lower(first_name), upper(last_name) from customers
where last_name = 'Smith'
limit 20

-- Select the last 3 letters of each film name from the films table

select substring(name, -3) from films;

-- Concatenate the first three letters in the first_name and last_name columns together from the customers table

select concat(substring(first_name, 1, 3), substring(last_name, 1, 3)) from customers
limit 20;

select concat(left(first_name, 3), left(last_name, 3)) from customers
limit 20;


------------------------------   DATES   ------------------------------

select *, date(start_time) as date from screenings
limit 20;

select *, date(start_time) as date from screenings
where date(start_time) = '2017-10-03'

select *, date(start_time) as date,
day(start_time) as day,
month(start_time) as month,
year(start_time) as year from screenings
where date(start_time) = '2017-10-03'

select * from screenings
where date(start_time) between '2017-10-03' and '2017-10-05';


-- Select the film id and start time from the screenings table for the date of 20th of October 2017

select film_id, start_time from screenings
where date(start_time) = '2017-10-20';

-- Select all the data from the screenings table for the start time between the 6th and 13th of October 2017

-- #1

select film_id, date(start_time) from screenings
where
month(start_time) = 10
 and
year(start_time) = 2017
 and
day(start_time) >= 6 and day(start_time) <= 13

-- #2

select film_id, date(start_time) from screenings
where
month(start_time) = 10
 and
year(start_time) = 2017
 and
day(start_time) between 6 and 13

-- #3
select film_id, date(start_time) from screenings
where date(start_time) between '2017-10-06' and '2017-10-13'

-- Select all the data from the screenings table for October 2017.

select film_id, date(start_time) from screenings
where date(start_time) between '2017-10-01' and '2017-10-31'