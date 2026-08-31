--Find customers who have made at least one payment greater than $8

SELECT c.customer_id,c.first_name,c.last_name FROM customer c
WHERE EXISTS (SELECT 1 FROM payment p 
WHERE p.customer_id = c.customer_id AND p.amount > 8)
ORDER BY customer_id;