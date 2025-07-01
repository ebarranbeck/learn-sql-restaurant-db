USE restaurant_db;
-- 1. View the menu_items table.
SELECT *
FROM  menu_items;
-- 2. Find the number of items on the menu.
SELECT COUNT(*) 
FROM menu_items;

-- 3. What are the least and most expensive items on the menu?
-- most expensive
SELECT *
FROM menu_items
ORDER BY price DESC
LIMIT 1;
-- least expensive
SELECT *
FROM menu_items
ORDER BY price
LIMIT 1;

-- 4. How many italian dishes are on the menu?
SELECT COUNT(*) 
FROM menu_items
WHERE category='Italian';

-- 5. What are the least and most expensive italian dishes on the menu?
-- most expensive
SELECT *
FROM menu_items
WHERE category='Italian'
ORDER BY price DESC
LIMIT 1;



-- least expensive
SELECT *
FROM menu_items
WHERE category='Italian'
ORDER BY price 
LIMIT 1;

-- 6. How many dishes in each category?
SELECT category, COUNT(*) AS num_dishes
FROM menu_items
GROUP BY category;

-- 7. Average dish price in each category?
SELECT category, AVG(price) AS avg_price
FROM menu_items
GROUP BY category;