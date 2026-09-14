--Find customers whose total spending is greater than $100(USE LEFT JOIN)
SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS customer_name,
SUM(p.amount) AS total_spent FROM customer c
LEFT JOIN payment p 
ON p.customer_id = c.customer_id
GROUP BY c.customer_id
HAVING SUM(p.amount) > 100 ORDER BY total_spent DESC;