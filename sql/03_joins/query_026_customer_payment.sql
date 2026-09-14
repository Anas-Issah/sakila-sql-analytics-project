--Show each customer payment along with the customer's first and last name

SELECT p.payment_id,p.customer_id,c.first_name,c.last_name,p.amount
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
ORDER BY p.amount DESC; 