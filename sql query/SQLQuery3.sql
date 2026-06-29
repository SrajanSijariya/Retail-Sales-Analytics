SELECT 
    YEAR([Order_Date]) AS OrderYear,
    MONTH([Order_Date]) AS OrderMonth,
    SUM(Sales) AS TotalSales
FROM Superstore
GROUP BY YEAR([Order_Date]), MONTH([Order_Date])
ORDER BY OrderYear, OrderMonth;