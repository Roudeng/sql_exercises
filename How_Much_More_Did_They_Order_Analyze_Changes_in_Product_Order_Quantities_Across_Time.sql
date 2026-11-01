-- window function
-- How Much More Did They Order?
-- Analyze Changes in Product Order Quantities Across Time
-- source: https://www.practicewindowfunctions.com/problem/6/how-much-more-did-they-order


-- solution 1: two LAG()
SELECT ord.productid, ord.orderid, o1.ordertimestamp, ord.quantity, 
    LAG(ord.quantity) OVER (PARTITION BY ord.productid ORDER BY o1.ordertimestamp, o1.orderid, ord.orderdetailid) AS previousquantity, 
    (ord.quantity - (LAG(ord.quantity) OVER (PARTITION BY ord.productid ORDER BY o1.ordertimestamp, o1.orderid, ord.orderdetailid))) AS quantitychange
FROM orders AS o1
JOIN orderdetails AS ord
ON o1.orderid = ord.orderid;


-- solution 2: CTE
WITH order_with_previous AS (
    SELECT ord.productid, ord.orderid, o1.ordertimestamp, ord.quantity, 
    LAG(ord.quantity) OVER (PARTITION BY ord.productid ORDER BY o1.ordertimestamp, o1.orderid, ord.orderdetailid) AS previousquantity
    FROM orders AS o1
    JOIN orderdetails AS ord
    ON o1.orderid = ord.orderid
)

SELECT productid, 
       orderid, 
       ordertimestamp, 
       quantity, 
       previousquantity, 
       (quantity - previousquantity) AS quantitychange
FROM order_with_previous;


