-- Lag

SELECT
    productline,
    order_year,
    order_value,
    LAG(order_value, 1) OVER (
        PARTITION BY productLine
        ORDER BY order_year
    ) prev_year_order_value
FROM
    (
    SELECT productline,
           YEAR(orderDate) order_year,
           ROUND(SUM(quantityOrdered * priceEach),0) order_value
    FROM orders
    INNER JOIN orderdetails USING (orderNumber)
    INNER JOIN products USING (productCode)
    GROUP BY productline, order_year
) t2

-- Same as :


WITH productline_sales AS (
    SELECT productline,
           YEAR(orderDate) AS order_year,
           ROUND(SUM(quantityOrdered * priceEach),0) AS order_value
    FROM orders
    INNER JOIN orderdetails USING (orderNumber)
    INNER JOIN products USING (productCode)
    GROUP BY productline, order_year
)
SELECT
    productline,
    order_year,
    order_value,
    LAG(order_value, 1) OVER (
        PARTITION BY productLine
        ORDER BY order_year
    ) AS prev_year_order_value
FROM
    productline_sales;


    ------------------------------------------------------------------------------------------------------------

-- lead


SELECT
    customerName,
    orderDate,
    LEAD(orderDate,1) OVER (
        PARTITION BY customerNumber
        ORDER BY orderDate ) nextOrderDate
FROM
    orders
INNER JOIN customers USING (customerNumber);