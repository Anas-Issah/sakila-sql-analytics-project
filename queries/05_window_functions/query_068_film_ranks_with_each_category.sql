--Rank films within their respective categories based on rental count.

WITH film_rental_count AS (
    SELECT i.film_id,COUNT(r.*) AS rental_count FROM inventory i
    INNER JOIN rental r 
    ON i.inventory_id = r.inventory_id
    GROUP BY i.film_id
)
SELECT c.name AS category_name,fr.film_id,fr.rental_count,
    RANK() OVER(PARTITION BY c.name ORDER BY fr.rental_count DESC) AS film_rank
    FROM film_rental_count fr
    INNER JOIN film_category fc
    ON fr.film_id = fc.film_id
    INNER JOIN category c
    ON fc.category_id = c.category_id;