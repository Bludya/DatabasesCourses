CREATE TABLE users
(
	id INT AUTO_INCREMENT,
	username VARCHAR(30) NOT NULL,
	password VARCHAR(26) NOT NULL,
	profile_picture BLOB,
	last_login_time DATETIME,
	is_deleted TINYINT,
	PRIMARY KEY(id)
);

INSERT INTO users(id, username, password, profile_picture, last_login_time, is_deleted) VALUES
(1, "Eva", "wegweg", "eraerherhreh", "00.12.12 12:13", TRUE),
(2, "Eva", "wegweg", "eraerherhreh", "00.12.12 12:13", TRUE),
(3, "Eva", "wegweg", "eraerherhreh", "00.12.12 12:13", TRUE),
(4, "Eva", "wegweg", "eraerherhreh", "00.12.12 12:13", TRUE),
(5, "Eva", "wegweg", "eraerherhreh", "00.12.12 12:13", TRUE)