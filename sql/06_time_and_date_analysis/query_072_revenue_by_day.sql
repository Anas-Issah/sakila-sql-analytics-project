--Calculate the total revenue generated on each day

SELECT DATE_TRUNC('Day',payment_date) AS day,COUNT(*) AS payment_count,
        SUM(amount) as total_revenue FROM payment
        GROUP BY DATE_TRUNC('Day',payment_date)
        ORDER BY day;