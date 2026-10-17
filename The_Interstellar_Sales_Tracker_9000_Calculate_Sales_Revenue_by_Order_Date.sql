-- window function
-- The Interstellar Sales Tracker 9000
-- Calculate Running Totals of Product Sales Revenue by Order Date
-- source: https://www.practicewindowfunctions.com/problem/2/the-interstellar-sales-tracker-9000

SELECT o2.productid, o2.orderid, o1.ordertimestamp, SUM(product_price) OVER (
    PARTITION BY o2.productid
    ORDER BY o1.ordertimestamp, o2.orderid, o2.orderdetailid
    )
    AS runningtotal FROM orders AS o1
JOIN (
    SELECT *, (quantity * unitprice) AS product_price FROM orderdetails
    ) AS o2
ON o1.orderid = o2.orderid
ORDER BY o2.productid, o1.ordertimestamp, o2.orderid, o2.orderdetailid