--Find film categories whose total revenue is greater than 
-- the average revenue across all categories

WITH category_revenue AS(
SELECT c.name AS category_name, sum(p.amount) total_revenue FROM category c
INNER JOIN film_category fc 
ON c.category_id = fc.category_id
INNER JOIN inventory i
ON fc.film_id = i.film_id
INNER JOIN rental r
ON i.inventory_id = r.inventory_id
INNER JOIN payment p 
ON r.rental_id = p.rental_id 
GROUP BY c.name
),
category_average_revenue AS (
    SELECT AVG(total_revenue) avg_revenue FROM category_revenue
)
SELECT category_name, total_revenue FROM category_revenue
WHERE total_revenue > (SELECT avg_revenue FROM category_average_revenue)
ORDER BY total_revenue DESC;