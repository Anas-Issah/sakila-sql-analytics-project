--Calculate how much revenue each film category generated and what percentage of total revenue each category represents.

WITH category_totals AS (
    SELECT c.category_id ,SUM(p.amount) AS total_revenue
        FROM category c 
        INNER JOIN film_category fc 
        ON c.category_id = fc.category_id
        INNER JOIN inventory i 
        ON fc.film_id = i.film_id
        INNER JOIN rental r 
        ON i.inventory_id = r.inventory_id 
        INNER JOIN payment p 
        ON r.rental_id = p.rental_id
        GROUP BY c.category_id
)
SELECT c.name,ct.total_revenue,
                    ROUND((ct.total_revenue::NUMERIC / (SELECT sum(total_revenue) FROM category_totals)) * 100,2) AS revenue_percentage
    FROM category_totals ct
    INNER JOIN category c 
    ON ct.category_id = c.category_id
    ORDER BY total_revenue DESC;