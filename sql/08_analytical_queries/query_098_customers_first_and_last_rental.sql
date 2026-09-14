-- For every customer, find their first rental date and most recent rental date

SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    MIN(r.rental_date)::DATE AS first_rental_date,MAX(r.rental_date)::DATE AS last_rental_date,
    MAX(r.rental_date)::DATE - MIN(r.rental_date)::DATE AS days_as_customer
    FROM customer c
    INNER JOIN rental r 
    ON c.customer_id = r.customer_id
    GROUP BY c.customer_id
    ORDER BY days_as_customer DESC;