# Business-Analysis-SQL-PowerBI-project
# Pricing Analysis: A 3-Year Gross Margin & Pricing Intervention Study

An end-to-end data analysis project for a coffee business, examining Gross Margin Percentage (GMP) trends across products and regions from 2023–2025, and delivering data-backed pricing recommendations.

## Business Problem

Management observed a significant decrease in profit margin across the portfolio, attributed primarily to rising Cost of Goods Sold (COGS), tariffs, and other cost pressures. The task was to review three years of order data (2023–2025) and provide clear recommendations on which products required a price increase or discontinuation.

**Specific objectives:**
- Identify all products with a Gross Margin % below 30% in Q3 2025
- Build a dashboard showing Year-over-Year GMP, Revenue by Category, Product, and Region
- Provide clear, data-backed recommendations on pricing actions

## Project Workflow

1. **Data Extraction** — Built a relational database and loaded customer, product, and order data (2023–2025) from CSV sources into PostgreSQL.
2. **Clean and Prepare** — Wrote a SQL query to union three years of order tables, join in customer and product attributes, handle missing revenue values, and produce a single unified dataset ready for analysis.
3. **Visualize and Analyze** — Loaded the unified dataset into Power BI to analyze profitability by product, category, and region, and built an interactive dashboard.

## Repository Structure
├── Datasets/              # Raw CSV source data (customers, products, orders 2023-2025)
├── Queries/                # SQL scripts for table creation and data cleaning
├── DashBoard.pbix          # Power BI dashboard (traditional format)
├── DashBoard.pbip          # Power BI dashboard (Project format, version-control friendly)
└── README.md
## Data Model

| Table | Description |
|---|---|
| `customers` | Customer ID, region, join date |
| `products` | Product ID, name, category, price, base cost |
| `orders_2023` / `orders_2024` / `orders_2025` | Order-level transactions (quantity, revenue, COGS) per year |

The three yearly order tables are combined via `UNION ALL` into a single order history, then joined against `customers` and `products` to build the final analysis-ready table.

## SQL Highlights

- **Revenue cleaning:** where `revenue` is missing, it's backfilled as `price * quantity` (`cleaned_revenue`)
- **Profit calculation:** `revenue - cogs`
- **Weekly grouping:** `date_trunc('week', order_date)` for time-based trend analysis
- **Data quality filter:** orders with a null `customer_id` are excluded from the final dataset

Full queries available in the [`Queries/`](./Queries) folder.

## Dashboard

Built in Power BI, the dashboard visualizes:
- Year-over-Year Gross Margin % trends
- Revenue and margin by Category, Product, and Region
- Products flagged below the 30% GMP threshold

Open [`DashBoard.pbix`](./DashBoard.pbix) in Power BI Desktop to explore, or view [`DashBoard.pbip`](./DashBoard.pbip) for the version-controlled project files.

## Key Findings & Pricing Recommendations

Based on the Gross Margin % analysis, the following actions were recommended:

**Discontinue or price-hike (low-margin accessories/merchandise):**
| Product | Gross Margin % |
|---|---|
| Chemex Filters (100 pack) | 14.58% (lowest overall) |
| Minimalist Keychain | 15.59% |
| Logo Hoodie (Black) | 16.34% |

**Price adjustment required:**
- **Gooseneck Electric Kettle** — price increase needed to restore GMP above the 30% threshold

These items were identified as unprofitable or structurally weak contributors to overall margin, driven largely by rising COGS.

## Tools Used

- **PostgreSQL** — data modeling, cleaning, and transformation
- **Power BI** — dashboard and visualization
- **DAX quieres** — margin calculations and metric selector in PowerBI
