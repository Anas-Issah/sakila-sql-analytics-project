-- Find films whose total revenue is greater than the average revenue of all films

WITH film_revenue AS (
    SELECT f.film_id,f.title,SUM(p.amount) AS total_renvenue
        FROM film f 
        INNER JOIN inventory i 
        ON f.film_id = i.film_id 
        INNER JOIN rental r 
        ON i.inventory_id = r.inventory_id
        INNER JOIN payment p 
        ON r.rental_id = p.rental_id
        GROUP BY f.film_id
),
average_revenue AS (
    SELECT AVG(total_renvenue) AS avg_revenue
        FROM film_revenue
),
film_revenue_with_diff AS(
    SELECT film_id,title,total_renvenue,
        (SELECT avg_revenue FROM average_revenue) AS average_revenue,
        total_renvenue - (SELECT avg_revenue FROM average_revenue) AS difference_from_average
        FROM film_revenue
)
SELECT * FROM film_revenue_with_diff
    WHERE total_renvenue > (SELECT avg_revenue FROM average_revenue)
    ORDER BY total_renvenue DESC;