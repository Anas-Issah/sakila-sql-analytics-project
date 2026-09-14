SELECT customer_id,customer_name,total_spent,
    NTILE(10) OVER(ORDER BY total_spent DESC) AS revenue_decile
FROM customer_lifetime_value;