# Zepto SQL Data Analysis Project

## 📌 Project Overview
This project analyzes a retail/e-commerce dataset inspired by Zepto using SQL.  
The goal is to perform data cleaning, exploratory analysis, and answer business questions related to pricing, discounts, inventory, and category-level performance.

This project demonstrates practical SQL skills such as filtering, aggregation, grouping, conditional logic, and basic business analysis.

---

## 🗂 Dataset Description
The dataset contains product-level information such as:

- Category  
- Product name  
- MRP  
- Discount percentage  
- Discounted selling price  
- Available quantity  
- Weight (in grams)  
- Stock status  

---

## 🧹 Data Cleaning Performed
- Fixed incorrect data types for price-related columns  
- Removed invalid records where MRP = 0  
- Standardized price units (converted paise to rupees)  
- Basic validation checks on stock and quantity columns  

---

## ❓ Business Questions Answered

**Q1. Top 10 best-value products based on discount percentage**  
**Insight:**  
A small set of products offer significantly higher discounts, indicating targeted promotional strategies to attract customers.

**Q2. High MRP products that are out of stock**  
**Insight:**  
Several high-priced products are frequently out of stock, which may indicate demand-supply mismatch or inventory planning issues.

**Q3. Estimated revenue by category**  
**Insight:**  
A few categories contribute the majority of estimated revenue, making them key focus areas for sales and marketing strategies.

**Q4. Products with MRP > ₹500 and discount < 10%**  
**Insight:**  
Premium products tend to have lower discounts, suggesting a premium pricing strategy.

**Q5. Top 5 categories by average discount percentage**  
**Insight:**  
Certain categories consistently offer higher discounts, possibly to drive volume sales or clear inventory.

**Q6. Price per gram analysis for products above 100g**  
**Insight:**  
Bulk products generally provide better value per gram compared to smaller pack sizes.

**Q7. Categorizing products into Low, Medium, Bulk by weight**  
**Insight:**  
Most products fall under Low and Medium weight categories, indicating demand for smaller pack sizes in quick-commerce platforms.

**Q8. Total inventory weight per category**  
**Insight:**  
Inventory is unevenly distributed across categories, showing which categories are stocked more heavily.

**Q9. Revenue share percentage by category**  
**Insight:**  
A small number of categories contribute a large share of total revenue, highlighting the importance of category-level prioritization.

---

## 🛠 Tools & Skills Used
- MySQL (MySQL Workbench)  
- SQL (SELECT, WHERE, GROUP BY, HAVING, ORDER BY)  
- Aggregations (SUM, AVG, COUNT)  
- CASE WHEN logic  
- Basic data cleaning  

---
## ▶️ How to Run This Project
1. Import the dataset into MySQL Workbench  
2. Open `zepto_sql_analysis.sql`  
3. Run queries section by section

---

## 🚀 Key Learnings
- Writing business-focused SQL queries  
- Cleaning and validating real-world datasets  
- Translating SQL outputs into business insights  
- Structuring a SQL project for portfolio presentation  

---

## 📈 Next Improvements (Future Scope)
- Add window functions for ranking products within categories  
- Create Power BI dashboard on top of this dataset  
- Add time-based analysis if date data is available  

---

## 📎 Disclaimer
This is a learning project using a sample dataset inspired by real-world e-commerce data.  
It is not affiliated with Zepto or any real company.
