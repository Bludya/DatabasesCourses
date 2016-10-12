CREATE TABLE manufacturers
(
	manufacturer_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	established_on DATE,
	PRIMARY KEY(manufacturer_id)
);

CREATE TABLE models
(
	model_id INT NOT NULL,
	name VARCHAR(50),
	manufacturer_id INT,
	PRIMARY KEY(model_id),
	CONSTRAINT fk_models_manufacturers FOREIGN KEY(manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

INSERT 	INTO manufacturers(manufacturer_id, name, established_on)
VALUES	(1, 'BMW', '1916/07/03'),
		(2, 'Tesla', '2003/01/01'),
		(3, 'Lada', '1966/05/01');
		
INSERT 	INTO models(model_id, name, manufacturer_id)
VALUES	(101, 'X1', 1),
		(102, 'i6', 1),
		(103, 'Model S', 2),
		(104, 'Model X', 2),
		(105, 'Model 3', 2),
		(106, 'Nova', 3);


