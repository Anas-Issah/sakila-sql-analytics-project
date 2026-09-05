-- Find the 10 customers who have rented the most films

WITH customer_rental AS(
    SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    COUNT(r.*) AS rental_count
    FROM customer c
    INNER JOIN rental r
    ON r.customer_id = c.customer_id
    GROUP BY c.customer_id
),
customer_payments AS(
    SELECT customer_id, SUM(amount) AS total_spent
    FROM payment
    GROUP BY customer_id
)
SELECT cr.customer_id,cr.customer_name,cr.rental_count,
    cp.total_spent FROM customer_rental cr
    INNER JOIN customer_payments cp 
    ON cr.customer_id = cp.customer_id
    ORDER BY rental_count DESC, total_spent DESC
    LIMIT 10;