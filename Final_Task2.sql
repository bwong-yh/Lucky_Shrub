-- Lucky Shrub need to evaluate the sales patterns for bags of artificial grass for 2020, 2021, 2022.

-- Create the EvaluateProduct stored procedure that outputs the total number of items sold during the last three years.

DROP PROCEDURE IF EXISTS EvaluateProduct;

DELIMITER $$
CREATE PROCEDURE EvaluateProduct(
	IN product_id VARCHAR(10),
    OUT year_1 INT,
    OUT year_2 INT,
    OUT year_3 INT
)
BEGIN
	SELECT SUM(Quantity) INTO year_1 FROM Orders
	WHERE ProductID = product_id AND YEAR(Date) = 2020;
	SELECT SUM(Quantity) INTO year_2 FROM Orders
    WHERE ProductID = product_id AND YEAR(Date) = 2021;
	SELECT SUM(Quantity) INTO year_3 FROM Orders
	WHERE ProductID = product_id AND YEAR(Date) = 2022;
END $$ 
DELIMITER ;

CALL EvaluateProduct('P1', @sold_items_2020, @sold_items_2021, @sold_items_2022);

SELECT @sold_items_2020, @sold_items_2021, @sold_items_2022;