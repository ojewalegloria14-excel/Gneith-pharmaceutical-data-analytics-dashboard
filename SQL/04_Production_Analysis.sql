Total Units Produced
SELECT
    SUM([Units_Produced]) AS Total_Units_Produced
FROM dbo.Clean_Production_Data;


Production by Drug
SELECT
    Drug_Name,
    SUM([Units_Produced]) AS Total_Units_Produced
FROM dbo.Clean_Production_Data
GROUP BY Drug_Name
ORDER BY Total_Units_Produced DESC;



Production Target Achievement by Drug

SELECT
    Drug_Name,

    SUM([Units_Produced]) AS Units_Produced,

    SUM([Batch_Size]) AS Batch_Size,

    SUM([Units_Produced]) * 100.0 /
        NULLIF(SUM([Batch_Size]), 0) AS Target_Achievement_Percent,

    CASE
        WHEN SUM([Units_Produced]) >= SUM([Batch_Size])
            THEN 'Achieved'
        ELSE 'Not Achieved'
    END AS Target_Status

FROM dbo.Clean_Production_Data

GROUP BY Drug_Name

ORDER BY Target_Achievement_Percent DESC;
