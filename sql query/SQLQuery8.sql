SELECT 
    [Order_ID],
    [Order_Date],
    [Ship_Date],
    [Ship_Mode],
    [Customer_Name],
    Segment,
    Region,
    State,
    City,
    Category,
    [Sub_Category],
    [Product_Name],
    Sales,
    Quantity,
    Discount,
    Profit,
    DATEDIFF(day, [Order_Date], [Ship_Date]) AS DeliveryDays
FROM Superstore;
GO