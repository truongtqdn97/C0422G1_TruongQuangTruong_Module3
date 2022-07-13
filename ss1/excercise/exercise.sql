create database student_management;
use student_management;
create table student(
id int not null,
name_student varchar(45) null,
country varchar(45) null,
PRIMARY KEY (id)
);

create table class(
id int auto_increment,
class_name varchar(55),
primary key (id)
);