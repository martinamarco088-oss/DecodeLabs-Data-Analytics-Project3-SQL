# Sales & Profit Data Analysis (SQL)


## 📌 Project Overview
This project focuses on executing a comprehensive data analysis for an e-commerce platform using **MySQL Workbench**. The main objective was to transform raw, transactional data into actionable business insights by applying progressive levels of SQL querying. 

The analysis covers crucial business dimensions, including product performance, marketing channel effectiveness (referral sources), order fulfillment statuses, customer spending behaviors, and profit margin optimizations.

---

## 🛠️ Tech Stack & Skills Demonstrated
* **Database Management System:** MySQL
* **Tools:** MySQL Workbench, Microsoft Excel (Data Cleaning)
* **SQL Concepts Applied:**
  * Advanced Data Aggregations (`SUM`, `COUNT`, `AVG`, `ROUND`)
  * Data Filtering & Precision (`WHERE`, `HAVING`, `LIMIT`)
  * Grouping and Sorting (`GROUP BY`, `ORDER BY`)
  * Advanced Analytics (Self-Joins, Subqueries, Type Casting with `STR_TO_DATE`)
  * Conditional Logic (`CASE WHEN`)

---

## 📊 Database Schema & Structure
The analysis was conducted on a unified table named `orders` within the `decodelabs_project` database. The structure consists of the following attributes:

* `OrderID` (VARCHAR, Primary Key) - Unique identifier for each transaction.
* `CustomerID` (VARCHAR) - Unique identifier for customers.
* `Product` (VARCHAR) - Name of the purchased item.
* `Quantity` (INT) - Number of items ordered.
* `UnitPrice` & `TotalPrice` (DECIMAL) - Financial transactional values.
* `OrderStatus` (VARCHAR) - Shipping and delivery progress (Delivered, Shipped, Cancelled, etc.).
* `ReferralSource` (VARCHAR) - The marketing acquisition channel (Instagram, Facebook, Email, etc.).
* `Net-TotalProfit` (DECIMAL) - Net profit gained from the order.

---

## 🔍 Key Insights & Analysis Levels

The project script is structured systematically across 8 analytical levels:

1. **Level 1: Customer Relationships:** Leveraged a structured Self-Join (subquery mapping) to tie detailed order rows back to the customer's total historical spending profile without data duplication.
2. **Level 2: Filtering Performance:** Quantified total operational losses by isolating and counting cancelled orders, alongside tracking high-ticket sales exceeding $2,000.
3. **Level 3 & 4: Volume & Channel Efficiency:** Grouped core sales data by product to locate top revenue drivers and filtered marketing channels using `HAVING` to isolate high-performing acquisition sources bringing in over $30,000.
4. **Level 5: Time-Series Tracking:** Converted string variables into clean date metrics to isolate the Top 3 highest-earning business months.
5. **Level 6 & 7: Customer Behavior & Profitability:** Highlighted the top 10 VIP customers by overall expenditure, analyzed customer concentration across delivery statuses, and calculated pure **Profit Margin Percentages** per product.
6. **Level 8: Business Summary:** Created a final, high-level executive dashboard query summarizing unique counts, cumulative revenues, total profits, and average order values (AOV).

---

## 🚀 How to Run the Project
1. Clone or download the `Project3_SQL_Queries.sql` script file from this repository.
2. Open **MySQL Workbench** and connect to your local instance.
3. Import the cleaned dataset `.csv` file into a table named `orders` inside your schema.
4. Run the script to generate all analytics and executive summaries.

---
**Developed by:** Martina Marco  
**Role:** Data Analytics Intern  
**Project:** Project 3 - DecodeLabs Training
