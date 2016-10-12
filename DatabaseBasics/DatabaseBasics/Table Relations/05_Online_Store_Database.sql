CREATE DATABASE online_store;

USE online_store;

CREATE TABLE cities
(
	city_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	PRIMARY KEY(city_id)
);

CREATE TABLE customers
(
	customer_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	birthday DATE,
	city_id INT,
	PRIMARY KEY(customer_id),
	CONSTRAINT fk_customers_cities
		FOREIGN KEY(city_id)
		REFEREnCES cities(city_id)
);

CREATE TABLE item_types
(
	item_type_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	PRIMARY KEY(item_type_id)
);

CREATE TABLE items
(
	item_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	item_type_id INT,
	PRIMARY KEY(item_id),
	CONSTRAINT fk_items_item_types
		FOREIGN KEY(item_type_id)
		REFERENCES item_types(item_type_id)
);

CREATE TABLE order_items
(
	order_id INT NOT NULL AUTO_INCREMENT,
	item_id INT,
	PRIMARY KEY(order_id, item_id),
	CONSTRAINT fk_order_items_items
		FOREIGN KEY(item_id)
		REFERENCES items(item_id)
);

CREATE TABLE orders
(
	order_id INT,
	customer_id INT,
	PRIMARY KEY(order_id),
	CONSTRAINt fk_orders_order_items
		FOREIGN KEY(order_id)
		REFERENCES order_items(order_id),
	CONSTRAINT fk_orders_customers
		FOREIGN KEY(customer_id)
		REFERENCES customers(customer_id)
);
