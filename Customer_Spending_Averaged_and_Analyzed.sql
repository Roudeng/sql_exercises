-- window function
-- Customer Spending, Averaged and Analyzed
-- Calculate Average Order Value Per Customer for Spending Insights
-- source: https://www.practicewindowfunctions.com/problem/5/customer-spending-averaged-and-analyzed

SELECT customerid, orderid, totalamount, AVG(totalamount) OVER (PARTITION BY customerid) AS averageordervalue FROM orders;

