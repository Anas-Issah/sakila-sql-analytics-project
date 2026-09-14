--Management want a performance report for every film category

SELECT c.name,COUNT(DISTINCT ct.film_id) AS film_count,COUNT(r.rental_id) AS rental_count,
SUM(p.amount) AS total_revenue FROM category c 
INNER JOIN film_category ct 
ON c.category_id = ct.category_id
INNER JOIN inventory i 
ON ct.film_id = i.film_id
INNER JOIN rental r 
ON i.inventory_id = r.inventory_id 
INNER JOIN payment p 
ON r.rental_id = p.rental_id 
GROUP BY c.name 
ORDER BY total_revenue DESC;