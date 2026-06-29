SELECT 
    [Ship_Mode],
    COUNT(*) AS NumOrders,
    AVG(DATEDIFF(day, [Order_Date], [Ship_Date])) AS AvgDeliveryDays
FROM Superstore
GROUP BY [Ship_Mode]
ORDER BY AvgDeliveryDays;