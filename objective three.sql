-- 1. Combine the menu_items and order_details tables into a single table
SELECT * FROM order_details;
SELECT * FROM menu_items;

SELECT * FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id=mi.menu_item_id;

-- 2. What were the least and most ordered items? What categories were they in?
-- most ordered
SELECT item_name, COUNT(order_details_id) AS item_count FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id=mi.menu_item_id
GROUP BY item_id
ORDER BY item_count DESC
;

-- categories

SELECT item_name,category, COUNT(order_details_id) AS item_count FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id=mi.menu_item_id
GROUP BY item_id, category
ORDER BY item_count DESC
;

-- least ordered
SELECT item_name, COUNT(order_details_id) AS item_count FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id=mi.menu_item_id
GROUP BY item_id
ORDER BY item_count
;
-- category
SELECT item_name,category, COUNT(order_details_id) AS item_count FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id=mi.menu_item_id
GROUP BY item_id, category
ORDER BY item_count
;

-- 3. What were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_spent 
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id=mi.menu_item_id
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5
; 
-- 4. Details of highest spend order 
SELECT category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id=mi.menu_item_id
WHERE order_id=440
GROUP BY category
; 
-- 5. Details of top 5 highest spend orders
SELECT order_id,category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id=mi.menu_item_id
WHERE order_id IN(440,2075,1957,330,2675)
GROUP BY category, order_id
;
