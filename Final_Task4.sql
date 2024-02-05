-- Lucky Shrub need location data for their clients and employees.

-- Create an optimized query to output the:
-- 	1. full name of all clients and employees from the Clients and Employees tables.
-- 	2. address of each person from the Addresses table.

SELECT FullName, Street, County FROM Clients
JOIN Addresses USING(AddressID)
UNION
SELECT FullName, Street, County FROM Employees
JOIN Addresses USING(AddressID)
ORDER BY Street;