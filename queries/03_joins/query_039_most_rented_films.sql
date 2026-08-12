--which film have been rented the most?

SELECT f.film_id, f.title,COUNT(r.*) AS rental_count FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
INNER JOIN rental r
ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY rental_count DESC;