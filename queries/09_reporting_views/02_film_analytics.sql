
--FILM PERFORMANCE SUMMARY
CREATE OR REPLACE VIEW film_performance_summary AS
    SELECT f.film_id,f.title,COUNT(r.rental_id) AS rental_count,SUM(p.amount) AS total_revenue,
        ROUND(SUM(p.amount)/COUNT(r.rental_id),2) AS average_revenue_per_rental
    FROM film f 
    LEFT JOIN inventory i 
    ON f.film_id = i.film_id 
    LEFT JOIN rental r 
    ON i.inventory_id = r.inventory_id 
    LEFT JOIN payment p 
    ON r.rental_id = p.rental_id
    GROUP BY f.film_id;


--FILM RENTAL PERFORMANCE
CREATE OR REPLACE VIEW film_rental_performance AS
    SELECT f.film_id, f.title, COUNT(r.rental_id) AS rental_count,
        SUM(p.amount) AS total_revenue,
        f.rental_rate rental_rate,
        COALESCE(
            ROUND(SUM(p.amount)/NULLIF(COUNT(r.rental_id),0),2)
         ) AS revenue_per_rental
    FROM film f
    LEFT JOIN inventory i 
    ON f.film_id = i.film_id
    LEFT JOIN rental r 
    ON i.inventory_id = r.inventory_id
    LEFT JOIN payment p
    ON r.rental_id = p.rental_id
    GROUP BY f.film_id;
