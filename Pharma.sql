Last login: Sun Oct  4 07:51:10 on ttys000
kevanshi@Kevanshis-MacBook-Pro ~ % mysql -u root -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
kevanshi@Kevanshis-MacBook-Pro ~ % mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 14
Server version: 9.7.2 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> USE Pharma_db;
Database changed
mysql> CREATE TABLE Customers (
    -> Customer_id INT PRIMARY KEY,
    -> Name VARCHAR(100),
    -> Email VARCHAR(100),
    -> Address VARCHAR(200)
    -> );
Query OK, 0 rows affected (0.016 sec)

mysql> DESC Customers;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| Customer_id | int          | NO   | PRI | NULL    |       |
| Name        | varchar(100) | YES  |     | NULL    |       |
| Email       | varchar(100) | YES  |     | NULL    |       |
| Address     | varchar(200) | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
4 rows in set (0.023 sec)

mysql> CREATE TABLE Bills (
    -> Bill_id INT PRIMARY KEY,
    -> Customer_id INT,
    -> Bill_date DATE,
    -> Total_amount DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.008 sec)

mysql> DESC Bills;
+--------------+---------------+------+-----+---------+-------+
| Field        | Type          | Null | Key | Default | Extra |
+--------------+---------------+------+-----+---------+-------+
| Bill_id      | int           | NO   | PRI | NULL    |       |
| Customer_id  | int           | YES  |     | NULL    |       |
| Bill_date    | date          | YES  |     | NULL    |       |
| Total_amount | decimal(10,2) | YES  |     | NULL    |       |
+--------------+---------------+------+-----+---------+-------+
4 rows in set (0.002 sec)

mysql> CREATE TABLE Medicines (
    -> Medicine_id INT PRIMARY KEY,
    -> Medicine_name VARCHAR(100),
    -> Price DECIMAL (10,2),
    -> Stock INT
    -> );
Query OK, 0 rows affected (0.011 sec)

mysql> DESC Medicines;
+---------------+---------------+------+-----+---------+-------+
| Field         | Type          | Null | Key | Default | Extra |
+---------------+---------------+------+-----+---------+-------+
| Medicine_id   | int           | NO   | PRI | NULL    |       |
| Medicine_name | varchar(100)  | YES  |     | NULL    |       |
| Price         | decimal(10,2) | YES  |     | NULL    |       |
| Stock         | int           | YES  |     | NULL    |       |
+---------------+---------------+------+-----+---------+-------+
4 rows in set (0.002 sec)

mysql> CREATE TABLE Bill_Deatails (
    -> Bill_deatailsid INT PRIMARY KEY,
    -> Bill_id INT,
    -> Medicine_id INT,
    -> Quantity INT,
    -> Subtotal DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.012 sec)

mysql> DESC Bill_Deatails;
+-----------------+---------------+------+-----+---------+-------+
| Field           | Type          | Null | Key | Default | Extra |
+-----------------+---------------+------+-----+---------+-------+
| Bill_deatailsid | int           | NO   | PRI | NULL    |       |
| Bill_id         | int           | YES  |     | NULL    |       |
| Medicine_id     | int           | YES  |     | NULL    |       |
| Quantity        | int           | YES  |     | NULL    |       |
| Subtotal        | decimal(10,2) | YES  |     | NULL    |       |
+-----------------+---------------+------+-----+---------+-------+
5 rows in set (0.003 sec)

mysql> INSERT INTO Customers (Customer_id, Name, Email, Address)VALUES
    ->  INSERT INTO Customers (Customer_id, Name, Email, Address)VALUES
    -> ;;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'INSERT INTO Customers (Customer_id, Name, Email, Address)VALUES' at line 2
ERROR: 
No query specified

mysql>  INSERT INTO Customers (Customer_id, Name, Email, Address)VALUES
    -> (1, 'Rahul', 'rahul@gmail.com', 'Surat'),
    -> (2, 'Priya', 'priya@gmail.com', 'Ahmedabad'),
    -> (3, 'Amit', 'amit@gmail.com', 'Vadodara'),
    -> (4, 'Neha', 'neha@gmail.com', 'Rajkot'),
    -> (5, 'Karan', 'karan@gmail.com', 'Mumbai');
Query OK, 5 rows affected (0.020 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Customers;
+-------------+-------+-----------------+-----------+
| Customer_id | Name  | Email           | Address   |
+-------------+-------+-----------------+-----------+
|           1 | Rahul | rahul@gmail.com | Surat     |
|           2 | Priya | priya@gmail.com | Ahmedabad |
|           3 | Amit  | amit@gmail.com  | Vadodara  |
|           4 | Neha  | neha@gmail.com  | Rajkot    |
|           5 | Karan | karan@gmail.com | Mumbai    |
+-------------+-------+-----------------+-----------+
5 rows in set (0.002 sec)

mysql> INSERT INTO Bills(Bill_id, Customer_id, Bill_date, Total_amount) VALUES
    -> (101, 1, '2026-09-01', 1500.00),
    -> (102, 2, '2026-09-05', 2500.00),
    -> (103, 3, '2026-09-10', 1800.00),
    -> (104, 4, '2026-09-15', 3200.00),
    -> (105, 5, '2026-09-20', 2100.00);
Query OK, 5 rows affected (0.002 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Bills;
+---------+-------------+------------+--------------+
| Bill_id | Customer_id | Bill_date  | Total_amount |
+---------+-------------+------------+--------------+
|     101 |           1 | 2026-09-01 |      1500.00 |
|     102 |           2 | 2026-09-05 |      2500.00 |
|     103 |           3 | 2026-09-10 |      1800.00 |
|     104 |           4 | 2026-09-15 |      3200.00 |
|     105 |           5 | 2026-09-20 |      2100.00 |
+---------+-------------+------------+--------------+
5 rows in set (0.002 sec)

mysql> INSERT INTO Medicines (Medicine_id, Medicine_name, Price, Stock) VALUES
    -> (101, 'Paracetamol', 50.00, 100),
    -> (102, 'Amoxicillin', 120.00, 50),
    -> (103, 'Cetirizine', 80.00, 75),
    -> (104, 'Azithromycin', 150.00, 40),
    -> (105, 'Ibuprofen', 90.00, 60);
Query OK, 5 rows affected (0.002 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Medicines;
+-------------+---------------+--------+-------+
| Medicine_id | Medicine_name | Price  | Stock |
+-------------+---------------+--------+-------+
|         101 | Paracetamol   |  50.00 |   100 |
|         102 | Amoxicillin   | 120.00 |    50 |
|         103 | Cetirizine    |  80.00 |    75 |
|         104 | Azithromycin  | 150.00 |    40 |
|         105 | Ibuprofen     |  90.00 |    60 |
+-------------+---------------+--------+-------+
5 rows in set (0.001 sec)

mysql> INSERT INTO Bill_deatils (Bill_deatilsid, Bill_id, Medicine_id, Quantity, Sub_total) VALUES
    -> (1, 101, 101, 2, 100.00),
    -> (2, 102, 102, 3, 360.00),
    -> (3, 103, 103, 2, 160.00),
    -> (4, 104, 104, 1, 150.00),
    -> (5, 105, 105, 4, 360.00);
ERROR 1146 (42S02): Table 'pharma_db.bill_deatils' doesn't exist
mysql> INSERT INTO Bill_Deatils (Bill_deatailsid, Bill_id, Medicine_id, Quantity, Subtotal) VALUES
    -> (1, 101, 101, 2, 100.00),
    -> (2, 102, 102, 3, 360.00),
    -> (3, 103, 103, 2, 160.00),
    -> (4, 104, 104, 1, 150.00),
    -> (5, 105, 105, 4, 360.00);
ERROR 1146 (42S02): Table 'pharma_db.bill_deatils' doesn't exist
mysql> INSERT INTO Bill_Deatails
    -> (Bill_deatailsid, Bill_id, Medicine_id, Quantity, Subtotal)
    -> VALUES
    -> (1, 101, 101, 2, 100.00),
    -> (2, 102, 102, 3, 360.00),
    -> (3, 103, 103, 2, 160.00),
    -> (4, 104, 104, 1, 150.00),
    -> (5, 105, 105, 4, 360.00);
Query OK, 5 rows affected (0.003 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Bill_Deatails;
+-----------------+---------+-------------+----------+----------+
| Bill_deatailsid | Bill_id | Medicine_id | Quantity | Subtotal |
+-----------------+---------+-------------+----------+----------+
|               1 |     101 |         101 |        2 |   100.00 |
|               2 |     102 |         102 |        3 |   360.00 |
|               3 |     103 |         103 |        2 |   160.00 |
|               4 |     104 |         104 |        1 |   150.00 |
|               5 |     105 |         105 |        4 |   360.00 |
+-----------------+---------+-------------+----------+----------+
5 rows in set (0.001 sec)

mysql> UPDATE Customers SET Address = 'Surat'
    -> WHERE Customer_id = 2;
Query OK, 1 row affected (0.006 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM Customers WHERE
    -> Customer_id = 3;
Query OK, 1 row affected (0.003 sec)

mysql> SELECT * FROM Customers WHERE Name = 'Priya';
+-------------+-------+-----------------+---------+
| Customer_id | Name  | Email           | Address |
+-------------+-------+-----------------+---------+
|           2 | Priya | priya@gmail.com | Surat   |
+-------------+-------+-----------------+---------+
1 row in set (0.002 sec)

mysql> SELECT * Bills WHERE
    -> Customer_id = 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Bills WHERE
Customer_id = 1' at line 1
mysql> SELECT * FROM Bills
    -> WHERE
    -> Customer_id = 1;
+---------+-------------+------------+--------------+
| Bill_id | Customer_id | Bill_date  | Total_amount |
+---------+-------------+------------+--------------+
|     101 |           1 | 2026-09-01 |      1500.00 |
+---------+-------------+------------+--------------+
1 row in set (0.001 sec)

mysql> UPDATE Bills SET Total_Amount = 3000.00
    -> WHERE Bill_id = 101;
Query OK, 1 row affected (0.003 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM Bills WHERE Bill_id = 104;
Query OK, 1 row affected (0.002 sec)

mysql> SELECT * FROM Bills WHERE 
    -> Bill_date >= CURDATE() - INTERVAL 30 DAY;
+---------+-------------+------------+--------------+
| Bill_id | Customer_id | Bill_date  | Total_amount |
+---------+-------------+------------+--------------+
|     102 |           2 | 2026-09-05 |      2500.00 |
|     103 |           3 | 2026-09-10 |      1800.00 |
|     105 |           5 | 2026-09-20 |      2100.00 |
+---------+-------------+------------+--------------+
3 rows in set (0.006 sec)

mysql> SELECT
    -> MAX(Total_amount) AS Highest_Bill,
    -> MIN(Total_amount) AS Lowest_Bill,
    -> AVG(Total_amount) AS Average_Bill
    -> FROM Bills;
+--------------+-------------+--------------+
| Highest_Bill | Lowest_Bill | Average_Bill |
+--------------+-------------+--------------+
|      3000.00 |     1800.00 |  2350.000000 |
+--------------+-------------+--------------+
1 row in set (0.008 sec)

mysql> SELECT * FROM
    -> Medicines
    -> ORDER BY Proce
    -> DESC;
ERROR 1054 (42S22): Unknown column 'Proce' in 'order clause'
mysql> SELECT * FROM
    -> Medicines
    -> ORDER BY Price
    -> DESC;
+-------------+---------------+--------+-------+
| Medicine_id | Medicine_name | Price  | Stock |
+-------------+---------------+--------+-------+
|         104 | Azithromycin  | 150.00 |    40 |
|         102 | Amoxicillin   | 120.00 |    50 |
|         105 | Ibuprofen     |  90.00 |    60 |
|         103 | Cetirizine    |  80.00 |    75 |
|         101 | Paracetamol   |  50.00 |   100 |
+-------------+---------------+--------+-------+
5 rows in set (0.001 sec)

mysql> UPDATE Medicines SET Price = 60.--
    -> WHERE Medicine_id = 1;
Query OK, 0 rows affected (0.001 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> DELETE FROM Medicines WHERE Stock = 0;
Query OK, 0 rows affected (0.000 sec)

mysql> SELECT * FROM Medicines WHERE price BETWEEN 50 AND 500;
+-------------+---------------+--------+-------+
| Medicine_id | Medicine_name | Price  | Stock |
+-------------+---------------+--------+-------+
|         101 | Paracetamol   |  50.00 |   100 |
|         102 | Amoxicillin   | 120.00 |    50 |
|         103 | Cetirizine    |  80.00 |    75 |
|         104 | Azithromycin  | 150.00 |    40 |
|         105 | Ibuprofen     |  90.00 |    60 |
+-------------+---------------+--------+-------+
5 rows in set (0.002 sec)

mysql> SELECT MAX(Price) AS Most_Expensive_price,
    -> MIN(price) AS Cheapest_Price
    -> FROM Medicines;
+----------------------+----------------+
| Most_Expensive_price | Cheapest_Price |
+----------------------+----------------+
|               150.00 |          50.00 |
+----------------------+----------------+
1 row in set (0.000 sec)

mysql> SELECT Medicine_name, price
    -> FROM Medicines
    -> WHERE Price = (SELECT MAX(Price) FROM Medicines)
    -> OR Price = (SELECT MIN(Price) FROM Medicines);
+---------------+--------+
| Medicine_name | price  |
+---------------+--------+
| Paracetamol   |  50.00 |
| Azithromycin  | 150.00 |
+---------------+--------+
2 rows in set (0.005 sec)

mysql> SELECT * FROM Bill_Deatails
    -> WHERE Bill_id = 101;
+-----------------+---------+-------------+----------+----------+
| Bill_deatailsid | Bill_id | Medicine_id | Quantity | Subtotal |
+-----------------+---------+-------------+----------+----------+
|               1 |     101 |         101 |        2 |   100.00 |
+-----------------+---------+-------------+----------+----------+
1 row in set (0.001 sec)

mysql> SELECT SUM(Subtotal) AS Total_Revenye
    -> FROM Bill_deatils;
ERROR 1146 (42S02): Table 'pharma_db.bill_deatils' doesn't exist
mysql> SELECT SUM(Subtotal) AS Total_Revenue
    -> FROM Bill_details;
ERROR 1146 (42S02): Table 'pharma_db.bill_details' doesn't exist
mysql> SELECT SUM(Subtotal) AS Total_Revenue
    -> FROM Bill_Details;
ERROR 1146 (42S02): Table 'pharma_db.bill_details' doesn't exist
mysql> SELECT SUM(Subtotal) AS Total_Revenue
    -> FROM Bill_Deatails;
+---------------+
| Total_Revenue |
+---------------+
|       1130.00 |
+---------------+
1 row in set (0.001 sec)

mysql> SELECT Medicine_id, SUM(Quantity) AS Total_Ordered
    -> FROM Bill_Deatails
    -> GROUP BY Medicine_id
    -> ORDER BY Total_Ordered DESC
    -> LIMIT #;
    -> .;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '.' at line 6
mysql> SELECT Medicine_id, SUM(Quantity) AS Total_Ordered
    -> FROM Bill_Deatails
    -> GROUP BY Medicine_id
    -> ORDER BY Total_Ordered DESC
    -> LIMIT 3;
+-------------+---------------+
| Medicine_id | Total_Ordered |
+-------------+---------------+
|         105 |             4 |
|         102 |             3 |
|         101 |             2 |
+-------------+---------------+
3 rows in set (0.002 sec)

mysql> SELECT COUNT(*) AS Times_Sold
    -> FROM BillDeatails
    -> WHERE Medicine_id = 1;
ERROR 1146 (42S02): Table 'pharma_db.billdeatails' doesn't exist
mysql> SELECT COUNT(*) AS Times_Sold
    -> FROM Bill_Deatails
    -> WHERE Medicine_id = 1;
+------------+
| Times_Sold |
+------------+
|          0 |
+------------+
1 row in set (0.001 sec)

mysql> 
