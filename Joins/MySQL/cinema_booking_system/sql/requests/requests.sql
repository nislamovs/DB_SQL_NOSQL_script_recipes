-- Films list that are more than 2 hours long

select * from films
where length_min - 120 > 0


-- Film that had the most screenings in 2017

select f.*, count(sc.film_id) as count from films f
inner join screenings sc on f.id = sc.film_id
and year(sc.start_time) = 2017
group by f.name
order by count desc
limit 1

-- How many booking did the film 'Jigsaw' have in October 2017

-- #1
select f.name, count(*) as bookings from films f
inner join screenings sc on f.id=sc.film_id
inner join bookings b on sc.id=b.screening_id
where f.name = 'Jigsaw' and date(sc.start_time) between '2017-10-01' and '2017-10-31'
group by sc.film_id

-- #2

select count(*) as bookings_count from bookings
where screening_id IN (select id from screenings where film_id=5)

-- Which 5 customers made the most bookings in October 2017

select c.*, count(*) as booking_count from customers c
inner join bookings b on b.customer_id=c.id
group by c.email
order by booking_count desc
limit 5

-- Which film was shown in the Chaplin room most often in October 2017

select f.name, count(*) as screenings from films f
inner join screenings sc on f.id=sc.film_id
inner join rooms r on sc.room_id=r.id
where r.name = 'Chaplin'
and date(sc.start_time) between '2017-10-01' and '2017-10-31'
group by f.name
order by screenings desc
limit 1

-- How many of customers made a booking in October 2017

select count(distinct b.customer_id) as count from screenings sc
inner join bookings b on b.screening_id=sc.id
where date(sc.start_time) between '2017-10-01' and '2017-10-31'
limit 20