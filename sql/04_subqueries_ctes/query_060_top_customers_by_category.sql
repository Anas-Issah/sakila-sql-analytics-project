--For each film category, identify the customers who generated the most
-- the most revenue in that category

WITH customer_category_spent AS (SELECT fc.category_id,r.customer_id,SUM(p.amount) AS amount
    FROM film_category fc
    INNER JOIN inventory i
    ON fc.film_id = i.film_id
    INNER JOIN rental r
    ON i.inventory_id = r.inventory_id
    INNER JOIN payment p 
    ON r.rental_id = p.rental_id 
    GROUP BY fc.category_id,r.customer_id 
),
category_max_revenue AS(
    SELECT category_id,MAX(amount) AS max_amount FROM customer_category_spent
    GROUP BY category_id
)
SELECT c.name AS category_name,ccs.customer_id,ccs.amount AS total_revenue 
FROM customer_category_spent ccs
INNER JOIN category c 
ON ccs.category_id = c.category_id
INNER JOIN category_max_revenue cmr 
ON ccs.category_id = cmr.category_id 
AND ccs.amount = cmr.max_amount
ORDER BY total_revenue DESC; 