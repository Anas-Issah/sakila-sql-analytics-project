--Number of films in each category

SELECT c.name, COUNT(*) AS film_count FROM category c
INNER JOIN film_category fc
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY film_count DESC;