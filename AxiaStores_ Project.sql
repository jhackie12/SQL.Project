CREATE TABLE CustomerTB(
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
Phone VARCHAR(20),
City VARCHAR(50)
);

CREATE TABLE ProductTB(
ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    UnitPrice DECIMAL(10, 2),
    StockQty INT
);

CREATE TABLE OrdersTB (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT
);

INSERT INTO CustomerTB (CustomerID, FirstName, LastName, Email, Phone, City)
VALUES 
(1, 'Musa', 'Ahmed', 'musa.ahmed@email.com', '08011111111', 'Abuja'),
(2, 'Ray', 'Samson', 'ray.samson@email.com', '08022222222', 'Lagos'),
(3, 'Chinedu', 'Okafor', 'chinedu.okafor@email.com', '08033333333', 'Enugu'),
(4, 'Dare', 'Adewale', 'dare.ad@email.com', '08044444444', 'Ibadan'),
(5, 'Efe', 'Ojo', 'efe.oj@gmail.com', '08055555555', 'Warri'),
(6, 'Aisha', 'Bello', 'aisha.bello@email.com', '08066666666', 'Kano'),
(7, 'Tunde', 'Salami', 'tunde.salami@email.com', '08077777777', 'Osogbo'),
(8, 'Nneka', 'Umeh', 'nneka.umeh@email.com', '08088888888', 'Onitsha'),
(9, 'Kelvin', 'Peters', 'kelvin.peters@email.com', '08099999999', 'Uyo'),
(10, 'Blessing', 'Mark', 'blessing.mark@email.com', '08000000000', 'Makurdi');

INSERT INTO ProductTB (ProductID, ProductName, Category, UnitPrice, StockQty)
VALUES
(1, 'Wireless Mouse', 'Accessories', 7500.00, 120),
(2, 'USB-C Charger 65W', 'Electronics', 14500.00, 75),
(3, 'Noise-Cancel Headset', 'Audio', 85500.00, 50),
(4, '27\" 4K Monitor', 'Displays', 185000.00, 20),
(5, 'Laptop Stand', 'Accessories', 19500.00, 90),
(6, 'Bluetooth Speaker', 'Audio', 52000.00, 60),
(7, 'Mechanical Keyboard', 'Accessories', 18500.00, 40),
(8, 'WebCam 1080p', 'Electronics', 25000.00, 55),
(9, 'Smartwatch Series 5', 'Wearables', 320000.00, 30),
(10, 'Portable SSD 1TB', 'Storage', 125000.00, 35);

INSERT INTO OrdersTB (OrderID, CustomerID, ProductID, OrderDate, Quantity)
VALUES
(1001, 1, 3, '2025-06-01', 1),
(1002, 2, 1, '2025-06-03', 2),
(1003, 3, 5, '2025-06-05', 1),
(1004, 4, 4, '2025-06-10', 1),
(1005, 5, 2, '2025-06-12', 3),
(1006, 6, 7, '2025-06-15', 1),
(1007, 7, 6, '2025-06-18', 2),
(1008, 8, 8, '2025-06-20', 1),
(1009, 9, 9, '2025-06-22', 1),
(1010, 10, 10, '2025-06-25', 2);

SELECT DISTINCT c.FirstName, c.Email
FROM OrdersTB o
JOIN CustomerTB c ON o.CustomerID = c.CustomerID
JOIN ProductTB p ON o.ProductID = p.ProductID
WHERE p.ProductName = 'Wireless Mouse';

SELECT FirstName, LastName
FROM CustomerTB
ORDER BY LastName ASC, FirstName ASC;

SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerFullName,
    p.ProductName,
    o.Quantity,
    p.UnitPrice,
    (o.Quantity * p.UnitPrice) AS TotalPrice,
    o.OrderDate
FROM OrdersTB o
JOIN CustomerTB c ON o.CustomerID = c.CustomerID
JOIN ProductTB p ON o.ProductID = p.ProductID;

SELECT 
    p.Category,
    AVG(o.Quantity * p.UnitPrice) AS AverageSales
FROM OrdersTB o
JOIN ProductTB p ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY AverageSales DESC;

SELECT TOP 1 
    c.City,
    SUM(o.Quantity * p.UnitPrice) AS TotalRevenue
FROM OrdersTB o
JOIN CustomerTB c ON o.CustomerID = c.CustomerID
JOIN ProductTB p ON o.ProductID = p.ProductID
GROUP BY c.City
ORDER BY TotalRevenue DESC;