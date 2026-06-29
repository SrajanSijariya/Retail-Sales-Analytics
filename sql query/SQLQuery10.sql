ALTER VIEW vw_SalesSummary AS
SELECT 
    DATEFROMPARTS(YEAR(SaleDate), MONTH(SaleDate), 1) AS Month_Year,
    SUM(SalesAmount) AS Total_Sales
FROM YourSourceTable
GROUP BY DATEFROMPARTS(YEAR(SaleDate), MONTH(SaleDate), 1)