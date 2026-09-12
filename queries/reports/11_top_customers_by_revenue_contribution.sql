SELECT customer_id,customer_name,
    total_spent,customer_rank,
    ROUND((total_spent/
            (SELECT SUM(total_spent)
                FROM customer_lifetime_value)
                ) * 100,2
                ) AS revenue_percentage
FROM customer_lifetime_value
;