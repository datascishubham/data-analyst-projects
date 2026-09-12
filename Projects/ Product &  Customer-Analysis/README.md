# 📊 Retail Product & Customer Analysis

An end-to-end data analysis project on a multi-year UK-based online retail transactions dataset. The project identifies what drives revenue across products, customers, and countries, quantifies the impact of returns on profitability, and delivers an interactive dashboard for business stakeholders.

**Tools used:** Excel · Python (Pandas, Matplotlib, Seaborn) · SQL · Power BI

---

## 🧾 Business Problem

The business needed clear, data-backed answers to:
- Which products, customers, and countries generate the most (and least) revenue?
- What actually drives high performance — is it price, volume, or order frequency?
- Where is the business losing money due to product returns, and who/what is responsible?
- What concrete actions can improve revenue concentration and reduce losses?

---

## 🔑 Executive Summary

Revenue is highly concentrated: the **top 5 countries contribute 93.5%** of total revenue, with the **UK alone accounting for 82.74%**. Across products, customers, and countries, revenue consistently depends on the **interaction between price/value and volume** — not on either factor alone. High-priced, low-volume products and high-AOV, low-order customers frequently outperform higher-volume counterparts. A small number of products and customers are also responsible for a disproportionate share of **return-related revenue loss**. Based on these findings, the analysis recommends prioritizing inventory for high-value products, using targeted offers to convert one-time buyers into repeat customers, and directing acquisition efforts toward underperforming countries.

---


## 🛠️ Project Workflow

This project was built in four stages, each using a different tool for a specific purpose:

| Stage | Tool | What Was Done |
|---|---|---|
| **1. Data Cleaning** | Excel | Initial cleanup of raw transactional data — removing structural errors, append two sheets in one sheet, fixing formatting inconsistencies, and standardizing column values before deeper analysis |
| **2. Exploratory Analysis** | Python (Pandas, Seaborn, Matplotlib) | Deep cleaning, outlier treatment, univariate/multivariate analysis, and business-question-driven insights |
| **3. Data Querying** | SQL | Wrote aggregation and business-logic queries (top/bottom performers, revenue share, return losses, monthly trends) to validate findings and support reporting |
| **4. Visualization** | Power BI | Built an interactive dashboard summarizing KPIs, trends, and top/bottom performers for stakeholders |


## 📁 Repository Structure

```
├── data/
│   ├── raw/                          # Original dataset
│   ├── cleaned/                      # Excel-cleaned dataset
│   └── processed/
│       ├── sales.csv           # Outlier-treated valid orders (used for revenue analysis)
│       └── return.csv             # Cancelled/returned orders (used for return-loss analysis)
├── excel/
│   └── data_cleaning.xlsx            # Initial cleaning steps
├── notebooks/
│   └── product_customer_analysis.ipynb   # Full Python EDA + business-question analysis
├── sql/
│   └── queries.sql                   # SQL queries for KPIs, top/bottom performers, returns, trends
├── dashboard/
│   └── retail_dashboard.pbix         # Power BI dashboard file
├── images/
│   └── dashboard_preview.png         # Dashboard screenshot
└── README.md
```
---

## 🔍 Analysis Approach (Python)

1. **Data Cleaning** — handled missing customer IDs, cancelled/returned orders, and duplicate records
2. **Outlier Handling** — IQR-based treatment on quantity and revenue
3. **Univariate & Multivariate Analysis** — distribution checks and relationships between key variables
4. **Product-Level Analysis** — top/bottom products by revenue, orders, and quantity
5. **Customer-Level Analysis** — top/bottom customers by revenue, orders, quantity, and average order value (AOV)
6. **Country-Level Analysis** — revenue concentration and contribution by country
7. **Returns Analysis** — products and customers responsible for the highest return-related losses

Each business question follows a consistent framework: **Approach → Finding → Why → Insight → Recommendation.**

---

## 🗄️ SQL

SQL was used to independently validate the Python findings and to answer the same business questions using set-based queries — including revenue ranking, percentage-share calculations (window functions), return-loss aggregation, and monthly revenue trends.

See [`sql/queries.sql`](sql/queries.sql) for the full query set.

---

## 📊 Dashboard

An interactive Power BI dashboard was built to let stakeholders explore performance without reading the full analysis.

**KPI Cards:** Total Revenue · Return Loss · Net Revenue · Total Orders · Total Customers · Average Order Value

**Pages:**
- **Overview** — KPIs, monthly revenue trend, top 5 products/customers/countries at a glance
- **Product Analysis** — top/bottom products by revenue, orders, and quantity
- **Customer Analysis** — top/bottom customers, AOV distribution, one-time vs. repeat customers
- **Country Analysis** — revenue by country and % contribution
- **Returns Analysis** — return losses by product and customer

![Dashboard Preview](images/dashboard_preview.png)

---

## 📌 Key Findings

- Revenue is **highly concentrated** — the top 5 countries contribute **93.5%** of total revenue; the UK alone contributes **82.74%**
- Revenue is driven by the **interaction between price and volume**, not either factor alone
- A **small number of products and customers** are responsible for the majority of revenue — and, separately, for the majority of return-related losses
- Customer value depends more on **order frequency and average order value** than on raw order count

---

## ✅ Recommendations

- Maintain strong inventory for high-revenue products; investigate low-performing and high-return products for quality issues
- Use targeted, time-limited offers to convert one-time buyers into repeat customers, and upsell frequent customers toward higher-value products
- Focus customer acquisition efforts on low-revenue countries with small customer bases, while ensuring supply meets demand in top-revenue markets


## 🚀 How to Run

```bash
# Clone the repository
git clone <https://github.com/datascishubham/data-analyst-projects>

# Install dependencies
pip install pandas numpy matplotlib seaborn

# Open the notebook
jupyter notebook notebooks/product_customer_analysis.ipynb
```

To explore the dashboard, open `dashboard/retail_dashboard.pbix` in Power BI Desktop.

---

## 📬 Contact

**[Shubham Kumar]**
[[LinkedIn](https://www.linkedin.com/in/shubham-kumar-5488a8267/)] · [Shubham993109@gmail.com] · [Portfolio]



