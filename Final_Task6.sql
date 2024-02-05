-- Lucky Shrub want to know more about the activities of the clients who use their online store. 
-- The system logs the ClientID and the ProductID information for each activity in a JSON Properties column inside the Activity table.

-- Utilize the Properties data to output the:
-- 	01. full name and contact number of each client from the Clients table.
-- 	02. ProductID for all clients who performed activities.

SELECT 
	ClientID, 
    Properties ->> '$.ProductID' ProductID, 
    FullName, 
    ContactNumber 
FROM activity
JOIN Clients c 
	ON Properties ->> '$.ClientID' = c.ClientID;