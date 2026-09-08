--Classify every customer based on their number of rentals

SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    COUNT(r.*) AS rental_count,
    CASE 
        WHEN COUNT(r.*) > 30 THEN 'Very High'
        WHEN COUNT(r.*) > 20 THEN 'High'
        WHEN COUNT(r.*) > 10 THEN 'Medium'
        ELSE 'Low'
    END 
        AS customer_segment
    FROM customer c 
    INNER JOIN rental r 
    ON c.customer_id = r.customer_id 
    GROUP BY c.customer_id
    ORDER BY rental_count DESC;