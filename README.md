<p align="center">
  <img width="80" height="120"
       alt="Netflix_2016_N_logo svg"
       src="https://github.com/user-attachments/assets/2a621055-390a-4ed3-8d72-2a613d403d60" />
</p>

## Amazon Sales Data Analysis Using SQL (PostgreSQL)
### 📌 Project Overview
I analyzed a dataset with over 20,000 sales records from an Amazon-like e-commerce platform using PostgreSQL. In this project, I used SQL queries to study customer behavior, product performance, and sales trends. I worked on tasks such as revenue analysis, customer grouping, and inventory tracking. \
The project also involved cleaning the data, handling missing values, and answering real-world business questions using PostgreSQL. An ERD diagram is included to show the database structure and the relationships between tables.

### 🗂 Database Setup & Design
#### Schema
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

```sql
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
```
### 🎯 Business Objectives
The objectives of this project are answer business-driven analytical questions using SQL. The analysis addresses questions such as:
1. What is the total number of Movies and TV Shows on Netflix?
2. Which movies have the longest duration?
3. What content has been added in the last five years?
4. How is content distributed by release year?
5. Which ratings are most common?
6. Which countries contribute the most content?\
The complete list of business and analytical questions addressed in this project is provided in the attached **PDF** file.
### 🔍 Analysis Approach
The analysis follows **two-stage**:
1. **Data Cleaning and Preprocessing (Python)**
- Loaded the raw dataset into Python
- Handled missing and inconsistent values 
2. **SQL-Based Analysis**
- Imported the cleaned dataset into a SQL database
- Created structured tables
- Executed SQL queries to answer business questions
- Applied filtering, aggregation, and date functions

This approach combines **python’s flexibility for data cleaning** with **SQL’s efficiency for analytical querying**.


### 🛠 Tools and Technologies
- **Python** (Data Cleaning & Preprocessing)
- **SQL** (PostgreSQL compatible)
- **Relational Databases**
- **Data Analysis Techniques**


### 📈 Key Insights
- Netflix hosts more **movies than TV shows**
- The majority of movies fall within a standard runtime of under **three hours**.
- A significant portion of content was added in recent years
- Catalog is largely family friendly, with a smaller share of movies and TV shows centered on violent themes.
- Content production is concentrated in a few major countries

### ▶️ How to Run the Project
1. Clean the dataset using Python
2. Create a SQL database
3. Import the cleaned data
4. Execute queries from `SQLnetflix_analysis.sql`

### 👤 Author
**Aamir Khan** \
Research Analyst, **Center for Research & Development in Mathematics and Applications (CIDMA)**

### 📂 Repository Structure
```text
Netflix-SQL-Analysis/
│
├── data/
│   ├── raw_dataset.csv
│   └── cleaned_dataset.csv
│
├── SQLnetflix_analysis.sql
├── Business_Questions.pdf
└── README.md

