-- Lab | My first queries
-- 1. Which are the different genres?
SELECT DISTINCT prime_genre FROM data;

-- 2. Which is the genre with more apps rated?
SELECT prime_genre, SUM(rating_count_tot) AS total FROM data
GROUP BY prime_genre
ORDER BY total DESC
LIMIT 1;
-- 3. Which is the genre with more apps?
SELECT prime_genre, COUNT(*) AS total FROM data
GROUP BY prime_genre
ORDER BY total DESC
LIMIT 1;

-- 4. Which is the one with less?
SELECT prime_genre, COUNT(*) AS total_apps FROM data
GROUP BY prime_genre
ORDER BY total_apps ASC
LIMIT 1;

-- 5. Take the 10 apps most rated.
SELECT track_name, rating_count_tot FROM data
ORDER BY rating_count_tot DESC
LIMIT 10;

-- 6. Take the 10 apps best rated by users.
SELECT track_name, user_rating, rating_count_tot FROM data
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10;

-- 7. Take the mean rate between the 10 apps most rated.
SELECT track_name, user_rating, rating_count_tot FROM data
ORDER BY rating_count_tot DESC
LIMIT 10;
-- Don't we need a subquery for this? The mean (by hand is 4.35)

-- 8. Take the mean rate between the 10 apps best rated.
SELECT track_name, user_rating, rating_count_tot FROM data
ORDER BY user_rating DESC
LIMIT 10;

-- The mean is 5 because all values are 5

-- 9. What do you see here?


-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
-- We can create a KPI that considers both. For example rating/number of ratings and the do the TOP3 but we have reading only rights so we can't create a new variable. We can also order by both variables
SELECT * FROM data
ORDER BY rating_count_tot DESC, user_rating DESC
LIMIT 3;

-- I'd like to do this but it's not working :(
-- SELECT track_name, user_rating, (user_rating/rating_count_tot)*sum(rating_count_tot) as 'weighted_rating' FROM data
-- ORDER BY weighted_rating DESC
-- LIMIT 3;

-- 11. Does people care about the price?
SELECT price, COUNT(*) AS total_price FROM data
GROUP BY price
ORDER BY total_price DESC;

-- Yes, most of the APPs are free, we can assume this is a market response.


