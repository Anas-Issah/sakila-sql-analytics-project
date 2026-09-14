--Rank all customers according to their total spending and assign each
--customer a percentile.

SELECT c.customer_id , CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(p.amount) AS total_spent,
    PERCENT_RANK() OVER(ORDER BY SUM(p.amount)) AS spending_percentile
    FROM customer c 
    INNER JOIN payment p 
    ON c.customer_id = p.customer_id
    GROUP BY c.customer_id;