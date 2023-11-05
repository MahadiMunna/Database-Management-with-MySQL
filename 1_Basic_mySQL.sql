create database basic; -- for creating a database
USE basic; --  selecting the database for further manipulation
create table Student(   -- create a table
	Roll char(4) primary key,
	Name varchar(50),
	Marks double
);
insert into student -- insert data to the table
(Roll,Name,Marks) values ('1','Mahadi Hasan',90);
insert into student 
(Roll,Name) values (2,'Monir Hasan');

set SQL_SAFE_UPDATES=0; -- giving update permission
update student set Name="Moniruzzaman Monir" where roll=2; --  update data from the table

delete from student where Roll=1; --  delete data from the table

drop table student; --  delete table