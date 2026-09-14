--Show each month's revenue and the revenue from the previous month

WITH monthly_totals AS (
    SELECT DATE_TRUNC('Month',payment_date) AS month,SUM(amount) AS total_revenue
    FROM payment
    GROUP BY DATE_TRUNC('Month',payment_date)
)
SELECT month,total_revenue,LAG(total_revenue) OVER(ORDER BY month) AS previous_revenue,
    total_revenue - LAG(total_revenue) OVER(ORDER BY month) AS revenue_change
    FROM monthly_totals;