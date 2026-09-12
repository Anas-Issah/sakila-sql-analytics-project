--CATEGORY REVENUE SUMMARY
CREATE OR REPLACE VIEW category_revenue_summary AS 
    WITH film_totals AS (
        SELECT f.film_id,COUNT(r.rental_id) AS rental_count,
            SUM(p.amount) AS total_film_revenue
        FROM film f 
        LEFT JOIN inventory i 
        ON f.film_id = i.film_id 
        LEFT JOIN rental r 
        ON i.inventory_id = r.inventory_id
        LEFT JOIN payment p
        ON r.rental_id = p.rental_id
        GROUP BY f.film_id
    ),
    category_totals AS(
        SELECT c.category_id,c.name,COUNT(ft.film_id) AS film_count,
            SUM(ft.rental_count) AS rental_count,SUM(ft.total_film_revenue) AS total_revenue,
            AVG(ft.total_film_revenue) AS average_revenue_per_film
        FROM category c
        INNER JOIN film_category fc
        ON c.category_id = fc.category_id 
        INNER JOIN film_totals ft 
        ON fc.film_id = ft.film_id
        GROUP BY c.category_id
    ) 
    SELECT * FROM category_totals;

