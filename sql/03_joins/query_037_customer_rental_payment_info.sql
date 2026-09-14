--Crete a report showing each customer's rental and payment information

SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
r.rental_id,p.payment_id,p.amount FROM customer c
INNER JOIN rental r 
ON c.customer_id = r.customer_id
INNER JOIN payment p
ON r.rental_id = p.rental_id
ORDER BY c.customer_id;