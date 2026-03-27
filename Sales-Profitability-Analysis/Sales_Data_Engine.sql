-- ====================================================================
-- PROJECT: Superstore Sales & Profitability Analysis
-- PURPOSE: Clean raw transactional data and extract key business metrics
-- ====================================================================

-- QUERY 1: THE FOUNDATION (Data Prep for Dashboard)
-- Tags every order as 'Profitable' or 'Loss-Making' for Excel visualization.

SELECT 
    "Order ID",
    "Order Date",
    "Segment",
    "Region",
    "Category",
    "Sub-Category",
    "Sales",
    "Profit",
    CASE 
        WHEN "Profit" < 0 THEN 'Loss-Making'
        ELSE 'Profitable'
    END AS Profitability_Status
FROM 
    superstore
WHERE 
    "Sales" > 0;

-- ====================================================================

-- QUERY 2: TOP 10 HIGH-VALUE CUSTOMERS
-- Identifies the most valuable clients based on total net profit.

SELECT 
    "Customer Name",
    "Segment",
    COUNT("Order ID") AS Total_Orders,
    ROUND(SUM("Sales"), 2) AS Lifetime_Value,
    ROUND(SUM("Profit"), 2) AS Total_Profit
FROM 
    superstore
GROUP BY 
    "Customer Name",
    "Segment"
ORDER BY 
    Total_Profit DESC
LIMIT 10;

-- ====================================================================

-- QUERY 3: THE "PROFIT BLEED" ANALYSIS
-- Identifies the specific regions and products causing the biggest financial losses.

SELECT 
    "Region",
    "Category",
    "Sub-Category",
    ROUND(SUM("Profit"), 2) AS Total_Loss
FROM 
    superstore
WHERE 
    "Profit" < 0
GROUP BY 
    "Region",
    "Category",
    "Sub-Category"
ORDER BY 
    Total_Loss ASC; -- Ascending order puts the biggest negative numbers at the top

-- ====================================================================

-- QUERY 4: Total Sales & Profit of each category
-- Identifies total revenue and profit for each product category

SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM 
    superstore
GROUP BY 
    Category
ORDER BY 
    Total_Profit DESC;
