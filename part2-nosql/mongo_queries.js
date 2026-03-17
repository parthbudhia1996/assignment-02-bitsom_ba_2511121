// OP1: insertMany() – insert all 3 documents from sample_documents.json
db.products.insertMany([/* array above */]);

// OP2: find() – retrieve all Electronics products with price > 20000
db.products.find({ "category": "Electronics" });

// OP3: find() – retrieve all Groceries expiring before 2025-01-01
db.products.find({ "category": "Groceries", "expiry_date": { "$lt": "2026-04-01" } });

// OP4: updateOne() – add a "discount_percent" field to a specific product
db.products.updateOne({ "product_id": "E101" }, { "$set": { "discount_percent": 10 } });

// OP5: createIndex() – create an index on category field and explain why
db.products.createIndex({ "category": 1 });