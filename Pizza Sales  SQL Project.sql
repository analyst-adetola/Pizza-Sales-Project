SELECT *
FROM Pizza;
    

-- TOTAL REVENUE GENERATED--
SELECT ROUND(SUM(total_price), 2) 'Total Revenue'
FROM pizza;
-- (The total revenue generated is £817,860.05) 


-- AVERAGE ORDER VALUE 
SELECT SUM(Total_price) / COUNT(DISTINCT order_id) AS 'Avg. Order Value'
FROM pizza;
-- (The Average order value is £38.31)

-- TOTAL PIZZA SOLD
SELECT SUM(quantity) "Total Pizza Sold"
FROM Pizza;
-- (Total pizza sold is 49,574)


-- TOTAL ORDER
SELECT COUNT(DISTINCT Order_id)
FROM pizza;
-- (Total Order is 21,350).

-- AVERAGE PIZZA PER ORDER
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2)
FROM pizza;
-- (The Avg. Pizza per oder is 2.32)

-- DAILY TREND FOR ORDERS--
SELECT dayname(order_date) AS order_day, COUNT(DISTINCT order_id) AS "Total Orders"
FROM pizza
GROUP BY dayname(order_date);

-- PERCENTAGE OF SALES BY PIZZA CATEGORY
SELECT Pizza_category, ROUND(SUM(total_price) * 100/ (SELECT SUM(total_price) FROM pizza), 2) AS PCT
FROM pizza
GROUP BY pizza_category;


-- PERCENTAGE OF SALES BY PIZZA Size
SELECT Pizza_size, ROUND(SUM(total_price) * 100/ (SELECT SUM(total_price) FROM pizza), 2) AS PCT
FROM pizza
GROUP BY pizza_size
ORDER BY PCT DESC;

-- TOTAL PIZZA SOLD BY CATEGORY
SELECT pizza_category, SUM(quantity) AS Total_pizza_sold
FROM pizza
GROUP BY pizza_category
order by pizza_category desc;

-- TOP 5 BEST SELLER BY TOTAL PIZZA
SELECT pizza_name, SUM(quantity) as Total_pizza_sold
FROM pizza
GROUP BY pizza_name
ORDER BY Total_pizza_sold DESC
LIMIT 5;



-- BOTTOM SELLER BY TOATAL PIZZA
SELECT pizza_name, SUM(quantity) as Total_pizza_sold
FROM pizza
GROUP BY pizza_name
ORDER BY Total_pizza_sold ASC
LIMIT 5;



