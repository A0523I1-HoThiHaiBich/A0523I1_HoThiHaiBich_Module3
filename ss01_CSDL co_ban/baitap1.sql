CREATE DATABASE `STUDENT-MANAGEMENT`;
use `student-management`;
create table `student-management`.`student`(
id int primary key,
`name` varchar(45),
age int,
country varchar(45));
create table class(
class_id int primary key,
class_name varchar(45)
);
create table teacher(
teacher_id int primary key,
teacher_name varchar(45),
age int,
country varchar(45)
);