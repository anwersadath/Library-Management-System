CREATE DATABASE Library;

USE Library;

#Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(200),
    Contact_no VARCHAR(20)
);
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
    (1, 101, '123 Main St', '123-456-7890'),
    (2, 102, '456 Elm St', '987-654-3210'),
    (3, 103, '789 Oak St', '555-123-4567'),
    (4, 104, '321 Maple St', '333-999-8888'),
    (5, 105, '567 Pine St', '777-444-3333'),
    (6, 106, '890 Cedar St', '222-555-6666'),
    (7, 107, '234 Birch St', '888-777-6666'),
    (8, 108, '678 Walnut St', '444-222-1111'),
    (9, 109, '901 Cherry St', '999-333-2222'),
    (10, 110, '345 Sycamore St', '111-888-9999');

# Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
    (201, 'John Doe', 'Manager', 50000.00, 1),
    (202, 'Jane Smith', 'Librarian', 40000.00, 2),
    (203, 'David Johnson', 'Clerk', 35000.00, 3),
    (204, 'Mary Brown', 'Assistant Librarian', 38000.00, 4),
    (205, 'Michael Wilson', 'Clerk', 35000.00, 5),
    (206, 'Jennifer Lee', 'Assistant Librarian', 38000.00, 6),
    (207, 'Richard Martinez', 'Clerk', 35000.00, 7),
    (208, 'Susan Davis', 'Librarian', 40000.00, 8),
    (209, 'Daniel Taylor', 'Manager', 50000.00, 9),
    (210, 'Karen Clark', 'Librarian', 40000.00, 10);

#Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(200),
    Reg_date DATE
);
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
    (301, 'Alice Johnson', '123 Park Ave', '2023-01-15'),
    (302, 'Bob Smith', '456 Hill St', '2023-02-20'),
    (303, 'Carol Williams', '789 Lake Blvd', '2023-03-25'),
    (304, 'David Brown', '321 River Rd', '2023-04-30'),
    (305, 'Eva Wilson', '567 Ocean Dr', '2023-05-05'),
    (306, 'Frank Davis', '890 Forest Ln', '2023-06-10'),
    (307, 'Grace Lee', '234 Mountain View', '2023-07-15'),
    (308, 'Henry Garcia', '678 Sunset Blvd', '2023-08-20'),
    (309, 'Ivy Martinez', '901 Sunrise Ave', '2023-09-25'),
    (310, 'Jack Taylor', '345 Moonlight St', '2023-10-30');

#Books table
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
    (101, 'Book1', 'Fiction', 10.99, 'yes', 'Author1', 'Publisher1'),
    (102, 'Book2', 'Non-fiction', 12.99, 'yes', 'Author2', 'Publisher2'),
    (103, 'Book3', 'Mystery', 9.99, 'yes', 'Author3', 'Publisher3'),
    (104, 'Book4', 'Romance', 8.99, 'yes', 'Author4', 'Publisher4'),
    (105, 'Book5', 'Thriller', 11.99, 'yes', 'Author5', 'Publisher5'),
    (106, 'Book6', 'Fantasy', 13.99, 'yes', 'Author6', 'Publisher6'),
    (107, 'Book7', 'Science Fiction', 10.99, 'yes', 'Author7', 'Publisher7'),
    (108, 'Book8', 'Biography', 12.99, 'yes', 'Author8', 'Publisher8'),
    (109, 'Book9', 'Self-help', 9.99, 'yes', 'Author9', 'Publisher9'),
    (110, 'Book10', 'History', 14.99, 'yes', 'Author10', 'Publisher10');

#IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
    (401, 301, 'Book1', '2023-01-20', 101),
    (402, 302, 'Book2', '2023-02-25', 102),
    (403, 303, 'Book3', '2023-03-30', 103),
    (404, 304, 'Book4', '2023-04-05', 104),
    (405, 305, 'Book5', '2023-05-10', 105),
    (406, 306, 'Book6', '2023-06-15', 106),
    (407, 307, 'Book7', '2023-07-20', 107),
    (408, 308, 'Book8', '2023-08-25', 108),
    (409, 309, 'Book9', '2023-09-30', 109),
    (410, 310, 'Book10', '2023-10-05', 110);

# ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
    (501, 301, 'Book1', '2023-02-20', 101),
    (502, 302, 'Book2', '2023-03-25', 102),
    (503, 303, 'Book3', '2023-04-30', 103),
    (504, 304, 'Book4', '2023-05-05', 104),
    (505, 305, 'Book5', '2023-06-10', 105),
    (506, 306, 'Book6', '2023-07-15', 106),
    (507, 307, 'Book7', '2023-08-20', 107),
    (508, 308, 'Book8', '2023-09-25', 108),
    (509, 309, 'Book9', '2023-10-30', 109),
    (510, 310, 'Book10', '2023-11-05', 110);


# 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

# 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

# 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT b.Book_title, c.Customer_name FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

# 4. Display the total count of books in each category.    
SELECT Category, COUNT(*) AS Total_Count FROM Books
GROUP BY Category;

# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

#6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

#7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;

#8. Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT c.Customer_name FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE MONTH(Issue_date) = 6 AND YEAR(Issue_date) = 2023;

#9. Retrieve book_title from book table containing history. 
SELECT Book_title FROM Books WHERE Category = 'History';

#10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee
GROUP BY Branch_no HAVING COUNT(*) > 5;
