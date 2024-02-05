-- Lucky Shrub need a summary of their client's details, including their addresses, order details and the products they purchased. 

-- Create a virtual table called DataSummary that joins together the four tables that contain this data. The tables are:
-- 	1. Clients
-- 	2. Addresses
-- 	3. Orders
-- 	4. Products

-- The virtual table must display the:
-- 	1. full name and contact number for each client from the Clients table.
-- 	2. county that each client lives in from the Addresses table.
-- 	3. name of the product they purchased from the Products table.
-- 	4. ProductID, cost and date of each order from the Orders table.

-- The virtual table should show relevant data for year 2022 only. 
-- Order the data by the cost of the highest order. 

DROP VIEW IF EXISTS DataSummary;

CREATE VIEW DataSummary AS
SELECT FullName, ContactNumber, County, ProductName, o.ProductID, Cost, Date 
FROM Clients
JOIN Addresses a USING(AddressID)
JOIN Orders o USING(ClientID)
JOIN Products p ON o.ProductID = p.Productid
WHERE YEAR(o.Date) = 2022
ORDER BY Cost DESC;

SELECT * FROM DataSummary;