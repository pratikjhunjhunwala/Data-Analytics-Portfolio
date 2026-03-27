# Customer Retention & Risk Analysis (Excel & SQL)

## 📌 The Business Problem
A telecommunications client was experiencing high customer churn but lacked visibility into *who* was leaving and, more importantly, *how much revenue* was actively at risk. They needed a way to proactively identify flight-risk customers before they canceled their service.

## 💡 The Solution
Instead of just reporting historical churn rates, I engineered a proactive "Risk Engine" using SQL and visualized the financial impact in an interactive Excel dashboard. 

* **SQL (Risk Engine):** Engineered custom categories to flag customers as 'High-Value Flight Risk' or 'Standard Flight Risk' based on their contract type and monthly spend. Calculated exact `Revenue_Lost` per customer.
* **Excel (Dashboard):** Built an executive dashboard highlighting Total Revenue at Risk, Churn Rate by Internet Provider, and dynamic Slicers for Payment Methods.

## 📊 Key Business Insights & Recommendations
1. **The Financial Bleed:** Month-to-Month contracts account for the vast majority of revenue walking out the door.
2. **The Product Problem:** 'Fiber Optic' customers are churning at a significantly higher rate than DSL customers, indicating a potential service quality or pricing issue.
3. **Actionable Analyst Recommendation:** The 'High-Value Flight Risk' segment (Month-to-Month, paying $70+/mo) is driving the largest financial loss. **Action:** Deploy an automated retention campaign offering a 15% monthly discount to this specific segment if they upgrade to a 1-year contract.

## 📂 Files Included
* `Churn_Data_Engine.sql` - The SQL script used to engineer the risk categories and calculate financial loss.
* `Dashboard_Screenshots/` - Visual previews of the interactive Excel dashboard.

*(Note: Raw dataset omitted to simulate secure client data handling).*
