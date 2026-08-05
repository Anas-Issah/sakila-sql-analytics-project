--Finance wants a summary of the company's payment transactions.

SELECT COUNT(*) AS total_payments,
SUM(amount) AS total_revenue,
AVG(amount) AS average_payment, MIN(amount) AS minimum_payment,
MAX(amount) AS maximum_payment FROM payment;  