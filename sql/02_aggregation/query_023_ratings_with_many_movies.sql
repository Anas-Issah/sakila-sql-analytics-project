-Which movie ratings contains more than 200 movies

SELECT rating, COUNT(*) AS film_count FROM film
GROUP BY rating
HAVING COUNT(*) > 200;
