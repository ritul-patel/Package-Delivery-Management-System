# 📦 Package Delivery Management System

A fully relational SQL-based database project that models a real-world package delivery company.  
It includes database design, normalization (BCNF), functional dependencies, sample data, and complex SQL queries.

> 🔥 Built for academic submission and technical interviews — structured, normalized, and query-ready.

---

## 🧠 Overview

This system helps manage:
- Users and their addresses
- Sending and receiving packages
- Shipment and tracking of packages
- Driver & vehicle management
- Payment and feedback flow

Everything is backed by a **BCNF-compliant schema** with realistic sample data.

---

## 📁 Project Structure

```bash
📦 Package-Delivery-Management-System/
├── README.md
├── schema.sql               # CREATE TABLE scripts
├── data.sql                 # Sample INSERT data
├── queries.sql              # SQL SELECT queries
├── docs/
│   ├── ERD.png              # Entity Relationship Diagram
│   ├── SchemaDiagram.png    # Relational Schema overview
│   ├── final-FD.pdf         # Functional Dependencies
│   ├── final-BCNF.pdf       # BCNF normalization check
│   └── quary.pdf            # SQL challenges and joins
```

---

## 🛠️ Setup Instructions

1. **Clone the repository:**
```bash
git clone https://github.com/ritul-patel/Package-Delivery-Management-System.git
cd Package-Delivery-Management-System
```

2. **Create and open the database:**
```sql
CREATE DATABASE package_delivery;
USE package_delivery;
```

3. **Import schema and data:**
```bash
mysql -u root -p package_delivery < schema.sql
mysql -u root -p package_delivery < data.sql
```

4. **Run the sample queries:**
Use a SQL client or:
```bash
mysql -u root -p package_delivery < queries.sql
```

---

## 🗂️ Documentation Highlights

### 🧾 Functional Dependencies (`docs/final-FD.pdf`)
Each table is analyzed for its functional dependencies. Example:
```
User: userid → name, pin, address, email, city, state
Payment: payment_id → amount, method, status
```

### 🧠 BCNF Verification (`docs/final-BCNF.pdf`)
Every table satisfies:
> If X → Y is a functional dependency, then X is a superkey.

✅ No partial or transitive dependencies.  
✅ All tables are fully in **BCNF**.

### 📐 ER Diagram & Schema
- `ERD.png`: Shows entity relationships (1:N, N:1)
- `SchemaDiagram.png`: Shows tables, attributes, keys

Use these during interviews to explain your design logic.

---

## 💾 Sample SQL Queries

Some example queries from `queries.sql`:

🔹 Users with their email addresses:
```sql
SELECT u.name, e.email
FROM User u
JOIN Email e ON u.userid = e.userid;
```

🔹 Deliveries where sender and receiver live in the same city:
```sql
SELECT u1.name AS sender, u2.name AS receiver, sh.delivery_time
FROM User u1
JOIN Send s ON u1.userid = s.sender
JOIN User u2 ON s.receiver = u2.userid
JOIN Shipment sh ON s.package_id = sh.package_id
WHERE u1.city = u2.city AND sh.delivery_time IS NOT NULL;
```

🔹 Completed payments:
```sql
SELECT u.name, sh.delivery_time
FROM Payment p
JOIN Shipment sh ON p.payment_id = sh.payment_id
JOIN User u ON p.userid = u.userid
WHERE p.status = 'Completed';
```

More advanced queries in `docs/quary.pdf`.

---

