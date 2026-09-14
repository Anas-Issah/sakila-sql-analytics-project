--Create a report showing each film's number of rentals and total revenue

WITH film_details AS (
    SELECT film_id, title FROM film
),
film_rental_details AS(
    SELECT i.film_id, r.rental_id FROM rental r
    INNER JOIN inventory i
    ON r.inventory_id = i.inventory_id
),
payment_details AS(
    SELECT fd.film_id,fd.title,fr.rental_id,p.amount FROM film_rental_details fr
    INNER JOIN film_details fd 
    ON fr.film_id = fd.film_id
    INNER JOIN payment p
    ON fr.rental_id = p.rental_id
)
SELECT pd.film_id,pd.title,COUNT(pd.rental_id) AS rental_count,SUM(pd.amount) AS total_revenue from payment_details pd
GROUP BY pd.film_id,pd.title
ORDER BY total_revenue DESC;