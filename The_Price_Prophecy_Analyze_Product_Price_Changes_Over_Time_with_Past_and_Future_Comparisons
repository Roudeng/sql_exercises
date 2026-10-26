-- window function
-- Two Orders Before, Two Orders After: The Price Prophecy
-- Analyze Product Price Changes Over Time with Past and Future Comparisons
-- source: https://www.practicewindowfunctions.com/problem/4/two-orders-before-two-orders-after-the-price-prophecy
-- LAG(column, offset) OVER () 取前幾列, offset 預設為 1
-- LEAD(column, offset) OVER () 取後幾列, offset 預設為 1

SELECT d.productid, d.orderid, o.ordertimestamp, d.quantity, d.unitprice,
 LAG(d.unitprice, 2) OVER (PARTITION BY d.productid ORDER BY o.ordertimestamp, o.orderid, d.orderdetailid) AS pastprice,
 LEAD(d.unitprice, 2) OVER (PARTITION BY d.productid ORDER BY o.ordertimestamp, o.orderid, d.orderdetailid) AS
futureprice
FROM orderdetails AS d
JOIN orders AS o
ON d.orderid = o.orderid


