# E-commerce Analytics with dbt and SQL Server

## Project Overview

This project demonstrates an analytics engineering workflow using **dbt Core and Microsoft SQL Server**. It transforms raw e-commerce data into structured analytical models that support customer, product, and category-level reporting.

The project focuses on modular SQL transformations, reusable Jinja macros, data quality testing, and dependency management.

## Tech Stack

* **dbt Core** — data transformation and model orchestration
* **Microsoft SQL Server** — data warehouse
* **SQL** — data cleaning, joins, aggregations, and business logic
* **Jinja** — reusable SQL generation
* **Python** — project environment and dbt execution

## Data Pipeline

The project follows a layered transformation approach:

1. **Staging:** Standardizes raw customers, orders, and products.
2. **Intermediate:** Combines order and product information and calculates order amounts.
3. **Marts:** Produces customer, product, and category-level analytical models.

## Key Models

| Model                          | Purpose                                                   |
| ------------------------------ | --------------------------------------------------------- |
| `stg_customers`                | Prepares customer data                                    |
| `stg_orders`                   | Prepares order data and classifies order status           |
| `stg_products`                 | Prepares product data                                     |
| `int_order_details`            | Joins order and product data and calculates order amounts |
| `customer_sales_summary`       | Summarizes sales at customer level                        |
| `product_performance`          | Aggregates product-level sales metrics                    |
| `category_performance`         | Summarizes performance by category                        |
| `category_group_performance`   | Aggregates results using a category mapping seed          |
| `high_value_products`          | Filters products using a configurable sales threshold     |
| `product_sales_classification` | Classifies products using a reusable Jinja macro          |
| `incremental_orders`           | Demonstrates incremental model materialization            |

## dbt Concepts Demonstrated

* Sources and `source()` references
* Model dependencies using `ref()`
* Staging, intermediate, and mart layers
* SQL joins, aggregations, and calculated columns
* Seeds for mapping data
* Variables using `var()`
* Jinja macros with parameters and conditional logic
* View and incremental materializations
* Generic and singular data tests
* Schema configuration and model documentation
* `dbt build` and dependency-aware execution

## Data Quality

The project includes tests for:

* Not-null values
* Uniqueness
* Accepted values
* Relationships between models
* Positive values
* Negative order amounts

These tests help identify data quality issues before analytical results are used.

## How to Run

After configuring dbt Core, the SQL Server adapter, and the database connection:

```bash
dbt debug
dbt seed
dbt build
```

`dbt debug` checks the connection, `dbt seed` loads the mapping CSV, and `dbt build` runs models and data tests in dependency order.

## Project Status

The project currently contains **11 models, 1 seed, and 15 data tests**. The latest build completed successfully with all 27 operations passing.

## Future Improvements

* Improve incremental loading to handle updates to existing records.
* Expand data quality checks and documentation.
* Add analytical dashboards using Power BI.
* Add automated validation through a CI/CD workflow.
