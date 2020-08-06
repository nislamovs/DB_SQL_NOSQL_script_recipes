

select customer_id, screening_id, count(id) as count from bookings
group by customer_id, screening_id;


select f.name as film_name, s.start_time, c.first_name, c.last_name, count(b.id) from films f
join screenings s on f.id=s.film_id
join bookings b on s.id=b.screening_id
join customers c on b.customer_id=c.id
group by f.name, c.last_name, c.first_name, s.start_time
order by s.start_time


select customer_id, screening_id, count(id) as count from bookings
group by customer_id, screening_id
having customer_id = 10

-- How many books did customer id 10 make in October 2017

select count(*) as booking_count from screenings sc
inner join bookings b on b.screening_id=sc.id
where b.customer_id = 10 and date(sc.start_time) between '2017-10-01' and '2017-10-31'
limit 20

-- Count the number of screenings for Blade Runner 2049 in October 2017

select count(*) as screening_count from screenings sc
inner join films f on f.id=sc.film_id
where f.name = 'Blade Runner 2049'
and date(sc.start_time) between '2017-10-01' and '2017-10-31'
limit 20

-- Count the number of unique customers who made a booking for October 2017

select count(distinct b.customer_id) as customer_count from bookings b
inner join screenings sc on b.screening_id=sc.id
where date(sc.start_time) between '2017-10-01' and '2017-10-31'

-- Select the customer id and count the number of reserved seats grouped by customer for October 2017

select c.id as customer_id, count(c.id) as count from customers c
inner join bookings b on b.customer_id=c.id
inner join reserved_seat rs on rs.booking_id=b.id
inner join screenings sc on b.screening_id=sc.id
where date(sc.start_time) between '2017-10-01' and '2017-10-31'
group by c.id

-- Select the film name and count the number of screenings for each film that is over 2 hours long

select f.name as film_name, f.length_min as length, count(sc.id) as count from films f
inner join screenings sc on f.id=sc.film_id
where f.length_min > 120
group by f.name
limit 20