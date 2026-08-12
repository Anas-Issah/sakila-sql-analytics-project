--Management wants to know how many times each customer has rented a film.

SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
COUNT(r.*) AS rental_count FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY rental_count DESC;