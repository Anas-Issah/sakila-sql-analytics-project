--Identify cutomers who have generated more than $150 in revenue

SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
SUM(p.amount) AS total_revenue FROM customer c 
INNER JOIN payment p 
ON c.customer_id = p.customer_id 
GROUP BY c.customer_id 
HAVING SUM(p.amount) > 150
ORDER BY total_revenue DESC;