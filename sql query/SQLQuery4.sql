SELECT *
FROM (
    SELECT 
        [Customer_Name],
        SUM(Sales) AS TotalSales,
        RANK() OVER (ORDER BY SUM(Sales) DESC) AS SalesRank
    FROM Superstore
    GROUP BY [Customer_Name]
) ranked
WHERE SalesRank <= 10;