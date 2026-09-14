--Show the rental history of each customer, including the film they rented

SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS customer_name,r.rental_id,f.title,r.rental_date
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
INNER JOIN inventory i
ON r.inventory_id = i.inventory_id
INNER JOIN film f
ON i.film_id = f.film_id
ORDER BY c.customer_id;