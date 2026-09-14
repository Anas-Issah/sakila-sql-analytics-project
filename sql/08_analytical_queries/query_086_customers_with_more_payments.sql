--Find customers who have made more than 5 payments

SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    COUNT(p.*) AS payment_count,SUM(p.amount) AS total_spent 
    FROM customer c
    INNER JOIN payment p 
    ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
    HAVING COUNT(p.*) > 5
    ORDER BY payment_count DESC; 