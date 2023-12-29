-- Create and select the database
create database BookStoreDataBase;
use BookStoreDataBase;

-- Create the Books table
create table Books(
	BookID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Title VARCHAR(255) 	not null,
    Author VARCHAR(255),
    Genre VARCHAR(255),
    Price DECIMAL(10,2),
    QuantityStock INT
);

-- Create the Customers table
create table Customers(
	CustomerID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255) not null,
    Email VARCHAR(255) not null,
    Phone VARCHAR(30)
);

-- Create the Sales table with foreign key constraints
create table Sales(
	SaleID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    BookID INT not null,
    CustomerID INT not null,
    DateOfSale DATE,
    QuantitySold INT,
    TotalPrice DECIMAL(10,2),
    FOREIGN KEY (BookID) references Books(BookID),
    FOREIGN KEY (CustomerID) references Customers(CustomerID)
);

-- Insert data into the Books table
INSERT INTO Books(title, author, genre, price, quantityStock)
VALUES('Java book', 'Herbert Schildt', 'IT', 200.0, 250);

INSERT INTO Books(title, author, genre, price, quantityStock)
VALUES('C# book', 'Herbert Schildt', 'IT', 200.0, 250);

INSERT INTO Books(title, author, genre, price, quantityStock)
VALUES('The lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 150.0, 30);

INSERT INTO Books(title, author, genre, price, quantityStock)
VALUES('Romeo and Juliet', 'William Shakespeare', 'Romance', 100.0, 25);

INSERT INTO Books(title, author, genre, price, quantityStock)
VALUES('The Silent Patient', 'Alex Michaelides', 'Psychological thriller', 250.0, 100);

-- Insert data into the Customers table
INSERT INTO Customers(Name, Email, Phone)
VALUES('Ann', 'ann@gmail.com', '12345678');

INSERT INTO Customers(Name, Email, Phone)
VALUES('Jack', 'jack@gmail.com', '777888');

INSERT INTO Customers(Name, Email, Phone)
VALUES('Mike', 'mike@mail.ru', '444555');

INSERT INTO Customers(Name, Email, Phone)
VALUES('Lilith', 'lilit@gmail.com', '777799');

INSERT INTO Customers(Name, Email, Phone)
VALUES('Yan', 'yan@mail.ru', '123123');

-- Insert data into the Sales table
INSERT INTO Sales(BookID, CustomerID, DateOfSale, QuantitySold, TotalPrice)
VALUES(1, 3, '2021-11-15', 2, 400.0);

INSERT INTO Sales(BookID, CustomerID, DateOfSale, QuantitySold, TotalPrice)
VALUES(1, 1, '2019-04-14', 3, 600.0);

INSERT INTO Sales(BookID, CustomerID, DateOfSale, QuantitySold, TotalPrice)
VALUES(3, 1, '2023-11-15', 1, 100.0);

INSERT INTO Sales(BookID, CustomerID, DateOfSale, QuantitySold, TotalPrice)
VALUES(4, 3, '2022-10-23', 3, 600.0);

INSERT INTO Sales(BookID, CustomerID, DateOfSale, QuantitySold, TotalPrice)
VALUES(2, 2, '2024-02-17', 2, 200.0);


-- Retrieve a list of all books sold, including the book title, customer name, and date of sale
SELECT Books.Title, Customers.Name, Sales.DateOfSale
FROM Sales
JOIN Books ON Sales.BookID = Books.BookID
JOIN Customers ON Sales.CustomerID = Customers.CustomerID;


-- Find the total revenue generated from each genre of books
Select Books.Genre , SUM(Sales.TotalPrice)
FROM Sales
JOIN Books ON Sales.BookID = Books.BookID
Group by Books.Genre;
