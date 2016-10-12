CREATE TABLE persons
(
	person_id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50),
	salary DOUBLE,
	passport_id INT NOT NULL,
	PRIMARY KEY(person_id)	
);

CREATE TABLE passports
(
	passport INT NOT NULL,
	passport_number VARCHAR(50),
	PRIMARY KEY(passport)
);

INSERT INTO persons(person_id, first_name, salary, passport_id)
VALUES	(1, 'Roberto', 43300.00, 102),
		(2, 'Tom', 56100.00, 103),
		(3, 'Yana', 60200.00, 101);
				
INSERT INTO passports(passport, passport_number)
VALUES	(101, 'N34FG21B'),
		(102, 'K65LO4R7'),
		(103, 'ZE657QP2');
		
ALTER TABLE persons
ADD CONSTRAINT fk_persons_passports FOREIGN KEY(passport_id) REFERENCES passports(passport);