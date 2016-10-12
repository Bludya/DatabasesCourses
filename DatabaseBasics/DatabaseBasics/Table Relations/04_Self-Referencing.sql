CREATE TABLE teachers
(
	teacher_id INT NOT NUll AUTO_INCREMENT,
	name VARCHAR(50),
	manager_id INT,
	PRIMARY KEY(teacher_id),
	CONSTRAINT fk_teachers_teachers
		FOREIGN KEY(manager_id)
		REFERENCES teachers(teacher_id)
);
