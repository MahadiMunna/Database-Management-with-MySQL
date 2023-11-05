create database subquery;
use subquery;

create table student(
	roll char(4) primary key,
    name varchar(50) not null,
    email varchar(30) unique,
    address varchar(20),
    age int check(age>10)
);
insert into student(roll,name,email,address,age) 
	values(1,'Mahadi Munna','mahadi@g.com','Tangail',24);
insert into student(roll,name,email,address,age) 
	values(2,'Monir','monir@g.com','Delduar',19);
insert into student(roll,name,email,address,age) 
	values(3,'Alphy','alphy@g.com','Tangail',21);
insert into student(roll,name,email,address,age) 
	values(4,'Nahid','nahid@g.com','Dhaka',21);
insert into student(roll,name,email,address,age) 
	values(5,'Rakibul Islam','rakib@g.com','Tangail',28);

-- subquery
select * from student where age < (select age from student where name='Mahadi Munna');

select * from student where age=(select max(age) from student)
