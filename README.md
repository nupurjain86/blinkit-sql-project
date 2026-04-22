<p align="center">
  <img src="images/logo.webp" alt="Project Logo" width="200"/>
</p>

# 🛒 Blinkit Product Data Analysis (SQL Project)

## 📌 Overview

This project focuses on analyzing product-level data from a quick-commerce platform similar to Blinkit. The goal is to perform **data cleaning, exploration, and business-focused analysis** using SQL to derive actionable insights.

The dataset includes product details such as pricing, discounts, inventory levels, and categories.

---

## 🎯 Objectives

* Understand product distribution across categories
* Analyze pricing and discount patterns
* Estimate potential revenue
* Identify inventory risks and stock issues
* Discover value-for-money products

---

## 🗂️ Dataset Description

The dataset contains the following fields:

| Column Name            | Description                     |
| ---------------------- | ------------------------------- |
| sku_id                 | Unique product identifier       |
| category               | Product category                |
| name                   | Product name                    |
| mrp                    | Maximum Retail Price (₹)        |
| discountPercent        | Discount percentage (%)         |
| discountedSellingPrice | Final selling price (₹)         |
| availableQuantity      | Units available in inventory    |
| weightInGms            | Product weight (grams)          |
| outOfStock             | Stock availability (TRUE/FALSE) |
| quantity               | Units per package               |

---

## 🧹 Data Cleaning Steps

* Removed records with invalid pricing (MRP = 0)
* Converted price values (paise → rupees where required)
* Handled missing discount values by recalculating
* Checked for NULL values and duplicates

---

## 📊 Key Analyses Performed

### 1. Top Discounted Products

Identified products offering the highest discounts.

### 2. High-Value Out-of-Stock Items

Flagged expensive products that are unavailable.

### 3. Revenue Estimation

Calculated potential revenue per category using:
Revenue = Selling Price × Available Quantity

### 4. Low Discount Premium Products

Filtered products with high MRP but minimal discounts.

### 5. Category-wise Discount Trends

Ranked categories based on average discount offered.

### 6. Value for Money (Price per Gram)

Analyzed cost efficiency using price per gram.

### 7. Product Segmentation

Grouped products into:

* Low weight
* Medium weight
* Bulk

### 8. Inventory Weight Distribution

Computed total inventory weight per category.

---

## 🚀 Advanced Insights

* **Discount Bucketing** (Low / Medium / High)
* **Average Price per Category**
* **Most Expensive Categories**
* **Low Inventory Risk Detection**

---

## 🛠️ Tools & Technologies

* SQL (PostgreSQL / MySQL compatible)
* Data Cleaning & Transformation
* Analytical Querying

---

## 📈 Business Use Cases

* Pricing strategy optimization
* Inventory management
* Demand forecasting support
* Promotion and discount planning

---

## 📂 Project Structure

```
📦 blinkit-sql-analysis
 ┣ 📜 blinkit_analysis.sql
 ┣ 📜 README.md
 ┣ 📜 data.csv
```

---

## 💡 Key Learnings

* Writing efficient SQL queries for real-world datasets
* Performing end-to-end data analysis without external tools
* Translating raw data into business insights
* Handling imperfect and inconsistent data

---

## 🔮 Future Improvements

* Integrate Python (Pandas) for deeper analysis
* Build interactive dashboards (Power BI / Tableau)
* Automate data collection using web scraping
* Add time-based analysis (sales trends, demand spikes)

---

## 🙌 Acknowledgment

This project is created as part of a learning initiative to simulate real-world quick-commerce data analysis.

---

## 📬 Contact

Feel free to connect for feedback or collaboration!

---
