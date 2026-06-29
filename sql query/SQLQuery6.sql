SELECT 
    [Order_ID], [Customer_Name], Region, [Sub_Category], Sales, Discount, Profit
FROM Superstore
WHERE Profit < 0
ORDER BY Profit ASC;