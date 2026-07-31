--The inventory manager wants to identify movies that take a long time to watch.
SELECT f.title,f.length FROM film f
WHERE f.length > 180;