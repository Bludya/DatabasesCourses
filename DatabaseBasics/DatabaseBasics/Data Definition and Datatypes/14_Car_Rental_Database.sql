CREATE TABLE categories
(
	id INT NOT NULL AUTO_INCREMENT,
	category VARCHAR(50) NOT NULL,
	daily_rate FLOAT,
	weekly_rate FLOAT,
	monthly_rate FLOAT,
	weekend_rate FLOAT,
	PRIMARY KEY(id)
);

CREATE TABLE cars
(
	id INT NOT NULL AUTO_INCREMENT,
	plate_number VARCHAR(50) NOT NULL,
	make VARCHAR(50),
	model VARCHAR(50),
	car_year INT,
	category_id INT NOT NULL,
	doors INT,
	picture BLOB,
	`condition` VARCHAR(50),
	available TINYINT,
	PRIMARY KEY(id)
);

CREATE TABLE employees
(
	id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	title VARCHAR(50),
	notes VARCHAR(200),
	PRIMARY KEY(id)
);

CREATE TABLE customers
(
	id INT NOT NULL AUTO_INCREMENT,
	driver_license_number VARCHAR(50),
	full_name VARCHAR(50) NOT NULL,
	address VARCHAR(200),
	city VARCHAR(50),
	zip_code INT,
	notes VARCHAR(200),
	PRIMARY KEY(id)
);

CREATE TABLE rental_orders
(
	id INT NOT NULL AUTO_INCREMENT,
	employee_id INT NOT NULL,
	customer_id INT NOT NULL,
	car_id INT NOT NULL,
	car_condition VARCHAR(50),
	tank_level FlOAT,
	kilometrage_start FLOAT,
	kilometrage_end FLOAT,
	total_kilometrage FLOAT,
	start_date DATE,
	end_date DATE,
	total_days INT,
	rate_applied FLOAT,
	tax_rate FLOAT,
	order_status VARCHAR(50),
	notes VARCHAR(200),
	PRIMARY KEY(id)
);

INSERT INTO categories(id, category) VALUES
(1, "blah"),
(2, "blahblah"),
(3, "ewgwegweg");

INSERT INTO cars(id, plate_number, category_id) VALUES
(1, "EGE123124QWE", 1),
(2, "EGE123124QWE", 3),
(3, "EGE123124QWE", 2);

INSERT INTO employees(id, first_name, last_name) VALUES
(1, "Vanko", "Edno"),
(2, "Vanko", "Dve"),
(3, "Vanko", "Tri");

INSERT INTO customers(id, full_name) VALUES
(1, "Vanko Chetiri"),
(2, "Vanko Pet"),
(3, "Vanko Shest");

INSERT INTO rental_orders(id, employee_id, customer_id, car_id) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

