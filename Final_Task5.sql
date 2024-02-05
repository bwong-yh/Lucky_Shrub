-- Lucky Shrub need to find out what quantities of wood panels they are selling.

-- Create a CTE (Common Table Expression) for the following query:
    -- SELECT CONCAT (SUM(Cost), " (2020)") AS "Total sum of P2 Product" 
    -- FROM Orders WHERE YEAR (Date) = 2020 AND ProductID = "P2" 
    -- UNION 
    -- SELECT CONCAT (SUM(Cost), "(2021)") FROM Orders WHERE YEAR (Date) = 2021 AND ProductID = "P2" 
    -- UNION 
    -- SELECT CONCAT (SUM (Cost), "(2022)") FROM Orders WHERE YEAR (Date) = 2022 AND ProductID = "P2";

WITH
	sum_in_2020 AS (
		SELECT CONCAT (SUM(Cost), ' (2020)') AS 'Total sum of P2 Product'
        FROM Orders WHERE YEAR (Date) = 2020 AND ProductID = 'P2'
    ),
    sum_in_2021 AS (
		SELECT CONCAT (SUM(Cost), ' (2021)')
        FROM Orders WHERE YEAR (Date) = 2021 AND ProductID = 'P2'
    ),
    sum_in_2022 AS (
		SELECT CONCAT (SUM(Cost), ' (2022)')
        FROM Orders WHERE YEAR (Date) = 2022 AND ProductID = 'P2'
    )
    SELECT * FROM sum_in_2020
    UNION
    SELECT * FROM sum_in_2021
    UNION
    SELECT * FROM sum_in_2022;
	