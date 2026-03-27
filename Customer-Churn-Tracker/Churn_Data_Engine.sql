-- ====================================================================
-- PROJECT: Telecom Customer Retention & Risk Analysis
-- PURPOSE: Identify flight-risk customers and calculate revenue lost
-- ====================================================================

-- QUERY 1: THE RISK ENGINE (Data Prep for Dashboard)
-- Segments customers by risk level and calculates exact dollar amount lost.

SELECT 
    customerID,
    tenure AS Months_With_Company,
    Contract,
    InternetService,
    PaymentMethod,
    ROUND(MonthlyCharges, 2) AS MonthlyCharges,
    Churn,
    CASE 
        WHEN Contract = 'Month-to-month' AND MonthlyCharges > 70 THEN 'High-Value Flight Risk'
        WHEN Contract = 'Month-to-month' AND MonthlyCharges <= 70 THEN 'Standard Flight Risk'
        ELSE 'Stable/Locked-In'
    END AS Risk_Segment,
    CASE 
        WHEN Churn = 'Yes' THEN ROUND(MonthlyCharges, 2)
        ELSE 0 
    END AS Revenue_Lost
FROM 
    telco_churn;

-- ====================================================================

-- QUERY 2: FINANCIAL BLEED BY CONTRACT TYPE
-- Summarizes exactly how much monthly revenue is lost based on contract terms.

SELECT 
    Contract,
    COUNT(customerID) AS Churned_Customers,
    ROUND(SUM(MonthlyCharges), 2) AS Total_Revenue_Lost
FROM 
    telco_churn
WHERE 
    Churn = 'Yes'
GROUP BY 
    Contract
ORDER BY 
    Total_Revenue_Lost DESC;

-- ====================================================================

-- QUERY 3: PRODUCT RISK ANALYSIS
-- Identifies which internet service type is causing the highest churn.

SELECT 
    InternetService,
    COUNT(customerID) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Count,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(customerID), 2) AS Churn_Percentage
FROM 
    telco_churn
GROUP BY 
    InternetService
ORDER BY 
    Churn_Percentage DESC;