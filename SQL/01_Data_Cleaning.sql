GNEITH PHARMACEUTICAL INDUSTRY
SQL DATA CLEANING
  
1. SALES DATA CLEANING
SELECT
    [Order ID],

    UPPER(TRIM([Drug_Name])) AS [Drug_Name],

    UPPER(TRIM([Drug_Category])) AS [Drug_Category],

    UPPER(TRIM([Customer ID])) AS [Customer ID],

    UPPER(TRIM([Customer Name])) AS [Customer Name],

    UPPER(TRIM([Sales Rep])) AS [Sales Rep],

    UPPER(TRIM([Region])) AS [Region],

    UPPER(TRIM([State])) AS [State],

    TRY_CONVERT(date, [Sales Date]) AS [Sales Date],

    CASE
        WHEN [Qty Sold] < 0 THEN NULL
        ELSE [Qty Sold]
    END AS [Qty Sold],

    CASE
        WHEN [Unit Price] <= 0 THEN NULL
        ELSE [Unit Price]
    END AS [Unit Price],

    IS NULL([Discount %], 0) AS [Discount %],

    [Revenue],

    [Profit],

    UPPER(TRIM([Sales Channel])) AS [Sales Channel]

INTO dbo.Cleaned_Sales_Data

  
  
2. PRODUCTION DATA CLEANING
SELECT
    [Production_ID],

    UPPER(TRIM([Drug_Name])) AS [Drug_Name],

    UPPER(TRIM([Drug_Category])) AS [Drug_Category],

    UPPER(TRIM([Batch_Number])) AS [Batch_Number],

    TRY_CONVERT(date, [Production_Date]) AS [Production_Date],

    TRY_CONVERT(date, [Expiry_Date]) AS [Expiry_Date],

    CASE
        WHEN [Units_Produced] < 0 THEN NULL
        ELSE [Units_Produced]
    END AS [Units_Produced],

    CASE
        WHEN [Production_Cost] <= 0 THEN NULL
        ELSE [Production_Cost]
    END AS [Production_Cost]

INTO dbo.Clean_Production_Data

FROM dbo.[PRODUCTION DATASET$];



 3. INVENTORY DATA CLEANING

SELECT
    [Inventory_ID],

    UPPER(TRIM([Drug_Name])) AS [Drug_Name],

    UPPER(TRIM([Drug_Category])) AS [Drug_Category],

    UPPER(TRIM([Batch_Number])) AS [Batch_Number],

    TRY_CONVERT(date, [Expiry_Date]) AS [Expiry_Date],

    CASE
        WHEN [Inventory_Value] <= 0 THEN NULL
        ELSE [Inventory_Value]
    END AS [Inventory_Value],

    CASE
        WHEN [Unit_Cost] <= 0 THEN NULL
        ELSE [Unit_Cost]
    END AS [Unit_Cost],

    UPPER(TRIM([Warehouse])) AS [Warehouse],

    UPPER(TRIM([Region])) AS [Region]

INTO dbo.Clean_Inventory_Data

FROM dbo.[INVENTORY DATASET$];
FROM dbo.[SALES DATASET$];
