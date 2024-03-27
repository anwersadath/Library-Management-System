# Library Management System

This project implements a Library Management System using a relational database management system (RDBMS) and SQL. The system manages information about books in the library, their availability, customers, employees, and more.

## Introduction

The Library Management System is designed to keep track of all information about books in the library, their availability, customers, and employees. It provides functionalities such as adding new books, issuing books to customers, returning books, managing employees, and more.

## Features

- Add, update, and delete books in the library inventory.
- Manage customer registration and book issuing.
- Track book availability and status.
- Manage employee information and positions.

## Database Schema

The database schema consists of the following tables:

1. **Branch**: Stores information about library branches.
2. **Employee**: Stores employee details such as name, position, and salary.
3. **Customer**: Stores customer information including name, address, and registration date.
4. **IssueStatus**: Tracks book issuance details including customer ID, book name, and issue date.
5. **ReturnStatus**: Tracks book return details including customer ID, book name, and return date.
6. **Books**: Stores information about books such as title, category, rental price, author, and publisher.

Refer to the [SQL schema](schema.sql) for details.

## Queries

The project includes various SQL queries to perform operations such as:

- Retrieving book information.
- Listing employee details.
- Tracking issued books and customers.
- Calculating total book counts by category.
- and more.

Refer to the [Queries](queries.sql) file for sample SQL queries.

## Setup

To set up the project:

1. Clone this repository.
2. Import the SQL schema (`schema.sql`) into your RDBMS.
3. Optionally, populate the database with sample data using the provided SQL script.
4. Run the queries to interact with the database.

