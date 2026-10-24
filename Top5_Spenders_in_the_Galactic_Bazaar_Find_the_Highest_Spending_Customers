-- window function
-- Top 5 Spenders in the Galactic Bazaar
-- Find the Highest-Spending Customers by Total Order Value
-- source: https://www.practicewindowfunctions.com/problem/3/top-5-spenders-in-the-galactic-bazaar


SELECT customerid, totalspent, RANK() OVER (ORDER BY totalspent DESC) AS rank FROM (
SELECT customerid, SUM(totalamount) AS totalspent FROM orders
GROUP BY customerid
) AS c
LIMIT 5
