--Find the highest spending customer in each store.

WITH customer_spending AS(
    SELECT c.store_id,c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
        SUM(p.amount) AS total_spent
        FROM customer c
        INNER JOIN payment p 
        ON c.customer_id = p.customer_id
        GROUP BY c.customer_id
),
store_ranking AS(
    SELECT store_id,customer_id,customer_name,total_spent,
        ROW_NUMBER() OVER(PARTITION BY store_id ORDER BY total_spent DESC) AS customer_ranking
        FROM customer_spending
)
SELECT store_id,customer_id,customer_name,total_spent
    FROM store_ranking
    WHERE customer_ranking = 1;
