--For each film category, identify the customers who generated the most
-- the most revenue in that category

WITH film_sums AS (SELECT i.film_id,r.customer_id,SUM(p.amount) AS amount FROM inventory i
INNER JOIN rental r
ON i.inventory_id = r.inventory_id
INNER JOIN payment p
ON r.rental_id = p.rental_id
GROUP BY i.film_id,r.customer_id
ORDER BY r.customer_id),

customer_sums AS (SELECT fc.category_id,fs.customer_id,fs.amount FROM film_category fc
INNER JOIN film_sums fs
ON fc.film_id = fs.film_id order by amount),

category_sums AS (
SELECT category_id, MAX(amount) AS amount FROM customer_sums
 GROUP BY category_id),
 
highest_spent_per_category AS (SELECT  cs.category_id,cm.customer_id,cs.amount FROM category_sums cs
LEFT JOIN customer_sums cm
ON cs.amount = cm.amount)

SELECT name,customer_id,amount FROM
 (
SELECT c.name, hc.customer_id,MAX(hc.amount) AS amount,
ROW_NUMBER() OVER(PARTITION  BY c.name) AS row_num 
FROM highest_spent_per_category hc
INNER JOIN category c
ON hc.category_id = c.category_id
GROUP BY c.name,hc.customer_id) temp_tb
WHERE temp_tb.row_num = 1;
