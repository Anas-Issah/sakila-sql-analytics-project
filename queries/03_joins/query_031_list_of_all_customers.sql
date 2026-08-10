--list of all customers including customers who have never made a payment
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
p.payment_id, p.amount FROM customer c
LEFT JOIN payment p
ON c.customer_id = p.customer_id
ORDER BY c.customer_id;