--customer spending summary
    --Who are the highest-value customers?
    --How many payments has each customer made?
    --How much has each customer spent?
    --What is their average payment?


CREATE OR REPLACE VIEW customer_spending_summary AS
    SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,COUNT(r.*) AS rental_count,
        SUM(p.amount) AS total_spent, AVG(p.amount) AS average_payment,
    FROM customer c 
    INNER JOIN rental r 
    ON c.customer_id = r.customer_id
    INNER JOIN payment p 
    ON r.rental_id = p.rental_id
    GROUP BY c.customer_id
    ORDER BY total_spent DESC;