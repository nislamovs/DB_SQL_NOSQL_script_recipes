-- Find 5 oldest users
-- (we want to reward our users who have been around the longest)

select * from users
order by created_at asc
limit 5


-- What day of the week do most users register on?
-- (we need to figure out when to schedule an ad campaign)

select dayname(created_at) as day, count(*) as count from users
group by day
order by count desc
limit 1

-- Find a users who have never posted a photo
-- (we want to target our inactive users with an email campaign)

select u.id, u.username from users u
left join photos p on p.user_id=u.id
where p.image_url is null
limit 30

-- Who has max likes on a single photo - who won?
-- (we're running a new contest to see who can get the most likes on a single photo)

select u.username, count(*) as likes_per_photo from likes l
inner join photos p on p.id=l.photo_id
inner join users u on p.user_id=u.id
group by l.photo_id
order by likes_per_photo desc
limit 1

-- How many times does the average user post?
-- (Our investors want to know)

select
    (select count(*) from photos) / (select count(*) from users)
as average_posts_count_per_user

--  What are the top 5 most commonly used hashtags?
-- (A brand wants to know which hashtags to use in a post)

select tag_id, count(tag_id) as count from photo_tags pt
group by tag_id
order by count desc
limit 5

-- Find users who have liked every single photo on a site
-- (We have a small problem with bots on our site)

select l.user_id, count(user_id) as count from likes l
group by l.user_id
having count = (select count(*) from photos)
