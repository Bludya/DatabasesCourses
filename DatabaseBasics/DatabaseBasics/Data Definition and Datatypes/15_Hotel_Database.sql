CREATE TABLE employees
(
	id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	title VARCHAR(50),
	notes VARCHAR(200),
	PRIMARY KEY(id)
);

CREATE TABLE customers
(
	account_number INT NOT NUll,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	phone_number VARCHAR(50),
	emergency_name VARCHAR(50),
	emergency_number VARCHAR(50),
	notes VARCHAR(200),
	PRIMARY KEY(account_number)
);

CREATE TABLE room_status
(
	room_status VARCHAR(50) NOT NULL,
	notes VARCHAR(200),
	PRIMARY KEY(room_status)
);

CREATE TABLE room_types
(
	room_type VARCHAR(50) NOT NULL,
	notes VARCHAR(200),
	PRIMARY KEY(room_type)
);

CREATE TABLE bed_types
(
	bed_type VARCHAR(50) NOT NULL,
	notes VARCHAR(200),
	PRIMARY KEY(bed_type)
);

CREATE TABLE rooms
(
	room_number INT NOT NULL,
	room_type VARCHAR(50) NOT NULL,
	bed_type VARCHAR(50) NOT NULL,
	rate FLOAT,
	room_status VARCHAR(50) NOT NULL,
	notes VARCHAR(200),
	PRIMARY KEY(room_number)
);

CREATE TABLE payments
(
	id INT NoT NULL AUTO_INCREMENT,
	employee_id INT NOT NULL,
	payment_date DATE,
	account_number INT NOT NULL,
	first_date_occupied DATE,
	last_date_occupied DATE,
	total_days INT,
	amount_charged FLOAT,
	tax_rate FLOAT,
	tax_amount FLOAT,
	payment_total FLOAT NOT NULL,
	notes VARCHAR(200),
	PRIMARY KEY(id)
);

CREATE TABLE occupancies
(
	id INT NOT NULL AUTO_INCREMENT,
	employee_id INT NOT NULL,
	date_occupied DATE,
	account_number INT NOT NULL,
	room_number INT NOT NULL,
	rate_applied FLOAT,
	phone_charge FLOAT,
	notes VARCHAR(200),
	PRIMARY KEY(id)
);

INSERT INTO employees(id, first_name, last_name) VALUES
(1, "ewwegt", "wewee"),
(2, "ewwegt", "wewee"),
(3, "ewwegt", "wewee");

INSERT INTO customers(account_number) VALUES
(112124),
(124124),
(325235);

INSERT INTO room_status(room_status) VALUES
("taken"),
("dirty"),
("FREE");

INSERT INTO room_types(room_type) VALUES
("no shower"),
("no room"),
("no bed");

INSERT INTO bed_types(bed_type) VALUES
("queen bed"),
("king bed"),
("prista");

INSERT INTO rooms(room_number, room_type, bed_type, room_status) VALUES
(1, "no shower", "prista", "dirty"),
(2, "no shower", "prista", "dirty"),
(3, "no shower", "prista", "dirty");

INSERT INTO payments(id, employee_id, account_number, payment_total) VALUES
(1, 1, 124124, 123.14),
(2, 1, 124124, 123.14),
(3, 1, 124124, 123.14);

INSERT INTO occupancies(id, employee_id, account_number, room_number) VALUES
(1, 214, 124124, 1),
(2, 214, 124124, 1),
(3, 214, 124124, 1);




