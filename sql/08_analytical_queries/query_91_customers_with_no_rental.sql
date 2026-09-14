--Find all customers who have never rented a film.

SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS customer_name
    FROM customer c 
    LEFT JOIN rental r 
    ON c.customer_id = r.customer_id
    WHERE r.customer_id IS NULL;