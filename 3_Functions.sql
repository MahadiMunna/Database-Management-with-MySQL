create database functions;
use functions;

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

-- Group functions
select max(age)from student ;
select min(age)from student;
select avg(age)from student;
select sum(age)from student;
select count(age)from student;
select count(*)from student;

--  Group by, having query
select address,max(age) from student group by address;
select address,count(*) from student group by address;

select address,count(*) from student where address!='Tangail' group by address;

select address,max(age) as ag from student where address!='Tangail' group by address having ag<20;

-- Alter query
alter table student add column phone varchar(12);
alter table student drop column phone;
alter table student modify column email varchar(50);


 