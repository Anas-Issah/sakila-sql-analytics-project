-- For every customer, calculate the number of days between each rental and their previous rental
--ONLY RETURN ROWS WHERE PREVIOUS RENTAL EXISTS 

WITH customer_rental_history AS (
    SELECT customer_id,rental_id,rental_date::DATE,
        LAG(rental_date) OVER(PARTITION BY customer_id ORDER BY rental_date)::DATE AS previous_rental_date,
        rental_date::DATE - LAG(rental_date) OVER(PARTITION BY customer_id ORDER BY rental_date)::DATE AS days_since_previous_rental
        FROM rental
)
SELECT * FROM customer_rental_history WHERE days_since_previous_rental IS NOT NULL;