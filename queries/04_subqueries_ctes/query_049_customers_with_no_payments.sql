--Find customers who have never made a payment

SELECT customer_id,first_name,last_name FROM customer
WHERE customer_id NOT IN 
(SELECT customer_id FROM payment)
ORDER BY customer_id;