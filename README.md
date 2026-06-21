# Data-Analyst-Project-SQL-Powerbi
End-to-end relational big data analysis of a supermarket enterprise featuring over 6 million rows of transactional data. Includes multi-table SQL joins and interactive Power BI dashboards tracking monthly trends, product margins, regional performance, and customer purchasing behavior.

# Grocery Retail Sales Performance Report

<img width="1116" height="792" alt="image" src="https://github.com/user-attachments/assets/98a990aa-0854-4960-9532-d98e941d0170" />
<img width="1113" height="792" alt="image" src="https://github.com/user-attachments/assets/ad5529c8-54ff-41e8-9761-996138fccaf6" />
<img width="1072" height="767" alt="image" src="https://github.com/user-attachments/assets/d9bdee51-4681-4adc-a599-4fe760056d8a" />

## Project Objective
The goal of this project is to analyze a simulated supermarket enterprise database to uncover insights regarding store revenue, product performance, geographical trends, and employee sales velocity. By connecting transactional data with dimensional records, this dashboard provides actionable recommendations to optimize supermarket inventory, regional marketing, and staff management.

## Data Source
The original relational database used for this analysis was sourced from the [Grocery Sales Database on Kaggle](https://www.kaggle.com/datasets/andrexibiza/grocery-sales-dataset) created by Andrex Ibiza, MBA.

## Dataset Overview
The dataset mimics a real-world relational database structure across multiple connected tables:
* **`sales.csv` (Fact Table):** Logs every unique customer transaction from January 1, 2018, to May 9, 2018.
* **`products.csv` & `categories.csv`:** Detailed inventory classifications and item categories.
* **`customers.csv`, `cities.csv`, & `countries.csv`:** Customer demographics and regional location mapping.
* **`employees.csv`:** Store salesperson registry and performance tracking.

## Tools Used
* **SQL:** Data extraction, multi-table joins, and data cleaning.
* **Power BI:** Data modeling, DAX measures, and interactive visual reporting.

<img width="1170" height="803" alt="image" src="https://github.com/user-attachments/assets/f3d55078-aa1b-4355-a0fa-25c2576a95af" />

## How the Data is Connected (Data Model)

Since this dataset has **over 6 million rows of sales data**, it would make Power BI slow. 
Instead, I used the Model View in Power BI to link my tables together using their ID columns (like `ProductID`, `CustomerID`, and `CityID`). This keeps the file running fast and smooth.

1. **The Main Sales Table (`grocery_sales sales_all`):** This is the heart of the project. It holds all the millions of individual shopping transactions, quantities, and discounts.
2. **The Lookup Tables:** These tables hold the extra details. For example, the sales table connects to the **Products** table to find item names, and the products table connects to **Categories** to see what section they belong to. 

Similarly, the sales table connects to the **Customer** tables, which then link down to **Cities** and **Countries** so we can track exactly where our shoppers live.

## 📊 Business Insights & Recommendations


### 1. Monthly Sales Performance
* **Insight:** Looking at the **Monthly Trend** dashboard, total monthly revenue is very strong at over **$2.0 Billion** from January to April. The drop in May is only because the dataset ends early on May 9th. Product category sales stay very steady and balanced every month.
* **Recommendation:** Since the data for May is incomplete, we should treat May as an outlier and exclude it from our main trend analysis so it does not skew our full-year forecasting. To improve future reporting, the data engineering team should set up a data-validation pipeline to ensure complete month-end data pulls before pushing updates to the production dashboard.

### 2. Top Products Identification
* **Insight:** Based on the **Top Product Performance** dashboard, **Confections ($1.15bn)** and **Meat ($1.02bn)** are the highest-earning categories. Our top items are **Bread - Calabrese Baguette ($38.89M)** and **Shrimp - 31/40 ($38.59M)**. The treemap shows that "High" class products bring in the most money.
* **Recommendation:** Give high-class items like premium bakery and meat products the best shelf and warehouse space. Try bundling slower-moving items (like Grain) with these top sellers to help increase their sales.

### 3. Customer Purchase Behavior
* **Insight:** In the **Executive & Geographic Overview** and **Monthly Trend** dashboards, our Average Order Value (AOV) is **$1,320**. This large number proves our customers are wholesale B2B buyers purchasing big bulk orders instead of normal groceries. Also, the donut chart shows **VIP clients (40.62%)** and **Wholesale clients (32.76%)** bring in most of the revenue.
* **Recommendation:** Focus marketing efforts heavily on B2B clients and VIP accounts. Create tier-based volume discounts (like lower prices if they buy multiple bulk pallets) to keep these high-value buyers loyal.

### 5. Geographical Sales Insights
* **Insight:** As shown in the **Executive & Geographic Overview** dashboard, revenue is split very evenly across all cities. **Tucson** is #1 at **$100.69 Million**, but even the lowest city in the top 10 (Yonkers) is right behind it at **$96.35 Million**. Every single region is a major multi-million dollar hub.
* **Recommendation:** Since every city sells at a massive scale, set up regional distribution hubs instead of shipping from just one central warehouse. This will lower bulk freight shipping costs and make deliveries much faster.
