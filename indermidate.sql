/* Eleventh Question */
SELECT pizza_type_id, SUM(price) FROM pizzas
GROUP BY pizza_type_id;



/* Twelfth Question */
SELECT SUM(price) AS Total_revenue FROM pizzas;

/* Thirteenth Question */
SELECT pizza_types.category, SUM(pizzas.price) AS Revenue  FROM pizzas JOIN pizza_types
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.category;


/* Fourteenth Question */
SELECT 
    EXTRACT(HOUR FROM "time") AS hour_,
    COUNT(order_id)
FROM orders
GROUP BY EXTRACT(HOUR FROM "time")
ORDER BY hour_;

/* Fifteenth Question */
SELECT pizza_id , AVG(price) AS avg_price FROM pizzas
GROUP BY pizza_id
ORDER BY pizza_id;

/* Sixteenth Question */
SELECT 
    pizza_types.category,
    SUM(order_details.quantity) AS total_quantity_sold
FROM order_details
JOIN pizzas
ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY total_quantity_sold DESC
LIMIT 1;

/* Seventeenth Question */
SELECT 
    pizza_types.name
FROM pizzas
JOIN pizza_types
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
LEFT JOIN order_details
ON pizzas.pizza_id = order_details.pizza_id
WHERE order_details.pizza_id IS NULL;

/* Eighteenth Question */

SELECT
    order_deta,
    SUM(quantity) AS total_qty
FROM order_details
GROUP BY order_id
HAVING SUM(quantity) > 3;
/* Nineteenth Question */
SELECT 
    pizzas.size,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM order_details
JOIN pizzas
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY revenue DESC
LIMIT 1;

/* Twentieth Question */
SELECT 
    order_details_id,
    SUM(quantity) AS total_quantity
FROM order_details
GROUP BY order_details_id
HAVING SUM(quantity) > (
    SELECT AVG(quantity)
    FROM order_details
);

