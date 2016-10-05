CREATE TABLE people
(
	id INT AUTO_INCREMENT,
	name VARCHAR(200) NOT NULL,
	picture VARBINARY(2048),
	height FLOAT,
	weight FLOAT,
	gender CHAR(1) NOT NULL,
	birthdate DATE NOT NULL,
	biography BLOB,
	PRIMARY KEY(id)
);

INSERT INTO people(id, name, picture, height, weight, gender, birthdate, biography) VALUES
(1, "Eva", "wegweg", "12.23", "23.24", "f", "09.12.2000", "eraerherhreh"),
(2, "Eva", "wegweg", "12.23", "23.24", "f", "09.12.2000", "eraerherhreh"),
(3, "Eva", "wegweg", "12.23", "23.24", "f", "09.12.2000", "eraerherhreh"),
(4, "Eva", "wegweg", "12.23", "23.24", "f", "09.12.2000", "eraerherhreh"),
(5, "Eva", "wegweg", "12.23", "23.24", "f", "09.12.2000", "eraerherhreh")