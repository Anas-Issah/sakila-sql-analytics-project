SELECT customer_id,customer_name,rental_count,total_spent,
    CASE
        WHEN rental_count > 15 and total_spent >= 100
                                THEN 'High Value'
        WHEN rental_count > 15 THEN 'Loyal'
        WHEN total_spent >= 100 THEN 'High Spender'
        WHEN rental_count > 5 THEN 'Regular'
        WHEN rental_count > 0 THEN 'Occasional'
        ELSE 'Inactive'
    END
        AS customer_segment
FROM customer_spending_summary;