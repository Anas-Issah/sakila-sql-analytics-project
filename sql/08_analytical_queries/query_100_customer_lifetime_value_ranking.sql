--create a customer lifetime value report
--For ever customer, calculate:
--customer_id
--customer_name
--rental_count
--total_spent
--average_payment
--customer_rank

SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,COUNT(r.*) AS rental_count,
    SUM(p.amount) AS total_spent, AVG(p.amount) AS average_payment,
    ROW_NUMBER() OVER(ORDER BY SUM(p.amount) DESC) AS customer_rank
    FROM customer c 
    INNER JOIN rental r 
    ON c.customer_id = r.customer_id
    INNER JOIN payment p 
    ON r.rental_id = p.rental_id
    GROUP BY c.customer_id
    LIMIT 10;