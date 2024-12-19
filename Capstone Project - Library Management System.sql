CREATE DATABASE LIBRARY;
USE LIBRARY;


CREATE TABLE BRANCH (
    branch_no INT PRIMARY KEY,
    manager_id INT,
    branch_address VARCHAR(255),
    contact_no VARCHAR(15)
);


CREATE TABLE EMPLOYEE(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
	position VARCHAR(50),
    salary DECIMAL(10, 2),
    branch_no INT,
    FOREIGN KEY (branch_no) REFERENCES BRANCH(Branch_no)
);


CREATE TABLE BOOKS (
    isbn VARCHAR(50)  PRIMARY KEY,
    book_title VARCHAR(255),
    category VARCHAR(100),
    rental_Price DECIMAL(10, 2),
    status ENUM('yes', 'no'),
    author VARCHAR(100),
    publisher VARCHAR(100)
);


CREATE TABLE CUSTOMER (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_address VARCHAR(255),
    reg_date DATE
);


CREATE TABLE ISSUESTATUS (
    issue_id INT PRIMARY KEY,
    issued_cust INT,
    issued_book_name VARCHAR(255),
    issue_date DATE,
    isbn_book VARCHAR(50),
    FOREIGN KEY (issued_cust) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (isbn_book) REFERENCES BOOKS(isbn)
);


CREATE TABLE RETURNSTATUS (
    return_id INT PRIMARY KEY,
    return_cust INT,
    return_book_name VARCHAR(255),
    return_date DATE,
    isbn_book2 VARCHAR(50),
    FOREIGN KEY (return_cust) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (isbn_book2) REFERENCES BOOKS(isbn)
);



-- Insert Records in to BRANCH Table

INSERT INTO BRANCH (branch_no, manager_id, branch_address, contact_no)
VALUES
(1, 101, '123 Main St, City A', '123-456-7890'),
(2, 102, '456 Oak St, City B', '234-567-8901'),
(3, 103, '789 Pine St, City C', '345-678-9012'),
(4, 104, '101 Maple St, City D', '456-789-0123'),
(5, 105, '202 Cedar St, City E', '567-890-1234'),
(6, 106, '303 Birch St, City F', '678-901-2345'),
(7, 107, '404 Elm St, City G', '789-012-3456'),
(8, 108, '505 Walnut St, City H', '890-123-4567'),
(9, 109, '606 Redwood St, City I', '901-234-5678'),
(10, 110, '707 Spruce St, City J', '012-345-6789');



-- Insert Records in to EMPLOYEE Table

INSERT INTO EMPLOYEE (emp_id, emp_name, position, salary, branch_no)
VALUES
(1, 'Alice Johnson', 'Manager', 60000, 1),
(2, 'Bob Smith', 'Librarian', 40000, 1),
(3, 'Charlie Brown', 'Manager', 65000, 2),
(4, 'David Williams', 'Librarian', 45000, 2),
(5, 'Eva Davis', 'Manager', 70000, 3),
(6, 'Frank Moore', 'Librarian', 43000, 3),
(7, 'Grace Wilson', 'Manager', 55000, 4),
(8, 'Henry Clark', 'Librarian', 42000, 4),
(9, 'Isla Lewis', 'Manager', 75000, 5),
(10, 'Jack Walker', 'Librarian', 48000, 5);



-- Insert Records in to BOOKS Table

INSERT INTO BOOKS (isbn, book_title, category, rental_price, status, author, publisher)
VALUES
('978-3-16-148410-0', 'The Great Adventure', 'Fiction', 25.99, 'yes', 'John Doe', 'Publisher A'),
('978-1-234-56789-7', 'History of Science', 'Non-fiction', 30.50, 'yes', 'Jane Doe', 'Publisher B'),
('978-0-12-345678-9', 'The Art of Programming', 'Technology', 50.00, 'no', 'Alan Turing', 'Publisher C'),
('978-0-987-654321-0', 'Modern History', 'History', 20.00, 'yes', 'Michael Bell', 'Publisher D'),
('978-3-16-148411-7', 'Java Programming Guide', 'Technology', 45.00, 'no', 'James Smith', 'Publisher E'),
('978-1-23-456789-5', 'Literature and Society', 'Literature', 15.00, 'yes', 'William Shakespeare', 'Publisher F'),
('978-0-12-345679-6', 'The History of Art', 'Art', 40.00, 'yes', 'Leonardo Da Vinci', 'Publisher G'),
('978-3-16-148412-4', 'Data Structures in C', 'Technology', 35.00, 'no', 'Bjarne Stroustrup', 'Publisher H'),
('978-0-987-654322-7', 'World War II', 'History', 28.00, 'yes', 'Winston Churchill', 'Publisher I'),
('978-0-12-345680-3', 'Philosophy of Life', 'Philosophy', 22.00, 'yes', 'Socrates', 'Publisher J');



-- Insert Records in to CUSTOMER Table

INSERT INTO CUSTOMER (customer_id, customer_name, customer_address, reg_date)
VALUES
(1, 'Michael Clark', '123 Maple Rd, City A', '2021-05-01'),
(2, 'Sara Williams', '456 Oak Rd, City B', '2020-08-15'),
(3, 'John Mitchell', '789 Pine Rd, City C', '2022-01-20'),
(4, 'Emma Roberts', '101 Birch Rd, City D', '2019-11-12'),
(5, 'Sophia Taylor', '202 Cedar Rd, City E', '2021-09-30'),
(6, 'Daniel Anderson', '303 Cedar Rd, City F', '2022-06-10'),
(7, 'Olivia Evans', '404 Elm Rd, City G', '2020-12-05'),
(8, 'Liam Turner', '505 Spruce Rd, City H', '2023-02-17'),
(9, 'James Martin', '606 Pine Rd, City I', '2021-07-25'),
(10, 'Amelia Scott', '707 Redwood Rd, City J', '2018-10-10');



-- Insert Records in to ISSUESTATUS Table

INSERT INTO ISSUESTATUS (issue_id, issued_cust, issued_book_name, issue_date, isbn_book)
VALUES
(1, 1, 'The Great Adventure', '2023-03-01', '978-3-16-148410-0'),
(2, 2, 'History of Science', '2023-04-05', '978-1-234-56789-7'),
(3, 3, 'The Art of Programming', '2023-06-12', '978-0-12-345678-9'),
(4, 4, 'Modern History', '2023-05-20', '978-0-987-654321-0'),
(5, 5, 'Java Programming Guide', '2023-02-18', '978-3-16-148411-7'),
(6, 6, 'Literature and Society', '2023-01-30', '978-1-23-456789-5'),
(7, 7, 'The History of Art', '2023-06-01', '978-0-12-345679-6'),
(8, 8, 'Data Structures in C', '2023-05-15', '978-3-16-148412-4'),
(9, 9, 'World War II', '2023-07-07', '978-0-987-654322-7'),
(10, 10, 'Philosophy of Life', '2023-04-25', '978-0-12-345680-3');



-- Insert Records in to RETURNSTATUS Table

INSERT INTO RETURNSTATUS (return_id, return_cust, return_book_name, return_date, isbn_book2)
VALUES
(1, 1, 'The Great Adventure', '2023-03-10', '978-3-16-148410-0'),
(2, 2, 'History of Science', '2023-04-12', '978-1-234-56789-7'),
(3, 3, 'The Art of Programming', '2023-06-18', '978-0-12-345678-9'),
(4, 4, 'Modern History', '2023-05-25', '978-0-987-654321-0'),
(5, 5, 'Java Programming Guide', '2023-02-22', '978-3-16-148411-7'),
(6, 6, 'Literature and Society', '2023-02-05', '978-1-23-456789-5'),
(7, 7, 'The History of Art', '2023-06-10', '978-0-12-345679-6'),
(8, 8, 'Data Structures in C', '2023-06-01', '978-3-16-148412-4'),
(9, 9, 'World War II', '2023-07-10', '978-0-987-654322-7'),
(10, 10, 'Philosophy of Life', '2023-05-01', '978-0-12-345680-3');



select * from BRANCH;

select * from EMPLOYEE;

select * from BOOKS;

select * from CUSTOMER;

select * from ISSUESTATUS;

select * from RETURNSTATUS;



# 1. Retrieve the book title, category, and rental price of all available books.

SELECT book_title, category, rental_Price FROM BOOKS WHERE status = 'yes';



#  2. List the employee names and their respective salaries in descending order of salary.

SELECT emp_name, salary FROM EMPLOYEE ORDER BY salary DESC;



# 3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT B.book_title, C.customer_name
FROM BOOKS B
JOIN ISSUESTATUS I ON B.isbn = I.isbn_book
JOIN CUSTOMER C ON I.issued_cust = C.customer_Id;



#  4. Display the total count of books in each category.

SELECT category, COUNT(*) AS Total_Books FROM BOOKS GROUP BY Category;



#  5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

SELECT emp_name, Position FROM EMPLOYEE WHERE Salary > 50000;



#  6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT C.customer_name
FROM CUSTOMER C
LEFT JOIN ISSUESTATUS I ON C.customer_Id = I.issued_cust
WHERE C.reg_date < '2022-01-01' AND I.issue_id IS NULL;



#  7. Display the branch numbers and the total count of employees in each branch.

SELECT branch_no, COUNT(*) AS Total_Employees FROM EMPLOYEE GROUP BY branch_no;



#  8. Display the names of customers who have issued books in the month of June 2023.

SELECT DISTINCT C.customer_name
FROM CUSTOMER C
JOIN ISSUESTATUS I ON C.customer_id = I.issued_cust
WHERE I.issue_date BETWEEN '2023-06-01' AND '2023-06-30';



# 9. Retrieve book_title from book table containing history.

SELECT book_title FROM BOOKS WHERE book_title LIKE '%history%';



#  10.Retrieve the branch numbers along with the count of employees for branches having more than 1 employee.

SELECT branch_no, COUNT(*) AS Total_Employees FROM EMPLOYEE GROUP BY branch_no HAVING COUNT(*) > 1;



#  11. Retrieve the names of employees who manage branches and their respective branch addresses.

SELECT E.emp_name, B.branch_address
FROM EMPLOYEE E
JOIN BRANCH B ON E.branch_no = B.branch_no
WHERE E.position = 'Manager';



# 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.

SELECT DISTINCT C.customer_name
FROM CUSTOMER C
JOIN ISSUESTATUS I ON C.customer_id = I.issued_cust
JOIN BOOKS B ON I.isbn_book = B.isbn
WHERE B.rental_price > 25;











