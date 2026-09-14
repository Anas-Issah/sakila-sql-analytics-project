--Find customers who have made at least one payment(USE LEFT JOIN)

SELECT DISTINCT c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS customer_name
FROM customer c
LEFT JOIN payment p 
ON c.customer_id = p.customer_id
WHERE p.payment_id IS NOT NULL
ORDER BY c.customer_id;