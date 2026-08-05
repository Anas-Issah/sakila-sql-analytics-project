--How many of films are available in each category
SELECT rating, COUNT(rating) AS film_count
FROM film
GROUP BY rating
ORDER BY film_count;