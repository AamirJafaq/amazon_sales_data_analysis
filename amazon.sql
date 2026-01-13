-- Creating category table.
CREATE TABLE category (
category_id INT PRIMARY KEY,
category_name VARCHAR(20)
);
SELECT * FROM category;
-- Creating customers table
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(20),
state VARCHAR(20),
address VARCHAR(5)
);
SELECT * FROM customers;


-- Creat sellers table.
CREATE TABLE sellers (
seller_id INT PRIMARY KEY,
seller_name VARCHAR(25),
origin VARCHAR(10)
);

-- Create products table
CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
price FLOAT,
cogs FLOAT,
category_id INT, 
CONSTRAINT fk_products_category_id FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- Creat orders table.
CREATE TABLE orders (
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT,
seller_id INT,
order_status VARCHAR(15),
CONSTRAINT fk_orders_customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
CONSTRAINT fk_orders_seller_id FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);

-- Create order_items table.
CREATE TABLE order_items (
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
price_per_unit FLOAT,
CONSTRAINT fk_order_items_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id),
CONSTRAINT fk_order_items_product_id FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Creat payments table.
CREATE TABLE payments (
payment_id INT PRIMARY KEY,
order_id INT,
payment_date DATE,
payment_status VARCHAR(20),
CONSTRAINT fk_payments_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Creat shippings table.
CREATE TABLE shippings (
shipping_id INT PRIMARY KEY,
order_id INT,
shipping_date DATE,
return_date DATE,
shipping_providers VARCHAR(15),
delivery_status VARCHAR(15),
CONSTRAINT fk_shippings_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Creat inventory table.
CREATE TABLE inventory (
inventory_id INT,
product_id INT,
stock INT,
warehouse_id INT,
last_stock_date DATE,
CONSTRAINT fk_inventory_product_id FOREIGN KEY (product_id) REFERENCES products(product_id)
);

