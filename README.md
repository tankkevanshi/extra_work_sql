# 💊 Pharma Management System

<p align="center">
  <b>MySQL | SQL | Database Management | Data Analysis</b>
</p>

<p align="center">
  A relational database project designed to manage pharmacy customers, medicines, billing, and transaction details.
</p>

---

## 📌 About The Project

**Pharma Management System** is a MySQL-based relational database project developed to simulate the core data operations of a pharmacy.

The system manages four major entities:

* 👤 Customers
* 💊 Medicines
* 🧾 Bills
* 📋 Bill Details

The project focuses on writing and executing practical SQL queries for **database creation, data insertion, data modification, data retrieval, filtering, sorting, aggregation, and analysis**.

It is designed as a practical SQL project for strengthening database concepts and building a portfolio for **SQL, Data Analytics, and Data Science** roles.

---

## 🎯 Project Goals

The project was developed to practice:

* Relational database design
* SQL database creation
* Table creation
* Data insertion
* Data modification
* Data deletion
* Data retrieval
* Conditional filtering
* Sorting
* Aggregate calculations
* Date-based queries
* Database validation
* SQL debugging

---

# 🏗️ System Architecture

```text
                         ┌─────────────────┐
                         │    Customers    │
                         │─────────────────│
                         │ Customer_id PK  │
                         │ Name            │
                         │ Email           │
                         │ Address         │
                         └────────┬────────┘
                                  │
                                  │ Customer_id
                                  ▼
                         ┌─────────────────┐
                         │      Bills      │
                         │─────────────────│
                         │ Bill_id PK      │
                         │ Customer_id     │
                         │ Bill_date       │
                         │ Total_amount    │
                         └────────┬────────┘
                                  │
                                  │ Bill_id
                                  ▼
                    ┌─────────────────────────┐
                    │     Bill_Deatails       │
                    │─────────────────────────│
                    │ Bill_deatailsid PK      │
                    │ Bill_id                 │
                    │ Medicine_id             │
                    │ Quantity                │
                    │ Subtotal                │
                    └────────────┬────────────┘
                                 │
                                 │ Medicine_id
                                 ▼
                         ┌─────────────────┐
                         │    Medicines    │
                         │─────────────────│
                         │ Medicine_id PK  │
                         │ Medicine_name   │
                         │ Price           │
                         │ Stock           │
                         └─────────────────┘
```

---

# 🗃️ Database Schema

## 👤 Customers

Stores customer information.

| Column        | Type         | Key |
| ------------- | ------------ | --- |
| `Customer_id` | INT          | PK  |
| `Name`        | VARCHAR(100) | —   |
| `Email`       | VARCHAR(100) | —   |
| `Address`     | VARCHAR(200) | —   |

---

## 💊 Medicines

Stores medicine inventory.

| Column          | Type          | Key |
| --------------- | ------------- | --- |
| `Medicine_id`   | INT           | PK  |
| `Medicine_name` | VARCHAR(100)  | —   |
| `Price`         | DECIMAL(10,2) | —   |
| `Stock`         | INT           | —   |

---

## 🧾 Bills

Stores customer billing information.

| Column         | Type          | Key        |
| -------------- | ------------- | ---------- |
| `Bill_id`      | INT           | PK         |
| `Customer_id`  | INT           | FK concept |
| `Bill_date`    | DATE          | —          |
| `Total_amount` | DECIMAL(10,2) | —          |

---

## 📋 Bill_Deatails

Stores individual medicines purchased in each bill.

> The table name follows the naming used in the original SQL project.

| Column            | Type          | Key        |
| ----------------- | ------------- | ---------- |
| `Bill_deatailsid` | INT           | PK         |
| `Bill_id`         | INT           | FK concept |
| `Medicine_id`     | INT           | FK concept |
| `Quantity`        | INT           | —          |
| `Subtotal`        | DECIMAL(10,2) | —          |

---

# 🔑 Key Relationships

### Customer → Bills

```text
One Customer
      ↓
Multiple Bills
```

### Bill → Bill Details

```text
One Bill
   ↓
Multiple Bill Details
```

### Medicine → Bill Details

```text
One Medicine
      ↓
Can appear in Multiple Bills
```

This creates a relational structure that connects **customers, transactions, and inventory**.

---

# 🧠 SQL Concepts Covered

### Database Operations

```text
CREATE DATABASE
CREATE TABLE
USE DATABASE
SHOW TABLES
DESC TABLE
```

### Data Manipulation

```text
INSERT
UPDATE
DELETE
```

### Data Retrieval

```text
SELECT
WHERE
ORDER BY
```

### Data Analysis

```text
COUNT()
SUM()
AVG()
MIN()
MAX()
```

### Date Operations

```text
CURDATE()
INTERVAL
DATE filtering
```

---

# 🔎 Query Examples

## Retrieve all medicines

```sql
SELECT *
FROM Medicines;
```

## Find medicines above a specific price

```sql
SELECT *
FROM Medicines
WHERE Price > 100;
```

## Display medicines from highest to lowest price

```sql
SELECT *
FROM Medicines
ORDER BY Price DESC;
```

## Find available medicines

```sql
SELECT *
FROM Medicines
WHERE Stock > 0;
```

## Count customers

```sql
SELECT COUNT(*) AS Total_Customers
FROM Customers;
```

## Find highest bill

```sql
SELECT MAX(Total_amount) AS Highest_Bill
FROM Bills;
```

## Find average bill

```sql
SELECT AVG(Total_amount) AS Average_Bill
FROM Bills;
```

---

# 📊 Data Analysis Capabilities

The database can be used to analyze:

| Analysis               | SQL Concept           |
| ---------------------- | --------------------- |
| Total customers        | `COUNT()`             |
| Total revenue          | `SUM()`               |
| Highest bill           | `MAX()`               |
| Lowest bill            | `MIN()`               |
| Average bill           | `AVG()`               |
| Expensive medicines    | `WHERE`               |
| Medicine price ranking | `ORDER BY`            |
| Recent transactions    | Date functions        |
| Stock availability     | Conditional filtering |

---

# ⚙️ Installation

## 1. Clone Repository

```bash
git clone https://github.com/tankkevanshi/extra_work_sql.git
```

## 2. Open Project

```bash
cd extra_work_sql
```

## 3. Start MySQL

```bash
mysql -u root -p
```

## 4. Create Database

```sql
CREATE DATABASE Pharma_db;
```

## 5. Select Database

```sql
USE Pharma_db;
```

## 6. Execute SQL File

```bash
mysql -u root -p Pharma_db < Pharma.sql
```

---

# 🔍 Verify Installation

Check database:

```sql
SHOW DATABASES;
```

Check tables:

```sql
SHOW TABLES;
```

Check table structure:

```sql
DESC Customers;
DESC Medicines;
DESC Bills;
DESC Bill_Deatails;
```

Check records:

```sql
SELECT * FROM Customers;
SELECT * FROM Medicines;
SELECT * FROM Bills;
SELECT * FROM Bill_Deatails;
```

---

# 📁 Project Structure

```text
extra_work_sql/
│
├── Pharma.sql
│
└── README.md
```

---

# 🚀 Future Improvements

The project can be upgraded into a complete pharmacy-management application.

### Database Improvements

* [ ] Add Foreign Key constraints
* [ ] Add NOT NULL constraints
* [ ] Add UNIQUE constraints
* [ ] Add CHECK constraints
* [ ] Improve table/column naming
* [ ] Normalize database structure
* [ ] Add indexes

### Advanced SQL

* [ ] INNER JOIN
* [ ] LEFT JOIN
* [ ] RIGHT JOIN
* [ ] FULL JOIN concepts
* [ ] Subqueries
* [ ] Correlated Subqueries
* [ ] CTEs
* [ ] CASE statements
* [ ] GROUP BY
* [ ] HAVING
* [ ] Window Functions

### Advanced Database Features

* [ ] Views
* [ ] Stored Procedures
* [ ] Stored Functions
* [ ] Triggers
* [ ] Transactions
* [ ] Query Optimization

### Pharmacy Features

* [ ] Medicine expiry management
* [ ] Supplier management
* [ ] Prescription records
* [ ] Low-stock alerts
* [ ] Customer purchase history
* [ ] Monthly sales reports
* [ ] Revenue dashboard
* [ ] Best-selling medicine analysis

---

# 📈 Possible Future Analytics Dashboard

With additional SQL and visualization tools, this database could support a dashboard containing:

```text
┌──────────────────────────────────────────┐
│          PHARMA ANALYTICS                │
├──────────────────────────────────────────┤
│ Total Customers      │ Total Medicines   │
│ Total Revenue        │ Total Bills       │
├──────────────────────────────────────────┤
│ Monthly Revenue Trend                    │
│                                          │
├──────────────────────────────────────────┤
│ Top Selling Medicines                   │
│ Low Stock Medicines                     │
│ Highest Value Customers                 │
└──────────────────────────────────────────┘
```

Possible visualization tools:

* Power BI
* Tableau
* Python
* Pandas
* Matplotlib

---

# 💼 Career Relevance

This project demonstrates foundational skills relevant to:

* **SQL Developer**
* **Data Analyst**
* **Junior Data Analyst**
* **Database Developer**
* **Business Intelligence Analyst**
* **Data Science Intern**
* **Database Intern**

It can also be extended into a larger **Data Analytics / Data Science portfolio project**.

---

# 🧪 Project Level

```text
Project Type   : SQL / Relational Database
Database       : MySQL
Domain         : Pharmacy Management
Level          : Intermediate
Extension      : Advanced
Status         : Completed
```

---

# 🛠️ Skills Demonstrated

```text
SQL
MySQL
Database Design
Relational Databases
DDL
DML
CRUD
Primary Keys
Data Filtering
Data Sorting
Aggregate Functions
Date Functions
Data Validation
SQL Debugging
Database Analysis
```

---

# 🔗 Project Links

**Repository:**
`https://github.com/tankkevanshi/extra_work_sql`

**Main SQL File:**
`Pharma.sql`

---

# 👩‍💻 Author

## Kevanshi Tank

GitHub: **@tankkevanshi**

---

# ⭐ Support

If you find this project useful, consider giving the repository a ⭐ and exploring the other SQL projects.

---

## 📜 License

This project is created for **educational, learning, and portfolio purposes**.
