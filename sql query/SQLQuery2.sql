SELECT 
    Category,
    [Sub_Category],
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    SUM(Quantity) AS UnitsSold
FROM Superstore
GROUP BY Category, [Sub_Category]
ORDER BY TotalProfit DESC;