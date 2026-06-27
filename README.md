# Zepto E-Commerce Data Exploration & Analysis (SQL)

## 📌 Project Overview
This project focuses on data cleaning, exploratory data analysis (EDA), and deriving actionable business insights from an e-commerce dataset modeled after Zepto. Using PostgreSQL, I structured raw product data, handled anomalies (such as zero pricing and scale conversions), and answered key business questions regarding inventory weight, discount strategies, and revenue estimation.

## 📊 Dataset Structure
The core analysis is built around the `zepto` table, which captures real-time e-commerce product metrics:

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `sku_id` | SERIAL (PK) | Unique identifier for each SKU |
| `category` | VARCHAR | Product category |
| `name` | VARCHAR | Name of the product |
| `mrp` | NUMERIC | Maximum Retail Price |
| `discountPercent` | NUMERIC | Percentage discount applied |
| `availableQuantity` | INTEGER | Current stock inventory level |
| `discountedSellingPrice`| NUMERIC | Final selling price after discount |
| `weightInGms` | INTEGER | Weight of the product in grams |
| `outOfStock` | BOOLEAN | Stock availability status |

---

## 🛠️ Project Steps & Technical Approaches

### 1. Data Exploration & Integrity Checks
* **Row Count & Sampling:** Validated the dataset size and inspected schema consistency using `LIMIT`.
* **Null Value Identification:** Wrote comprehensive multi-column conditional checks (`IS NULL`) to isolate incomplete records.
* **Granularity Check:** Identified duplicate item listings by grouping product names and filtering via `HAVING COUNT(sku_id) > 1`.

### 2. Data Cleaning & Transformation
* **Zero-Price Anomaly Handling:** Identified and removed records where critical price points were recorded as zero to prevent skewed averages.
* **Unit Standardization**: Standardized monetary values by converting raw data from paise to Rupees.

### 3. Business Analytics & Insights (Key Queries Answered)
The analysis answers crucial retail questions divided into categories:

* **Pricing & Value Optimizations:** Evaluated top-value deals based on highest discount percentages and optimized cost-per-gram ratios for bulk packages (`weightingms > 100`).
* **Inventory & Revenue Management:** Calculated the estimated revenue potential per category by aggregating `availablequantity * discountedsellingprice`.
* **Stock & Segment Profiling:** Used conditional `CASE WHEN` logic to group inventory into distinct weight segments (`low`, `medium`, `bulk`) to better understand logistical distributions.
