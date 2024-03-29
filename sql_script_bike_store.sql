SELECT
    ord.order_id,
    CONCAT(cust.first_name, ' ', cust.last_name) AS customer_name,
    cust.city,
    cust.state,
    ord.order_Date,
    SUM(ite.quantity) AS total_units,
    SUM(ite.quantity * ite.list_price) AS revenue,
    pro.product_name,
    cat.category_name,
    sto.store_name,
    CONCAT(sta.first_name, ' ', sta.last_name) AS sales_rep
FROM
    sales.orders ord
JOIN
    sales.customers cust ON ord.customer_id = cust.customer_id
JOIN
    sales.order_items ite ON ord.order_id = ite.order_id
JOIN
    production.products pro ON ite.product_id = pro.product_id
JOIN
    production.categories cat ON pro.category_id = cat.category_id
JOIN
    sales.stores sto ON ord.store_id = sto.store_id
JOIN
    sales.staffs sta ON ord.staff_id = sta.staff_id
GROUP BY
    ord.order_id,
    CONCAT(cust.first_name, ' ', cust.last_name),
    cust.city,
    cust.state,
    ord.order_Date,
    pro.product_name,
    cat.category_name,
    sto.store_name,
    CONCAT(sta.first_name, ' ', sta.last_name)
LIMIT 0, 1000;



