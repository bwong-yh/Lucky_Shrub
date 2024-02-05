-- Lucky Shrub need to find out how much revenue their top selling product generated. 

-- Create a stored procedure: GetProfit that returns the overall profits generated by a specific product in a specific year. 

DROP PROCEDURE IF EXISTS GetProfit;

DELIMITER //
CREATE PROCEDURE GetProfit(product_id VARCHAR(10), year INT)
BEGIN
	SET @total_quantity = (
		SELECT sum(Quantity) FROM orders
		WHERE ProductID = product_id and YEAR(Date) = year
		);
	
    SELECT ROUND(((SellPrice - BuyPrice) * @total_quantity), 2) AS Profit
	FROM Products
	WHERE ProductID = product_id;
END //
DELIMITER ;

CALL GetProfit('P1', 2020);




