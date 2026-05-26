select * from customer limit 20

--1. Which product category generates the highest revenue?

SELECT category,
       SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY category
ORDER BY total_revenue DESC;



--2. Which age group spends the most money?

SELECT age_group,
       AVG(purchase_amount) AS avg_spending,
       SUM(purchase_amount) AS total_spending
FROM customer
GROUP BY age_group
ORDER BY total_spending DESC;



--3. What are the Top 10 most purchased products?

SELECT item_purchased,
       COUNT(*) AS purchase_count
FROM customer
GROUP BY item_purchased
ORDER BY purchase_count DESC
LIMIT 10;



--4. Does subscription status affect spending?

SELECT subscription_status,
       COUNT(*) AS customers,
       AVG(purchase_amount) AS avg_spending
FROM customer
GROUP BY subscription_status;



--5. Which payment method is used most frequently?

SELECT payment_method,
       COUNT(*) AS total_transactions
FROM customer
GROUP BY payment_method
ORDER BY total_transactions DESC;



--6. Which season has the highest sales?

SELECT season,
       SUM(purchase_amount) AS total_sales
FROM customer
GROUP BY season
ORDER BY total_sales DESC;



--7. Do discounts increase purchase amounts?

SELECT discount_applied,
       AVG(purchase_amount) AS avg_purchase
FROM customer
GROUP BY discount_applied;



--8. Which locations generate the highest revenue?

SELECT location,
       SUM(purchase_amount) AS revenue
FROM customer
GROUP BY location
ORDER BY revenue DESC
LIMIT 10;



--9. Relationship between previous purchases and spending

SELECT
CASE
    WHEN previous_purchases <= 10 THEN 'Low'
    WHEN previous_purchases <= 25 THEN 'Medium'
    ELSE 'High'
END AS customer_segment,
AVG(purchase_amount) AS avg_spending
FROM customer
GROUP BY customer_segment;



--10. Which shipping type is preferred and generates the most revenue?

SELECT shipping_type,
       COUNT(*) AS orders_count,
       SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY shipping_type
ORDER BY total_revenue DESC;



--11. Who are the top 10 customers by total spending?

SELECT customer_id,
       SUM(purchase_amount) AS total_spent
FROM customer
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;
