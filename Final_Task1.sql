-- Lucky Shrub need to find out what their average sale price, or cost was for a product in 2022.

-- Create a function: FindAverageCost() that returns the average price of a specific year.

DROP FUNCTION IF EXISTS FindAverageCost;

DELIMITER $$
CREATE FUNCTION FindAverageCost(year INT)
RETURNS DECIMAL(5,2) DETERMINISTIC
BEGIN
RETURN (
	SELECT AVG(Cost) FROM Orders
	WHERE YEAR(DATE) = year
);
END $$
DELIMITER ;

SELECT FindAverageCost(2022);
