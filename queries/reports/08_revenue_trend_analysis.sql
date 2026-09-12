SELECT DATE_TRUNC('MONTH',r.rental_date)::DATE AS month,
    COUNT(r.rental_id) AS total_rentals,SUM(p.amount)AS total_revenue,
    ROUND(SUM(p.amount)/COUNT(r.rental_id)::NUMERIC,2)
                            AS average_revenue_per_rental
FROM rental r 
LEFT JOIN payment p 
ON r.rental_id = p.rental_id 
GROUP BY DATE_TRUNC('MONTH',r.rental_date)
ORDER BY month;
 