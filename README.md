# 📦 Package Delivery Management System

A relational database system designed for managing package delivery operations including users, payments, shipments, tracking, and feedback.  
This project covers complete database normalization (up to BCNF), schema design, SQL queries, and data population.

---

## 🧠 Overview

This system supports core functionalities like:

- User and contact management
- Sending and tracking packages
- Managing shipment and delivery details
- Payment integration
- Feedback collection

---

## 🗃️ Database Schema

### Main Tables:
- **User**(`userid`, name, city, ...)
- **Email**(`email`, `userid`)
- **Payment**(`paymentid`, `userid`, amount, status, method)
- **Feedback**(`feedback_id`, `userid`, rating, comments)
- **Send**(`sender_id`, `receiver_id`, `package_id`)
- **Package**(`package_id`, weight, status, shipment_id)
- **Shipment**(`shipment_id`, delivery_time, driver_id, vehicle_id, package_id)
- **Tracking**(`tracking_id`, `shipment_id`, current_location, time_stamp)
- **Vehicle**(`vehicle_id`, type, capacity, status)
- **Driver**(`driver_id`, vehicle_id, phone_no, license, status)

---

## 📐 Normalization (BCNF)

> **BCNF Definition**: A relation is in BCNF if for every non-trivial functional dependency (X → Y), X is a superkey.

✔️ All functional dependencies have superkeys on the left-hand side.  
✔️ No partial or transitive dependencies exist.  
✅ **Conclusion**: All tables are in **BCNF**.

---

## 🔧 SQL Scripts

### 📄 DDL (Table Creation)

All tables include:
- Proper **primary and foreign keys**
- **ON DELETE / UPDATE CASCADE**
- **CHECK** constraints

Example:

```sql
CREATE TABLE User (
  userid INT PRIMARY KEY,
  name VARCHAR(100),
  city VARCHAR(100),
  pin VARCHAR(20),
  address_line1 VARCHAR(255),
  address_line2 VARCHAR(255),
  country VARCHAR(100),
  state VARCHAR(100)
);
