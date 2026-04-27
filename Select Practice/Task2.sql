SELECT
    first_name,
    last_name,
    email
FROM customer
WHERE email LIKE '%@sakilacustomer.org'
ORDER BY last_name