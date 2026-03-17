## ETL Decisions

### Decision 1 — Date Format Standardization
*Problem:* The retail_transactions.csv contained mixed date formats (e.g., '01-12-2023' and '2023/12/01').

*Resolution:* During the ETL process, I used a Python script with pd.to_datetime() to parse all strings into a standard ISO 8601 YYYY-MM-DD format before inserting them into the dim_date and fact_sales tables.

### Decision 2 — Category Case Normalization
*Problem:* Product categories had inconsistent casing (e.g., 'electronics', 'ELECTRONICS', and 'Electronics').

*Resolution:* To ensure accurate aggregation in the Data Warehouse, I applied an INITCAP() transformation (or .title() in Python) to the category column. This grouped all variations into a single "Electronics" category.

### Decision 3 — Handling NULL Values
*Problem:* Some records in the raw data had store_name but the store_city field was NULL.

*Resolution:* I implemented a Conditional Mapping logic during the Transformation phase. I created a lookup table that mapped each unique store_name to its corresponding city. For any row where the city was missing, the ETL script extracted the city prefix from the store name and populated the store_city field, ensuring 100% geographic data coverage.