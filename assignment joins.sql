create database myassdatabase;
use myassdatabase;

## table customers
create table customers(
CustomerId int,
CustomerName varchar(50),
City varchar(50));
insert into customers (CustomerId,CustomerName,City)
values
(1,'John Smith','New York'),
(2,'Mary Johnson','Chicago'),
(3,'Peter Adams','Los Angeles'),
(4,'Nancy Miller','Houston'),
(5,'Robert White','Miami');
select * from customers;

## table orders

create table orders(
OrderID int,
CustomerID int,
OrderDate date,
Amount int);
 insert into orders (OrderID ,CustomerID,OrderDate ,Amount )
 values
 (101,1,'2024-10-01',250),
 (102,2,'2024-10-05',300),
 (103,1,'2024-10-07',150),
 (104,3,'2024-10-10',450),
 (105,6,'2024-10-12',400);
 select * from orders;
 
 ## table payments
 drop table payments;
 create table payments(
 PaymentID varchar(5),
 CustomerID varchar(40),
 PaymentDate date,
 Amount int);
insert into payments(PaymentID,CustomerID,PaymentDate,Amount) 
values
('P001','1','2024-10-02',250),
('P002','2','2024-10-06',300),
('P003','3','2024-10-11',450),
('P004','4','2024-10-15',200);
select * from payments;

## Table Employees
drop table Employees;
create table Employees(
EmployeeID int,
EmployeeName varchar (50),
ManagerID varchar (40));
insert into Employees (EmployeeID,EmployeeName,ManagerID)
values
(1,'Alex Green','Null'),
(2,'Brian Lee','1'),
(3,'Carol Ray','1'),
(4,'David Kim','2'),
(5,'Eva Smith','2');
select * from employees;

##Question 1. Retrieve all customers who have placed at least one order.
SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID;
    
##Question 2. Retrieve all customers and their orders, including customers who have not placed any orders.
SELECT c.CustomerID, c.CustomerName, o.OrderID, o.OrderDate
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID;
    
##Question 3. Retrieve all orders and their corresponding customers, including orders placed by unknown
##customers.
SELECT o.OrderID, o.OrderDate, o.CustomerID, c.CustomerName
FROM Orders o
LEFT JOIN Customers c
    ON o.CustomerID = c.CustomerID;
    
##Question 4. Display all customers and orders, whether matched or not.
SELECT c.CustomerID, c.CustomerName, o.OrderID, o.OrderDate
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID

UNION

SELECT c.CustomerID, c.CustomerName, o.OrderID, o.OrderDate
FROM Customers c
RIGHT JOIN Orders o
    ON c.CustomerID = o.CustomerID;

    
##Question 5. Find customers who have not placed any orders
SELECT c.CustomerID, c.CustomerName
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

##Question 6. Retrieve customers who made payments but did not place any orders
SELECT DISTINCT p.CustomerID
FROM Payments p
LEFT JOIN Orders o
    ON p.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

##Question 7. Generate a list of all possible combinations between Customers and Orders
SELECT c.CustomerID, c.CustomerName, o.OrderID, o.OrderDate
FROM Customers c, Orders o;

##Question 8. Show all customers along with order and payment amounts in one table
SELECT 
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.OrderDate,
    o.Amount AS OrderAmount,
    p.PaymentID,
    p.PaymentDate,
    p.Amount AS PaymentAmount
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p
    ON c.CustomerID = p.CustomerID;
    
##Question 9. Retrieve all customers who have both placed orders and made payments
    SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN Payments p
    ON c.CustomerID = p.CustomerID;
