--Find all films that have never been rented.

SELECT i.film_id,f.title,f.replacement_cost FROM film f
    LEFT JOIN inventory i
    ON f.film_id = i.film_id 
    LEFT JOIN rental r 
    ON i.inventory_id = r.inventory_id
    WHERE r.rental_id IS NULL
    ORDER BY title;