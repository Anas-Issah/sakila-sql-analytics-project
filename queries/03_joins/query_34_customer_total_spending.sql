--A report showing every customer and their total spending

SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS customer_name,
COALESCE(SUM(p.amount),0) AS total_spent FROM customer c
LEFT JOIN payment p 
ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;