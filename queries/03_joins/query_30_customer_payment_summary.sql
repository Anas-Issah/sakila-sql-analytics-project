--Customer payment report showing each customer's name, number of payments, and total amount spent.

SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS customer_name,
COUNT(*) AS payment_count, SUM(p.amount) AS total_spent FROM customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id 
ORDER BY total_spent DESC;