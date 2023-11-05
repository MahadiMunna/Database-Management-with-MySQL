create database studentLibManagement;
use studentLibManagement;

create table student(
roll varchar(4) primary key,
name varchar(50));

create table librarian(
lib_id varchar(4) primary key,
lib_name varchar(50));

create table book(
book_id varchar(4) primary key,
boo_name varchar(50),
book_genre varchar(20));

create table borrow(
who_borrowed_roll varchar(4),
which_book_id varchar(4),
borrow_date date,
return_date date,
foreign key(who_borrowed_roll) references student(roll),
foreign key(which_book_id) references book(book_id),
primary key(who_borrowed_roll, which_book_id));

create table permission(
which_book_id varchar(4),
who_permitted_lib_id varchar(4),
foreign key(which_book_id) references book(book_id),
foreign key(who_permitted_lib_id) references librarian(lib_id),
primary key(which_book_id, who_permitted_lib_id));
