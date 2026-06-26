# E-Commerce Analytics Pipeline

A production-style data pipeline built with dbt (Data Build Tool) and DuckDB, 
demonstrating modern analytics engineering practices.

## What This Project Does

Transforms raw e-commerce data (customers and orders) into clean, tested, 
and documented analytical models ready for business intelligence tools.

## Pipeline Architecture

raw data → staging models → mart models

- **Staging:** Cleans and renames raw source tables
- **Marts:** Joins and aggregates data to answer business questions

## Models

| Model | Layer | Description |
|---|---|---|
| `stg_customers` | Staging | Cleaned customer data |
| `stg_orders` | Staging | Cleaned order data |
| `customer_orders` | Mart | One row per customer with total orders and lifetime value |

## Data Quality Tests

Every model has automated tests enforcing:
- No duplicate primary keys
- No null values on critical columns

## Tech Stack

- **dbt Core** — data transformation and testing
- **DuckDB** — local analytical database
- **Git** — version control

## How to Run

```bash
pip install dbt-duckdb
dbt seed      # load raw data
dbt build     # run models + tests
dbt docs generate && dbt docs serve  # view documentation
```