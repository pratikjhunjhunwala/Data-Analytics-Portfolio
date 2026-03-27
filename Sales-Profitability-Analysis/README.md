# Executive Sales & Profitability Analysis (Excel & SQL)

## 📌 The Business Problem
A retail client had years of raw transactional data but no visibility into which products or regions were actually driving profit versus causing losses. The raw exports were too massive and messy to analyze manually.

## 💡 The Solution
I engineered an automated workflow to clean, categorize, and visualize the data, turning 10,000+ rows of raw transactions into an interactive, 1-click dashboard.

* **SQL (Data Engine):** Filtered raw data and engineered a new `Profitability_Status` column to instantly tag every single order as a 'Loss' or 'Profit'.
* **Excel (Data Visualization):** Built an interactive dashboard with dynamic KPIs, a timeline trend chart, and Slicers allowing the client to drill down by Region and Category.

## 📊 Key Business Insights Discovered
1. **The Profit Bleed:** The "Tables" and "Bookcases" sub-categories are operating at a massive loss (-$17k+), severely dragging down overall profitability.
2. **Regional Risk:** The Central region has the highest concentration of loss-making orders compared to its total volume.
3. **Core Revenue:** The "Consumer" segment drives the vast majority of total sales ($1.16M), indicating where marketing spend should be focused.

## 📂 Files Included
* `Sales_Data_Engine.sql` - The SQL script used to clean and categorize the raw data.
* `[Dashboard_Screenshot](https://github.com/pratikjhunjhunwala/Data-Analytics-Portfolio/blob/main/Sales-Profitability-Analysis/Sales_Data_Analysis_Dashboard.png?raw=true)/` - Visual previews of the interactive Excel dashboard.

*(Note: The raw dataset is omitted from this public repo to protect business privacy, demonstrating secure data handling practices).*
