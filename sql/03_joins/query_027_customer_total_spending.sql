--How much each customer has spent showing
-- but want to see customer name including customer's id

SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS customer_name,
SUM(p.amount) AS total_spent FROM customer c
INNER JOIN payment p
ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;