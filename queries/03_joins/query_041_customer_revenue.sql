--Managemet wants a report showing how much each customers has generated

SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
COUNT(*) AS payment_count, SUM(p.amount) AS total_revenue
FROM customer c
INNER JOIN payment p 
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_revenue DESC;