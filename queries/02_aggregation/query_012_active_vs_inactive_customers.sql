--How many customers are active vs how many are inactive

SELECT active,COUNT(*) AS customer_count
FROM customer
GROUP BY active
ORDER BY active;