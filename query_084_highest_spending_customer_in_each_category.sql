--For each category, find the customer who spent the most money renting films
-- in that category

WITH customer_spending AS (
    SELECT c.customer_id,i.film_id,fc.category_id,p.amount
    FROM customer c
    INNER JOIN payment p 
    ON c.customer_id = p.customer_id
    INNER JOIN rental r 
    ON r.rental_id = p.rental_id
    INNER JOIN inventory i 
    ON r.inventory_id = i.inventory_id
    INNER JOIN film_category fc
    ON i.film_id = fc.film_id
),
customer_category_spending_ranking AS(
    SELECT category_id,customer_id,SUM(amount) AS total_spent,
        ROW_NUMBER() OVER(PARTITION BY category_id ORDER BY SUM(amount) DESC) AS customer_rank
        FROM customer_spending
        GROUP BY category_id,customer_id
)
SELECT ct.name,cr.customer_id,CONCAT(first_name,' ',last_name) AS customer_name,
    cr.total_spent FROM customer_category_spending_ranking cr
    INNER JOIN customer c 
    ON cr.customer_id = c.customer_id
    INNER JOIN category ct
    ON cr.category_id = ct.category_id
    WHERE customer_rank = 1;

