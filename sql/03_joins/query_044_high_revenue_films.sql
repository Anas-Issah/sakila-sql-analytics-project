--Find films that have generated more than $100 in revenue

SELECT f.film_id, f.title,SUM(p.amount) AS total_revenue
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id 
INNER JOIN rental r 
ON i.inventory_id = r.inventory_id
INNER JOIN payment p 
ON r.rental_id = p.rental_id 
GROUP BY f.film_id
HAVING SUM(p.amount) > 100
ORDER BY total_revenue DESC;