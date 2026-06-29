WITH DiscountBuckets AS (
    SELECT 
        CASE 
            WHEN Discount = 0 THEN 'No Discount'
            WHEN Discount <= 0.2 THEN 'Low (0-20%)'
            WHEN Discount <= 0.4 THEN 'Medium (20-40%)'
            ELSE 'High (40%+)'
        END AS DiscountBand,
        Profit,
        Sales
    FROM Superstore
)
SELECT 
    DiscountBand,
    COUNT(*) AS NumOrders,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    ROUND(AVG(Profit), 2) AS AvgProfitPerOrder
FROM DiscountBuckets
GROUP BY DiscountBand
ORDER BY AvgProfitPerOrder DESC;