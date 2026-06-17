# 🗃️ SQL & PL/SQL Lab — Database Management Systems

A collection of SQL and PL/SQL assignments covering relational database design, querying, procedural programming, cursors, and triggers — completed as part of the Database Management Systems course at Thapar Institute of Engineering & Technology.

> **Note:** Assignments 1, 2, and 5 use **MySQL** syntax. Assignments 6 onwards use **Oracle SQL / PL/SQL**.

---

## 📁 File Overview

| File | Type | Topics Covered |
|---|---|---|
| `Assignment1.sql` | MySQL | DDL, DML basics — CREATE, INSERT, SELECT, UPDATE, DELETE, ORDER BY |
| `Assignment2_Asmita.sql` | MySQL | Filtering, pattern matching, NULL handling, aggregate functions, dual table |
| `Assignment5_Asmita.sql` | MySQL | Constraints, ALTER, composite keys, foreign keys, self-referential FK, ENUM, table copy |
| `Assignment-6.sql` | Oracle | JOINs, GROUP BY, HAVING, subqueries, aggregate functions, multi-table queries |
| `Assignment-7.sql` | Oracle | Subqueries, EXISTS, correlated subqueries, set-based queries on Salespeople/Customers/Orders schema |
| `Assignment-8.sql` | Oracle | Advanced subqueries — ALL, EXISTS, NOT EXISTS, division queries on Sailors/Reserves/Boats schema |
| `Assignment-9.sql` | Oracle PL/SQL | PL/SQL basics — IF-ELSIF, CASE, FOR/WHILE loops, Fibonacci, number reversal, calculator, time-based greeting |
| `Assignment-10.sql` | Oracle PL/SQL | Stored procedures (IN/OUT), stored functions, recursive functions, nested procedures, `%TYPE` |
| `Assignment-11.sql` | Oracle PL/SQL | Explicit cursors, FOR cursors, parameterized cursors, cursor attributes (`%NOTFOUND`, `%ROWCOUNT`) |
| `Assignment-12.sql` | Oracle PL/SQL | Triggers — BEFORE/AFTER, row-level/statement-level, `:OLD`/`:NEW`, `RAISE_APPLICATION_ERROR` |
| `Practice.sql` | MySQL | Scratch pad — DDL/DML practice, ALTER, constraints, aggregate functions |

---

## 📚 Topics Covered

### MySQL Fundamentals (Assignments 1, 2, 5 & Practice)
- Database and table creation (`CREATE DATABASE`, `CREATE TABLE`)
- Basic DML — `INSERT`, `SELECT`, `UPDATE`, `DELETE`
- Filtering with `WHERE`, `AND`, `OR`, `IN`, `BETWEEN`, `IS NULL`, `LIKE`
- Sorting with `ORDER BY ASC/DESC`
- Aggregate functions — `MAX`, `MIN`, `AVG`, `SUM`, `COUNT`
- String functions — `LOWER`, `UPPER`
- `DUAL` table, `CURRENT_DATE()`
- Constraints — `PRIMARY KEY`, `UNIQUE`, `NOT NULL`, `DEFAULT`, `CHECK`, `FOREIGN KEY`
- Self-referential foreign key (manager references employee in same table)
- `ALTER TABLE` — ADD, MODIFY, DROP, RENAME column/table
- `ENUM` types and CHECK constraints
- Composite primary keys (SPJ supply chain schema: Suppliers–Parts–Projects)
- Table copy using `CREATE TABLE ... AS SELECT`
- `TRUNCATE` vs `DELETE`

### Oracle SQL — Joins & Aggregation (Assignment 6)
- `INNER JOIN`, `LEFT JOIN`, `FULL JOIN` across department–employee schema
- `GROUP BY` with `HAVING` and `ORDER BY`
- Subqueries for max salary lookup
- Multi-column GROUP BY (department + job)
- Aggregate filtering — employees not in specific job roles

### Oracle SQL — Subqueries (Assignments 7 & 8)
- Correlated subqueries with `EXISTS` and `NOT EXISTS`
- `IN`, `ALL` operators in subqueries
- Division queries — sailors who reserved all boats
- `DISTINCT` with multi-table joins
- Salespeople/Customers/Orders schema
- Sailors/Reserves/Boats schema
- Counting with `HAVING COUNT(*) >= n`

### Oracle PL/SQL — Procedural Basics (Assignment 9)
- `DECLARE` / `BEGIN` / `END` blocks
- `IF-ELSIF-ELSE`, searched `CASE`
- `FOR` loop, `WHILE` loop, `EXIT WHEN`
- Fibonacci series, number reversal
- Switch-style arithmetic calculator
- Time-based greeting using `SYSDATE` and `TO_CHAR`
- Substitution variables (`&enternum`)
- `DBMS_OUTPUT.PUT_LINE`

### Oracle PL/SQL — Procedures & Functions (Assignment 10)
- `CREATE OR REPLACE PROCEDURE` with `IN` and `OUT` parameters
- `CREATE OR REPLACE FUNCTION` with `RETURN`
- Calling stored procedures in anonymous blocks
- Iterating with cursors inside procedures to batch-update table rows
- Local (nested) procedures and functions inside anonymous blocks
- Recursive function (Hello World printed N times)
- `%TYPE` for anchored variable declarations
- `GREATEST()` for multi-column max

### Oracle PL/SQL — Cursors (Assignment 11)
- Explicit cursor lifecycle — `OPEN`, `FETCH`, `CLOSE`
- `EXIT WHEN cursor%NOTFOUND`
- `FOR` cursor loop (implicit open/close)
- Parameterized cursors — `CURSOR c1(x NUMBER) IS SELECT ...`
- Cursor attributes — `%NOTFOUND`, `%ROWCOUNT`
- `%ROWTYPE` for row-level variable declarations
- Moving rows between tables using cursors (age-based split into `STUDENTMINOR`)
- Cursors inside stored procedures and functions
- Top-N query using `ROWNUM` inside cursor definition

### Oracle PL/SQL — Triggers (Assignment 12)
- `CREATE OR REPLACE TRIGGER`
- `BEFORE` and `AFTER` triggers
- Row-level (`FOR EACH ROW`) vs statement-level triggers
- `INSERTING`, `UPDATING`, `DELETING` predicates
- `:OLD` and `:NEW` pseudorecords
- `RAISE_APPLICATION_ERROR` for custom validation errors
- Archiving deleted rows to an audit table (`emp_old`) on DELETE
- Preventing salary decrease on UPDATE
- Auto-uppercasing names on INSERT/UPDATE
- Blocking DML on Sundays using `SYSDATE`
- Manual primary key and foreign key enforcement via triggers
- Statement-level audit log trigger

---

## 🗄️ Schemas Used

**Employee/Department** — `DEPT`, `EMP` (used across multiple assignments)  
**Student** — `STUDENT`, `Students`, `Studentminor` (marks, grades, age splits)  
**Supply Chain** — `S` (Suppliers), `P` (Parts), `J` (Projects), `SPJ` (composite junction)  
**Salespeople** — `SALESPEOPLE`, `CUSTOMERS`, `ORDERS`  
**Marina** — `SAILORS`, `RESERVES`, `BOATS`

---

## ⚙️ Setup

**MySQL assignments** (1, 2, 5, Practice): run in MySQL Workbench or any MySQL client.

**Oracle assignments** (6–12): run in Oracle SQL Developer or SQL*Plus connected to Oracle XE.
```sql
SET SERVEROUTPUT ON; -- Required to see DBMS_OUTPUT.PUT_LINE results
```

---

## 👩‍💻 Author

**Asmita Roy**  
Computer Engineering (2023–2027), Thapar Institute of Engineering & Technology, Patiala  
[GitHub](https://github.com/techAsmita) • [LinkedIn](https://linkedin.com/in/techasmita) • asmitaasmani@gmail.com
