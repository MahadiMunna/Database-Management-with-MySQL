create database Constraints;
use constraints;

-- constraints setting style
create table student(
	roll char(4) primary key,
    name varchar(50) not null,
    email varchar(30) unique,
    address varchar(20),
    age int check(age>10)
    -- primary, unique key, check can be written here like
    -- constraint pk_rule primary key(roll)
    -- constraint checking_rule check(age>10)
);
-- insert value to the table
insert into student(roll,name,email,address,age) 
	values(1,'Mahadi Munna','mahadi@g.com','Tangail',24);
insert into student(roll,name,email,address,age) 
	values(2,'Monir','monir@g.com','Tangail',19);
insert into student(roll,name,email,address,age) 
	values(3,'Alphy','alphy@g.com','Tangail',21);
insert into student(roll,name,email,address,age) 
	values(4,'Nahid','nahid@g.com','Tangail',21);
insert into student(roll,name,email,address,age) 
	values(5,'Rakibul Islam','rakib@g.com','Tangail',28);

-- foreign key constraint setting
create table library(
	bookName varchar(50) primary key,
    who_hired_roll char(4),
	foreign key(who_hired_roll) references student(roll)
);

-- composite primary key setting
create table courses(
	courseName varchar(10),
    University varchar(10),
    constraint primary key pk_rule (courseName,University)
);
create table marks(
	roll varchar(10),
    cse1 int,
    cse2 int
);
insert into marks(roll,cse1, cse2)
	values ('1',85,86);

-- select query
select name, roll, email from student;
select * from student;-- all field selected by *

-- where query(where works as  condition)
select name,age,email from student where roll='2';
select * from student where roll='1';

-- arithmatic operator
select cse1+cse2 from marks where roll=1;
select cse1+cse2, (cse1+cse2)/2 from marks where roll=1;

-- comparison operator 
select * from student where age>20;

-- logical operator
select name from student where age>20 and address='Tangail'; -- both true
select name from student where age>20 or address='Tangail'; --  one of them true

-- Distinct, limit, order by, offset
select distinct age from student ; -- give a unique value set
select name from student order by  age asc; -- asc means accending order and desc means deccending order
select name from student order by age desc limit 3 offset 1;-- here limit is the selector that how much value it will select and offset is the remover from starting or starting point
select name from student order by age desc limit 1,3; -- same as upper query without offset, 1 is the starting index and 3 is the limit

-- in, not in, like, as
select name from student where roll in(1,2,3); -- in means if there any roll in those
select name from student where roll not in(1,2,3); -- not in means without those
select * from student where name like '%Islam'; -- % in front means there could be something in front of islam, % in end means something after islam, and %% means both side of selected text
select name as student_name from student; -- change field name