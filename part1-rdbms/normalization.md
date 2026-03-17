## Anomaly Analysis

Based on the orders_flat.csv dataset, the following anomalies were identified:

### 1. Insert Anomaly
We cannot store information about a *new customer* (e.g., Customer C010) unless they place an order. Since, order_id is likely the primary key of this flat table, a NULL order ID would violate entity integrity, preventing us from adding potential leads or sales representatives without existing transaction records.

### 2. Update Anomaly
If *Priya Sharma (C002)* changes her email address, we must update multiple rows (e.g., ORD1027 and ORD1002). If the system fails to update even one row, the database will contain conflicting contact information for the same customer.

### 3. Delete Anomaly
If we delete the record for *ORD1114, we lose all data related to **Rohan Mehta (C001)*. If this was his only transaction, his customer profile, city, and email are permanently removed from our system.


## Normalization Justification

The manager's argument that a single table is "simpler" is a common misconception that prioritizes initial setup ease over long-term data integrity and system performance. While a flat file like orders_flat.csv is easy to read at a glance, it is fundamentally flawed for a growing production system.

### Defending Normalization (3NF):

1. Elimination of Redundancy: In the flat file, every time a customer makes a purchase, their name, email, and city are duplicated. In a dataset of 1 million orders, this results in massive storage waste. By normalizing to 3NF, we store "Priya Sharma" exactly once in a customers table.

2. Data Integrity: In a denormalized state, if a Sales Rep's office address changes, we must update hundreds of rows. If the system crashes mid-update, the database enters an inconsistent state where the same person appears to work in two different offices. 3NF prevents this by ensuring a single "source of truth."

3. Logical Flexibility: Normalization allows us to track entities independently. For instance, we can add a new product to our catalog (e.g., a "Tablet") without needing a dummy order to justify its existence in the database.

While "over-engineering" is a risk in some software areas, 3NF is the industry standard for transactional (OLTP) systems to ensure that data remains clean, scalable, and reliable.

