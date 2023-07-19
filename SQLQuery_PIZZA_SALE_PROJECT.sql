select * from Pizza_Sales_

--------------------------------------------------TOTAL_REVENUE--------------------------------------------------------------------------------------------------

SELECT ROUND(SUM(total_price),2) AS TOTAL_REVENUE
FROM Pizza_Sales_


-------------------------------------------------AVERAGE_ORDER_VALUE--------------------------------------------------------


SELECT ROUND(SUM(TOTAL_PRICE)/COUNT(DISTINCT order_id),2) AS AVERAGE_VALUE FROM Pizza_Sales_


-------------------------------------------------TOTAL_PIZZA_SOLD---------------------------------------------------------------------------------------------------


SELECT SUM(QUANTITY) AS TOTAL_PIZZA_SOLD FROM Pizza_Sales_


----------------------------------------------------TOTAL_ORDERS----------------------------------------------------------------------


SELECT COUNT(DISTINCT order_id) AS TOTAL_ORDERS FROM Pizza_Sales_


----------------------------------------------AVERAGE_PIZZAS_PER_ORDER-----------------------------------------------------------------


SELECT SUM(QUANTITY)/COUNT(DISTINCT order_id) AS AVG_PIZZA_PER_ORDER FROM Pizza_Sales_


----------------------------------------------CHART_REQUIREMENTS------------------------------------------------------------------
--1. DAILY TRENDS FOR TOTAL ORDERS 


SELECT DATENAME(DW , order_date) AS ORDER_DAY ,
COUNT(DISTINCT order_id) AS TOTAL_ORDERS
FROM Pizza_Sales_
GROUP BY  DATENAME(DW , order_date)
ORDER BY TOTAL_ORDERS DESC


--2. HOURLY TRENDS FOR TOTAL ORDERS

SELECT DATEPART(HOUR , order_time) AS ORDER_HOURS , COUNT(DISTINCT order_id) AS ORDERS
FROM Pizza_Sales_
GROUP BY DATEPART(HOUR , order_time)
ORDER BY ORDER_HOURS

--3. PERCANTAGE OF SALES BY PIZZA CATEGORY

SELECT * FROM Pizza_Sales_

SELECT DISTINCT(PIZZA_CATEGORY) ,ROUND(SUM(TOTAL_PRICE) * 100 / (SELECT SUM(TOTAL_PRICE) FROM Pizza_Sales_),2) AS TOTAL_SALES
FROM Pizza_Sales_ 
GROUP BY pizza_category


--4. PERCENTAGE OF SALES BY PIZZA SIZE

SELECT DISTINCT(pizza_size) , ROUND(SUM(TOTAL_PRICE),2) AS TOTAL_SALES
FROM Pizza_Sales_
GROUP BY pizza_size
ORDER BY TOTAL_SALES DESC

--5. TOTAL PIZZA SOLD BY PIZZA CATEGORY

SELECT DISTINCT(pizza_category) , SUM(QUANTITY) AS TOTAL_PIZZA_SOLD 
FROM Pizza_Sales_
GROUP BY pizza_category
ORDER BY TOTAL_PIZZA_SOLD DESC

--6. TOP 5 BESTSELLER BY TOTAL PIZZAS SOLD

SELECT TOP 5 pizza_name , SUM(QUANTITY) AS TOTAL_PIZZAS_SOLD
FROM Pizza_Sales_
GROUP BY pizza_name 
ORDER BY TOTAL_PIZZAS_SOLD DESC

--7. BOTTOB 5 WORST SELLERS BY TOTAL PIZZAS SOLD

SELECT TOP 5 pizza_name , SUM(QUANTITY) AS TOTAL_PIZZAS_SOLD
FROM Pizza_Sales_
GROUP BY pizza_name 
ORDER BY TOTAL_PIZZAS_SOLD ASC

--
