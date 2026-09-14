--Find customers who have made at least one payment

SELECT customer_id,first_name,last_name FROM customer 
WHERE customer_id IN
(SELECT customer_id FROM payment)
ORDER BY customer_id;