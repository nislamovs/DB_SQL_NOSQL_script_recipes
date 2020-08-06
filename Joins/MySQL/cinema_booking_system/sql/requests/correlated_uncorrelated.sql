-- Noncorrelated subqueries in where clause

SELECT id, start_time FROM screenings
WHERE film_id IN
    (SELECT id FROM films
     WHERE length_min > 120)

SELECT * FROM films;
SELECT * FROM screenings;


---------------------------

SELECT * FROM customers
 WHERE id IN
 (SELECT customer_id FROM bookings
  WHERE screening_id = 1);



-- Noncorrelated subqueries in from

select * from reserved_seat;

select MAX(no_seats) from
(select booking_id, COUNT(seat_id) AS no_seats from  reserved_seat
group by booking_id) b;                                                         -- where b is derive table


select AVG(no_seats), MAX(no_seats) from
(select booking_id, COUNT(seat_id) AS no_seats from  reserved_seat
group by booking_id) b;                                                         -- where b is derive table



-- Correlated subquery - inner query can't run independently from outer query

select screening_id, customer_id
(select count(seat_id)
from reserver_seat where booking_id = b.id)
from booking b order by screening_id;



-- Selecting the film name and length for all films with a length greater than the average film length

select * from films;

select f.name, f.length_min
from films f
where f.length_min > (select AVG(length_min) from films);

-- Selecting the maximum number and the minimum number of screenings for a particular film

-- #1

select MIN(sc.count) as MIN, MAX(sc.count) as MAX from            -- works
(select film_id, count(*) as count from screenings
group by film_id) sc;


select film_id, count(*) as count from screenings
group by film_id
having count in
(select MIN(sc.count) as min from (
    select film_id, count(*) as count from screenings
    group by film_id
    order by count asc
) sc)
or count in
(select MAX(sc2.count) as max from (
    select film_id, count(*) as count from screenings
    group by film_id
    order by count asc
) sc2)


-- #2

(select f.id, f.name, count(*) as count from films f
inner join screenings sc
on sc.film_id=f.id
group by f.name
order by count asc
limit 1)
UNION
(select f.id, f.name, count(*) as count from films f
inner join screenings sc
on sc.film_id=f.id
group by f.name
order by count desc
limit 1)

-- #3



-- Selecting each film name and the number of screenings for that film

-- #1

select f.id, f.name, sc.count  from films f
inner join
    (select film_id, count(*) as count from screenings
    group by film_id
    order by count asc) sc
on sc.film_id=f.id

-- #2

select f.id, f.name, count(*) from films f
inner join screenings sc
on sc.film_id=f.id
group by name
order by f.id
limit 20;

-- #3
select name,
(select count(id) from screenings
where film_id = f.id)
from films f

------------------------------------------------------------------------------------------------------------








