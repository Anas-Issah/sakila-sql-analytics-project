--Management wants to see the 10 longest movies in the inventory.
SELECT title,length FROM film
ORDER BY length DESC 
LIMIT 10;