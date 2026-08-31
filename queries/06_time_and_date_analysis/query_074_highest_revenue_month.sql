--Find the month with the highest total revenue

WITH monthly_totals AS (
    SELECT DATE_TRUNC('Month',payment_date) AS month,SUM(amount) AS total_revenue
    FROM payment
    GROUP BY DATE_TRUNC('Month',payment_date)
)
SELECT month,total_revenue FROM monthly_totals
    WHERE total_revenue = ( SELECT MAX(total_revenue) FROM monthly_totals);