WITH most_rentend_film AS(
    SELECT f.title,
    ROW_NUMBER() OVER(ORDER BY COUNT(r.rental_id) DESC) AS rank
    FROM film f 
    INNER JOIN inventory i 
    ON f.film_id = i.film_id 
    INNER JOIN rental r 
    ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id
),
highest_revenue_film AS(
    SELECT f.title,
        ROW_NUMBER() OVER(ORDER BY SUM(p.amount) DESC) AS rank
    FROM film f 
    INNER JOIN inventory i 
    ON f.film_id = i.film_id 
    INNER JOIN rental r 
    ON i.inventory_id = r.inventory_id
    INNER JOIN payment p 
    ON r.rental_id = p.rental_id
    GROUP BY f.film_id 
)
SELECT
    (SELECT COUNT(film_id) FROM film) AS total_films,
    (SELECT COUNT(rental_id) FROM rental) AS total_rentals,
    (SELECT SUM(amount) FROM payment) AS total_revenue,
    ROUND((SELECT COUNT(rental_id) FROM rental)/(SELECT COUNT(film_id) FROM film)::NUMERIC,2)
        AS average_rental_per_film,
    ROUND((SELECT SUM(amount) FROM payment)/(SELECT COUNT(film_id) FROM film)::NUMERIC,2)
        AS average_revenue_per_film,
    (SELECT title FROM most_rentend_film WHERE rank = 1) AS most_rented_film,
    (SELECT title FROM highest_revenue_film WHERE rank = 1) AS highest_revenue_film
    ;

    
    