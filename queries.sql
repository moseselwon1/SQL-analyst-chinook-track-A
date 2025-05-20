-- Query 1: Total spent by each customer
SELECT 
    c.FirstName || ' ' || c.LastName AS CustomerName,
    c.Country,
    SUM(i.Total) AS TotalSpent
FROM Customers c
JOIN Invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY TotalSpent DESC;

-- Query 2: Top-selling tracks
SELECT 
    TrackId,
    SUM(Quantity) AS TotalUnitsSold
FROM InvoiceLines
GROUP BY TrackId
ORDER BY TotalUnitsSold DESC;

-- Query 3: Revenue by country
SELECT 
    c.Country,
    SUM(i.Total) AS Revenue
FROM Customers c
JOIN Invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.Country
ORDER BY Revenue DESC;

-- Query 4: Average invoice value by country
SELECT 
    c.Country,
    AVG(i.Total) AS AvgInvoiceValue
FROM Customers c
JOIN Invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.Country
ORDER BY AvgInvoiceValue DESC;

-- Query 5: Number of invoices per customer
SELECT 
    c.FirstName || ' ' || c.LastName AS CustomerName,
    COUNT(i.InvoiceId) AS NumberOfOrders
FROM Customers c
JOIN Invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY NumberOfOrders DESC;
