use lib;
SELECT student.name, COUNT(borrowing.studentid) AS borrow_count
FROM student
LEFT JOIN borrowing ON student.studentid = borrowing.studentid
GROUP BY student.name
HAVING COUNT(borrowing.studentid) = (
    SELECT MAX(borrow_count)
    FROM (
        SELECT COUNT(studentid) AS borrow_count
        FROM borrowing
        GROUP BY studentid
    ) AS max_borrow_count
)
ORDER BY COUNT(borrowing.studentid) DESC;

select s.name from student as s 
join borrowing as b on s.studentid=b.studentid group by s.name 
having count(b.studentid) = (
	select max(borrow_count) from (
		select count(studentid) as borrow_count from borrowing group by studentid
	) as counter
);
SELECT b.ISBN, b.Title, b.Author, br.DueDate, s.Name AS Borrower
FROM Borrowing AS br
INNER JOIN Book AS b ON br.ISBN = b.ISBN
INNER JOIN Student AS s ON br.StudentID = s.StudentID
WHERE br.ReturnDate IS NULL AND br.DueDate < CURDATE();

select b.isbn,title,author from book as b join borrowing as br on b.isbn=br.isbn where returndate>duedate or (returndate=null and duedate<curdate());

select curdate();

create table employee(
	employee_id varchar(10) primary key,
    name varchar(50) not null,
    email varchar(50) not null,
    phone_no varchar(15) not null,
    salary double,
    department_id varchar(5),
    
    foreign key(department_id) references department(department_id) on delete set null
);
create table department(
	department_id varchar(5) primary key,
    department_name varchar(50) not null,
    manager_id varchar(15) not null,
    location_id varchar(25)
);
create table job_history(
	employee_id varchar(10),
    start_date date,
    end_date date,
    department_id varchar(5),
    
    foreign key(employee_id) references employee(employee_id) on delete cascade,
    foreign key(department_id) references department(department_id)
);