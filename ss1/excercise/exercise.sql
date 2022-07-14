DROP DATABASE IF EXISTS student_management;
CREATE DATABASE student_management;
USE student_management;
CREATE TABLE student (
    id INT NOT NULL,
    `name` VARCHAR(45) NULL,
    country VARCHAR(45) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE class (
    id INT AUTO_INCREMENT,
    class_name VARCHAR(55),
    PRIMARY KEY (id)
);

CREATE TABLE teacher (
    id INT AUTO_INCREMENT,
    teacher_name VARCHAR(55),
    age INT,
    country VARCHAR(55),
    PRIMARY KEY (id)
);

INSERT INTO teacher(teacher_name, age, country) 
	VALUES ("ten so mot", 30, "japan"), ("ten so hai", 35, "china"), ("ten so ba", 32, "laos");

SELECT 
    *
FROM
    teacher;



