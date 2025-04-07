CREATE DATABASE ElectronicsStore

CREATE TABLE Categories(
category_id INT PRIMARY KEY,
name NVARCHAR(50)
)

INSERT INTO Categories(category_id,name)
VALUES
(1,'Smartphones'),
(2,'Laptops'),
(3,'Tablets'),
(4,'Monitors'),
(5,'Accessories')

CREATE TABLE Brands(
brand_id INT PRIMARY KEY,
name NVARCHAR(50)
)

INSERT INTO Brands(brand_id,name)
VALUES
(1,'Apple'),
(2,'Samsung'),
(3,'Lenovo'),
(4,'Dell'),
(5,'Asus')

CREATE TABLE Products(
product_id INT PRIMARY KEY IDENTITY,
name NVARCHAR(100),
category_id INT FOREIGN KEY REFERENCES Categories(category_id )ON DELETE SET NULL,
brand_id INT FOREIGN KEY REFERENCES Brands(brand_id) ON DELETE SET NULL ON UPDATE CASCADE,
price DECIMAL(10,2) NOT NULL,
stock NVARCHAR(50)
)

INSERT INTO Products(name,category_id,brand_id,price,stock)
VALUES
('iPhone 13', 1, 1, 799.99, '150'),
('Samsung Galaxy S21', 1, 2, 999.99, '200'),
('Lenovo ThinkPad X1', 2, 3, 1200.50, '50'),
('Dell UltraSharp Monitor', 4, 4, 350.00, '30'),
('Asus ROG Strix', 5, 5, 1200.00, '25');

CREATE TABLE Clients(
client_id INT PRIMARY KEY IDENTITY,
firstName NVARCHAR(50),
lastName NVARCHAR(50),
phoneNumbers NVARCHAR(14)
)

INSERT INTO Clients(firstName,lastName,phoneNumbers)
VALUES
('Desislava', 'Gudova', '0894957621'),
('Marinela', 'Vladeva', '0876543210'),
('Alisiq', 'Mladenova', '0891234567'),
('Bobsun', 'Georgiev', '0882345678'),
('Silviq', 'Dulgerova', '0883456789')

CREATE TABLE Sales(
sale_id INT PRIMARY KEY IDENTITY,
product_id INT FOREIGN KEY REFERENCES Products(product_id) ON DELETE SET DEFAULT,
client_id INT FOREIGN KEY REFERENCES Clients(client_id) ON DELETE CASCADE,
dateOfSale DATE,
amount INT
)

INSERT INTO Sales(client_id,dateOfSale,amount)
VALUES
(1, '2025-04-01', 2),
(2, '2025-04-02', 1),
(3, '2025-04-03', 3),
(4, '2025-04-04', 1),
(5, '2025-04-05', 2)

SELECT * FROM Categories
SELECT * FROM Brands
SELECT * FROM Products
SELECT * FROM Clients
SELECT * FROM Sales

--1
SELECT * FROM Products
--2
SELECT * FROM Products WHERE price>2000
--3
SELECT * FROM Products
JOIN
Brands ON Brands.brand_id=Products.brand_id
WHERE Brands.name='Samsung'
--4
SELECT TOP 1 * FROM Products ORDER BY price DESC 
--5
SELECT * FROM Clients ORDER BY lastName
--6
SELECT Clients.firstName,Clients.lastName,Clients.phoneNumbers
FROM Clients
LEFT JOIN
Sales ON Sales.client_id=Clients.client_id
--7
--8
SELECT * FROM Clients
LEFT JOIN 
Sales ON Sales.client_id=Clients.client_id
WHERE Sales.sale_id IS NULL
--9
UPDATE Products
SET price =price+(price * 1.10)
WHERE brand_id =1
--10
UPDATE Products
SET brand_id = 10
WHERE brand_id = 1
--11
DELETE FROM Clients WHERE client_id = 1;
--12
DELETE FROM Products 
WHERE brand_id=1
--13
DELETE FROM Products
WHERE product_id=4
