--Find films whose length is greater than the average film legnth

SELECT film_id, title, length FROM film
WHERE length > (SELECT AVG(length) FROM film)
ORDER BY length DESC;