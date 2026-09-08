--Find the top 10 films by total revenue

SELECT f.film_id,f.title,COUNT(r.*) AS rental_count,SUM(p.amount) AS total_renvenue,
    ROUND(SUM(p.amount)/COUNT(r.*),2) AS average_revenue_per_rental
    FROM film f 
    INNER JOIN inventory i 
    ON f.film_id = i.film_id 
    INNER JOIN rental r 
    ON i.inventory_id = r.inventory_id 
    INNER JOIN payment p 
    ON r.rental_id = p.rental_id
    GROUP BY f.film_id
    ORDER BY total_renvenue DESC;