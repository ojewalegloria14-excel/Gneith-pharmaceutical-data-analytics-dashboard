Total Revenue
SELECT
    SUM(Revenue) AS Total_Revenue
FROM dbo.Cleaned_Sales


  Which drugs generate the most revenue?
SELECT
    Drug_Name,
    SUM(Revenue) AS Total_Revenue
FROM dbo.Cleaned_Sales_Data
GROUP BY Drug_Name
ORDER BY Total_Revenue DESC;


Which regions perform best?
SELECT
    Region,
    SUM(Revenue) AS Total_Revenue
FROM dbo.Cleaned_Sales_Data
GROUP BY Region
ORDER BY Total_Revenue DESC;
