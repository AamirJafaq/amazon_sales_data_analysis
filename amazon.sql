/* Store Procedure
Create a procedure that as soon as the product is sold it update the tables such as orders, order_items and inventory.
Before reducing the quantity purchased from stock, make sure the stock level is greater or equal to quantity purchased.
*/
CREATE OR REPLACE PROCEDURE update_tables(
prod_id INT,
ord_id INT,
ord_item_id INT,
cust_id INT,
sel_id INT,
qty INT)
LANGUAGE plpgsql
AS $$
DECLARE 
--- Variables to store price and product name.
price_var INT;
prod_name VARCHAR(50);
BEGIN
-- Check the stock level before reducing it for purchased quantity
	IF EXISTS(
        SELECT product_id, stock
        FROM inventory
        WHERE product_id = prod_id AND stock >= qty
   	 ) THEN 
		UPDATE inventory
		SET stock=stock-qty WHERE product_id=prod_id;

-- Putting the values into the orders table.
		INSERT INTO orders (order_id, order_date, customer_id, seller_id)
		VALUES (ord_id, CURRENT_DATE, cust_id, sel_id);

-- Storing the price and product name into the declared variables.
		SELECT price, product_name INTO price_var, prod_name
		FROM products
		WHERE product_id=prod_id;

--Inserting the valuse into the product table.
		INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price_per_unit, total_sales)
		VALUES (ord_item_id, ord_id, prod_id, qty, price_var, qty*price_var );

		RAISE NOTICE 'The date has been added successfully. % has been added', prod_name;
	ELSE 
		RAISE NOTICE 'The date can not be added for certain reasons';
		
    END IF;
END;
$$;



