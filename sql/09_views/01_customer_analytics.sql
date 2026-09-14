--CUSTOMER SPENDIG SUMMARY

CREATE OR REPLACE VIEW customer_spending_summary AS
    SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,COUNT(r.rental_id) AS rental_count,
        SUM(p.amount) AS total_spent, AVG(p.amount) AS average_payment
    FROM customer c 
    LEFT JOIN rental r 
    ON c.customer_id = r.customer_id
    LEFT JOIN payment p 
    ON r.rental_id = p.rental_id
    GROUP BY c.customer_id;


--CUSTOMER RENTAL SUMMARY
CREATE OR REPLACE VIEW customer_rental_summary AS
    SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
        COUNT(r.rental_id) AS rental_count,
        MIN(r.rental_date) AS first_rental_date,MAX(r.rental_date) AS last_rental_date,
        MAX(r.rental_date)::DATE - MIN(r.rental_date)::DATE AS active_days
    FROM customer c
    LEFT JOIN rental r 
    ON c.customer_id = r.customer_id
    GROUP BY c.customer_id;

--CUSTOMER RETENTION SUMMARY
CREATE OR REPLACE VIEW customer_retention_summary AS
    SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
        COUNT(r.rental_id) AS rental_count,
        CASE 
            WHEN COUNT(r.rental_id) > 15 THEN 'Loyal'
            WHEN COUNT(r.rental_id) > 5 THEN 'Regular'
            WHEN COUNT(r.rental_id) > 0 THEN 'Occasional'
            ELSE 'Inactive'
        END
            AS customer_status
    FROM customer c 
    LEFT JOIN rental r 
    ON c.customer_id = r.customer_id
    GROUP BY c.customer_id;

--CUSTOMER LIFETIME VALUE
CREATE OR REPLACE VIEW customer_lifetime_value AS
    SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,COUNT(r.rental_id) AS rental_count,
        SUM(p.amount) AS total_spent, AVG(p.amount) AS average_payment,
        ROW_NUMBER() OVER(ORDER BY SUM(p.amount) DESC) AS customer_rank
    FROM customer c 
    LEFT JOIN rental r 
    ON c.customer_id = r.customer_id
    LEFT JOIN payment p 
    ON r.rental_id = p.rental_id
    GROUP BY c.customer_id;