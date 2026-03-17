## Architecture Recommendation

For a fast-growing food delivery startup handling GPS logs (streaming), images (unstructured), and transactions (structured), I recommend a Data Lakehouse architecture (such as Databricks or AWS Lake Formation with Iceberg/Delta Lake).

Reasons for this choice:

1. Support for Diverse Data Types: A traditional Data Warehouse struggles with unstructured data like restaurant menu images or raw GPS coordinate streams. A Lakehouse handles these in a low-cost Data Lake (S3/GCS) while still providing a structured layer for SQL analytics.

2. Real-time Analytics: GPS location logs require high-velocity ingestion. The Lakehouse allows us to perform "streaming-to-table" operations, enabling real-time driver tracking and estimated delivery time (ETA) calculations that a standard Data Lake cannot easily support.

3. Cost-Effective Scaling: Transactional data (orders) and analytical data (user reviews) can be stored in open formats like Parquet. This allows the startup to scale storage independently from compute power, significantly reducing costs compared to a traditional monolithic Data Warehouse as the volume of GPS data grows exponentially.

By choosing a Lakehouse, the startup gets the performance and ACID transactions of a Warehouse with the flexibility and low cost of a Data Lake.