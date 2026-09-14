--Calculate total revenue generated in each month

SELECT DATE_TRUNC('Month',payment_date) AS month, COUNT(*) AS payment_count,SUM(amount) 
    FROM payment
    GROUP BY DATE_TRUNC('Month',payment_date)
    ORDER BY month;