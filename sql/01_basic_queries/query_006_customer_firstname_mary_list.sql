--Find all customers whose first name is "Mary".
SELECT customer_id,first_name,last_name,email FROM customer
WHERE first_name LIKE 'Mary';