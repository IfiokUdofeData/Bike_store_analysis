-- STEP ONE
/*

we need to get:
a.	Order id
b.	Customer name ( first and last name)
c.	Customer city
d.	Customer state
e.	Order date

*/

SELECT
	ord.order_id,
	CONCAT(cus.first_name, ' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date
FROM sales.orders as ord
JOIN sales.customers as cus
ON ord.customer_id = cus.customer_id

-- select * from INFORMATION_SCHEMA.TABLES

-- STEP TWO
/*

we need to get: 
f.	Sales volume
g.	Revenue

*/

SELECT
	ord.order_id,
	CONCAT(cus.first_name, ' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	SUM(ite.quantity) AS 'total units',
	SUM(ite.quantity*ite.list_price) AS 'revenue'
FROM sales.orders as ord
JOIN sales.customers as cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
GROUP BY
	ord.order_id,
	CONCAT(cus.first_name, ' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date


	-- STEP TWO
/*

we need to get: 
h.	Product name

*/

SELECT
	ord.order_id,
	CONCAT(cus.first_name, ' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	SUM(ite.quantity) AS 'total units',
	SUM(ite.quantity*ite.list_price) AS 'revenue',
	pro.product_name
FROM sales.orders as ord
JOIN sales.customers as cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON ite.product_id = pro.product_id
GROUP BY
	ord.order_id,
	CONCAT(cus.first_name, ' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name


		-- STEP THREE
/*

we need to get: 
i.	Product category

*/

SELECT
	ord.order_id,
	CONCAT(cus.first_name, ' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	SUM(ite.quantity) AS 'total units',
	SUM(ite.quantity*ite.list_price) AS 'revenue',
	pro.product_name,
	cat.category_name
FROM sales.orders as ord
JOIN sales.customers as cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON ite.product_id = pro.product_id
JOIN production.categories cat
ON pro.category_id = cat.category_id
GROUP BY
	ord.order_id,
	CONCAT(cus.first_name, ' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name




-- STEP FOUR
/*

we need to get: 
j.	Store name

*/

SELECT
	ord.order_id,
	CONCAT(cus.first_name, ' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	SUM(ite.quantity) AS 'total units',
	SUM(ite.quantity*ite.list_price) AS 'revenue',
	pro.product_name,
	cat.category_name,
	sto.store_name
FROM sales.orders as ord
JOIN sales.customers as cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON ite.product_id = pro.product_id
JOIN production.categories cat
ON pro.category_id = cat.category_id
JOIN sales.stores sto
ON ord.store_id = sto.store_id
GROUP BY
	ord.order_id,
	CONCAT(cus.first_name, ' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name





-- STEP FIVE
/*

we need to get: 
k.	Sales representative

*/

SELECT
	ord.order_id,
	CONCAT(cus.first_name, ' ',cus.last_name) as 'customer',
	cus.city,
	cus.state,
	ord.order_date,
	SUM(ite.quantity) AS 'total units',
	SUM(ite.quantity*ite.list_price) AS 'revenue',
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ',sta.last_name) as 'sales rep'
FROM sales.orders as ord
JOIN sales.customers as cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON ite.product_id = pro.product_id
JOIN production.categories cat
ON pro.category_id = cat.category_id
JOIN sales.stores sto
ON ord.store_id = sto.store_id
JOIN sales.staffs sta
ON ord.staff_id = sta.staff_id
GROUP BY
	ord.order_id,
	CONCAT(cus.first_name, ' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ',sta.last_name)