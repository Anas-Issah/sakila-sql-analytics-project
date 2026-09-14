-- For every film category, calculate the average revenue generated per film, 
-- then identify the category with the highest average.


WITH film_total_revenue AS (
    SELECT f.film_id,SUM(p.amount) AS total_renvenue
    FROM film f
    INNER JOIN inventory i
    ON f.film_id = i.film_id 
    INNER JOIN rental r 
    ON r.inventory_id = i.inventory_id
    INNER JOIN payment p 
    ON r.rental_id = p.rental_id
    GROUP by f.film_id
),
category_revenue AS(
    SELECT fc.category_id,AVG(fr.total_renvenue) AS average_film_revenue
        FROM film_total_revenue fr
        INNER JOIN film_category fc
        ON fr.film_id = fc.film_id
        GROUP BY fc.category_id
)
SELECT c.name,cr.average_film_revenue FROM category_revenue cr 
    INNER JOIN category c
    ON cr.category_id = c.category_id
    WHERE cr.average_film_revenue = (SELECT MAX(average_film_revenue) 
                                        FROM category_revenue);