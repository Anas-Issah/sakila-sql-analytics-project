--Management wants to know how much revenue rach film category generates

SELECT c.name AS category_name, SUM(p.amount) AS total_revenue
FROM category c
INNER JOIN film_category ct
ON c.category_id = ct.category_id
INNER JOIN film f
ON ct.film_id = f.film_id
INNER JOIN inventory i
ON f.film_id = i.film_id
INNER JOIN rental r
ON i.inventory_id = r.inventory_id
INNER JOIN payment p 
ON r.rental_id = p.rental_id
GROUP BY c.name 
ORDER BY total_revenue DESC; 