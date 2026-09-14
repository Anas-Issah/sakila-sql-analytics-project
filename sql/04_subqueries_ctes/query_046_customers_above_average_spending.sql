--Find customers whose total spending is greater than the average
--spending of all customers

SELECT customer_id, total_spent
FROM (SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id) customer_totals
WHERE total_spent > (SELECT AVG(total_spent)
FROM ( SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id) totals)
ORDER BY total_spent DESC;