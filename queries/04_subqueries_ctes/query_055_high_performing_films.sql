--Find films that have generated more than $100 in revenue 
--and have been rented at least 20 times

WITH film_details AS(
    SELECT film_id,title FROM film
),
film_rental_details AS(
    SELECT i.film_id, r.rental_id FROM inventory i 
    INNER JOIN rental r 
    ON i.inventory_id = r.inventory_id
),
film_payment_details AS(
    SELECT fd.film_id,fd.title,fr.rental_id,p.amount FROM film_details fd
    INNER JOIN film_rental_details fr
    ON fd.film_id = fr.film_id
    INNER JOIN payment p 
    ON fr.rental_Id = p.rental_id
)
SELECT fp.film_id,fp.title,COUNT(fp.rental_id) AS rental_count,SUM(fp.amount) AS total_revenue
FROM film_payment_details fp
GROUP BY fp.film_id, fp.title
HAVING COUNT(fp.rental_id) >= 20 AND SUM(fp.amount) > 100
ORDER BY total_revenue DESC;