--Create a report showing
--category_name
--film_count
--rental_count
--total_revenue
--average_revenue_per_rental

WITH film_revenue AS (
    SELECT i.film_id,sum(p.amount) AS total_revenue,COUNT(r.*) AS rental_count FROM rental r
    LEFT JOIN payment p 
    ON p.rental_id = r.rental_id
    INNER JOIN inventory i 
    ON r.inventory_id = i.inventory_id
    GROUP BY i.film_id
    ),
category_revenue AS(
    SELECT c.category_id,COUNT(DISTINCT fv.film_id) AS film_count,c.name,SUM(fv.total_revenue) AS total_revenue,
    SUM(fv.rental_count) AS rental_count FROM category c
    INNER JOIN film_category fc 
    ON c.category_id = fc.category_id 
    INNER JOIN film_revenue fv 
    ON fc.film_id = fv.film_id
    GROUP BY c.category_id
)

SELECT name,film_count,rental_count,total_revenue,
            total_revenue/rental_count AS average_revenu_per_rental FROM category_revenue
            ORDER BY rental_count DESC;