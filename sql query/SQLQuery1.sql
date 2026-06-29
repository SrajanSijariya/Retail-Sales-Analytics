USE SuperstoreDB;
SELECT 
    Region,
    COUNT(DISTINCT [Order_ID]) AS TotalOrders,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS ProfitMarginPct
FROM Superstore
GROUP BY Region
ORDER BY TotalSales DESC;