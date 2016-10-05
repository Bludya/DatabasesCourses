CREATE TABLE directors
(
	id INT NOT NULL AUTO_INCREMENT,
	director_name VARCHAR(50),
	notes VARCHAR(200),
	PRIMARY KEY(id)
);

CREATE TABLE genres
(
	id INT NOT NULL AUTO_INCREMENT,
	genre_name VARCHAR(50),
	notes VARCHAR(200),
	PRIMARY KEY(id)
);

CREATE TABLE categories
(
	id INT NOT NULL AUTO_INCREMENT,
	category_name VARCHAR(50),
	notes VARCHAR(200),
	PRIMARY KEY(id)
);

CREATE TABLE movies
(
	id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(50),
	director_id INT NOT NULL,
	copyright_year INT,
	length FLOAT NOT NULL,
	genre_id INT NOT NULL,
	category_id INT NOT NULL,
	rating FLOAT,
	notes VARCHAR(200),
	PRIMARY KEY(id)
);

INSERT INTO directors(id, director_name, notes) VALUES
(1, "Pesho", "wrwehgrehreh"),
(2, "Ivan", "regeherherh"),
(3, "Nencho", "wegwergerher"),
(4, "Liolio", "ewgwegh"),
(5, "Gencho", "ebrrh");

INSERT INTO genres(id, genre_name, notes) VALUES
(1, "ekshan","ramboooo"),
(2, "komediqqqq", "grherhrh"),
(3, "drama", "uaaa"),
(4, "muzikal", "wegwegewgh"),
(5, "nimoapoiche", "grerhre");

INSERT INTO categories(id, category_name, notes) VALUES
(1, "wegewg", "wegwegewg"),
(2, "wegewg", "wegwegewg"),
(3, "wegewg", "wegwegewg"),
(4, "wegewg", "wegwegewg"),
(5, "wegewg", "wegwegewg");

INSERT INTO movies(id, title, director_id, copyright_year, length, genre_id, category_id, rating, notes) VALUES
(1, "ewwegweg", 1, 1999, 120.4, 1, 2, 332, "wegegegw"),
(2, "ewwegweg", 1, 1999, 120.4, 1, 2, 332, "wegegegw"),
(3, "ewwegweg", 1, 1999, 120.4, 1, 2, 332, "wegegegw"),
(4, "ewwegweg", 1, 1999, 120.4, 1, 2, 332, "wegegegw"),
(5, "ewwegweg", 1, 1999, 120.4, 1, 2, 332, "wegegegw");