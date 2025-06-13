# 🧱 Data Warehouse Project - Medallion Architecture (Bronze / Silver / Gold)

This project implements a scalable, layered **Data Warehouse** using the **Medallion Architecture** pattern — consisting of **Bronze**, **Silver**, and **Gold** layers — to structure and transform data efficiently for analytics and business intelligence.

---

## 🗂️ Project Structure

---

## 🧱 Medallion Architecture Overview

The data warehouse is built in **three logical layers**:

### 🔹 Bronze Layer (Raw Ingestion)
- **Purpose:** Load raw data exactly as received from source systems (CRM, ERP, etc.)
- **Operations:** `BULK INSERT`, basic schema enforcement, minimal transformation
- **Example Tables:** `cust_info`, `prd_info`, `sales_details`, `cust_az12`, `loc_a101`, `px_cat_g1v2`

### 🔸 Silver Layer (Cleansed and Joined)
- **Purpose:** Clean, validate, and standardize data
- **Operations:** Type casting, null handling, deduplication, joining across domains
- **Output:** Enriched, reliable datasets suitable for business logic

### 🥇 Gold Layer (Business-Ready Analytics)
- **Purpose:** Serve final aggregated datasets for BI tools, dashboards, and reporting
- **Operations:** Aggregation, summarization, calculated KPIs, dimensional modeling (star/snowflake)

---

## 🛠️ Technologies Used

- **SQL Server** (or replace with your DBMS: PostgreSQL, Snowflake, etc.)
- **T-SQL / SQL Scripts**
- **CSV Data Sources** (ERP & CRM)
- Optional: Power BI, Tableau, or Jupyter for data visualization

---

## 🚀 How to Run

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name

