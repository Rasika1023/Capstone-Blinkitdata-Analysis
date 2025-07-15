# Capstone-Blinkitdata-Analysis

This project analyzes sales data from Blinkit (formerly Grofers) using **Python**, **SQL**, and **Power BI**. It aims to provide deep insights into product-level sales, outlet performance, and category-wise distributions to support data-driven decisions.



##  Project Overview

The Blinkit dataset was explored and analyzed using a combination of Python (Pandas, Matplotlib, Seaborn), SQL queries, and interactive dashboards in Power BI. This project was done as a cross-functional BI and analytics case study.


## Tech Stack

- **Python** (for data cleaning and visualization)
- **SQL** (for complex querying and data aggregation)
- **Power BI** (for creating interactive dashboards)
- **Jupyter Notebook** (for the data analysis pipeline)


## Key Objectives

- Perform EDA (Exploratory Data Analysis) to identify trends and patterns in sales.
- Analyze sales across various dimensions like:
  - Product Type
  - Outlet Size
  - Location Type
  - MRP vs Selling Price
- Create a percentage contribution of sales based on categorical dimensions.
- Build SQL queries to aggregate sales and compute derived KPIs.
- Develop an interactive Power BI dashboard for business storytelling.



##  KPIs Identified

- **Total Sales Revenue** – Summed across all products and outlets.
- **Average Sales per Outlet Size** – For understanding distribution.
- **% Sales Contribution by Product Type** – Helps identify top-performing categories.
- **Selling Price vs MRP Analysis** – Determines pricing efficiency.
- **Top Performing Outlets** – Based on revenue.
- **Sales by Location Type** – Urban vs Rural comparison.
- **Product Count by Category** – SKU diversity tracking.

##  Power BI Dashboard Highlights

- Dynamic filters by Outlet Size, Product Type, and Region
- KPI cards displaying total revenue and sales count
- Bar and pie charts for category-wise contribution
- Trendline analysis across time (if applicable)


##  Insights Gained

- Certain outlet sizes contribute significantly more to total sales.
- There is a skew in selling price vs MRP in specific categories.
- Product types and location types have a direct influence on performance.


##  SQL Use Cases

- Aggregation of sales by outlet size and type
- Calculation of percentage contribution using subqueries
- Sorting and filtering based on KPI thresholds


## Future Improvements

- Include time-series trend analysis if timestamp data is available
- Add predictive modeling for demand forecasting
- Automate data refresh and reporting

##  Project Structure

```plaintext
Blinkit_Analysis/
├── Blinkit_Analysis in python.ipynb       # Python analysis notebook
├── blinkit_data.sql                       # SQL queries (not uploaded yet)
├── PowerBI_Dashboard.pbix                 # Power BI dashboard (not uploaded yet)
└── README.md                              # Project documentation





