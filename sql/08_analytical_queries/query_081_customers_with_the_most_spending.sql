--Find the 5 customers who have spent the most money

SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(p.amount) AS total_spent FROM customer c
    INNER JOIN payment p 
    ON c.customer_id = p.customer_id 
    GROUP BY c.customer_id
    ORDER BY total_spent DESC
    LIMIT 5;