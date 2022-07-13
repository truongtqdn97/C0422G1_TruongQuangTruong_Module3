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

create table teacher(
id int auto_increment,
teacher_name varchar(55),
age int,
country varchar(55),
primary key (id)
);


alter table student rename column name_student to `name`;

insert into teacher(teacher_name, age, country) values ("ten so mot", 30, "japan"), ("ten so hai", 35, "china"), ("ten so ba", 32, "laos");

select * from teacher;



