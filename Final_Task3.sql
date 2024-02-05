-- Lucky Shrub need to automate the orders process in their database. 

-- Create a trigger: UpdateAudit that invokes AFTER a new order is inserted.

DROP TRIGGER IF EXISTS UpdateAudit;

CREATE TRIGGER UpdateAudit
AFTER INSERT
ON Orders FOR EACH ROW
INSERT INTO Audit (OrderDateTime) VALUES (CURRENT_TIMESTAMP);

INSERT INTO Orders VALUES 
	(31, "Cl2", "P2", 10, 200, "2024-02-03"),   
	(32, "Cl3", "P3", 20, 800, "2024-02-03"),   
	(33, "Cl1", "P1", 10, 500, "2024-02-03" );		 

SELECT * FROM Audit;