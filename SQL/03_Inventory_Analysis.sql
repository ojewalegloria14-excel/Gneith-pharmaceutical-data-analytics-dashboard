Total Inventory Value

SELECT
    SUM([Inventory_Value]) AS Total_Inventory_Value
FROM dbo.Clean_Inventory_Data;


Drugs with the Highest Inventory Value
SELECT
    Drug_Name,
    SUM([Inventory_Value]) AS Total_Inventory_Value
FROM dbo.Clean_Inventory_Data
GROUP BY Drug_Name
ORDER BY Total_Inventory_Value DESC;



Products Approaching Expiry

SELECT
    Drug_Name,
    [Batch_Number],
    [Expiry_Date],
    DATEDIFF(DAY, GETDATE(), [Expiry_Date]) AS Days_To_Expiry
FROM dbo.Clean_Inventory_Data
WHERE [Expiry_Date]
      BETWEEN GETDATE()
      AND DATEADD(DAY, 90, GETDATE())

ORDER BY [Expiry_Date] ASC;
