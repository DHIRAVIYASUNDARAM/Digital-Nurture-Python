# ANSI SQL Using MySQL – Event Management System

## Overview

This repository contains the implementation of an **Event Management System** using **ANSI SQL and MySQL**. The project demonstrates database design, table creation, data insertion, and SQL query development for managing users, events, registrations, sessions, feedback, and resources.

The assignment was completed using **MySQL Workbench** and follows ANSI SQL standards wherever applicable.

---

## Project Objectives

* Design a relational database schema for an Event Management System.
* Create tables with primary keys, foreign keys, constraints, and relationships.
* Populate the database using sample data.
* Perform data retrieval and analysis using SQL queries.
* Demonstrate practical usage of joins, aggregation, grouping, filtering, subqueries, and reporting queries.

---

## Database Schema

The system consists of the following tables:

### 1. Users

Stores user account information.

| Column            | Description               |
| ----------------- | ------------------------- |
| user_id           | Unique user identifier    |
| full_name         | User's full name          |
| email             | User email address        |
| city              | User location             |
| registration_date | Account registration date |

### 2. Events

Stores event details.

| Column       | Description                      |
| ------------ | -------------------------------- |
| event_id     | Unique event identifier          |
| title        | Event title                      |
| description  | Event description                |
| city         | Event location                   |
| start_date   | Event start date and time        |
| end_date     | Event end date and time          |
| status       | Upcoming / Completed / Cancelled |
| organizer_id | Event organizer                  |

### 3. Sessions

Stores sessions conducted within events.

### 4. Registrations

Stores event registration details.

### 5. Feedback

Stores ratings and comments submitted by users.

### 6. Resources

Stores event-related resources such as PDFs, images, and links.

---

## Repository Structure

```text
.
├── README.md
├── create_tables.sql
├── insert_data.sql
├── exercise_queries.sql
└── screenshots
    ├── Users.png
    ├── Events.png
    ├── Sessions.png
    ├── Registrations.png
    ├── Feedback.png
    ├── Resources.png
    └── ...
```

---

## SQL Scripts

### create_tables.sql

Contains all CREATE TABLE statements including:

* Primary Keys
* Foreign Keys
* Constraints
* Relationships

### insert_data.sql

Contains sample dataset records for all tables.

### exercise_queries.sql

Contains solutions for all assignment exercises, including:

* User Upcoming Events
* Top Rated Events
* Inactive Users
* Peak Session Hours
* Most Active Cities
* Event Resource Summary
* Feedback Analysis
* Registration Trends
* Session Conflict Detection
* User Engagement Reports
* Event Statistics
* Resource Availability Checks
* And more

---

## Concepts Demonstrated

* ANSI SQL Syntax
* DDL (Data Definition Language)
* DML (Data Manipulation Language)
* Joins
* Aggregate Functions
* GROUP BY
* HAVING
* Subqueries
* Date Functions
* Ordering and Filtering
* Data Integrity Constraints

---

## Sample Queries

### Retrieve Upcoming Events

```sql
SELECT u.full_name,
       e.title,
       e.city,
       e.start_date
FROM users u
JOIN registrations r
ON u.user_id = r.user_id
JOIN events e
ON r.event_id = e.event_id
WHERE e.status = 'upcoming';
```

### Event Resource Summary

```sql
SELECT e.title,
       COUNT(r.resource_id) AS total_resources
FROM events e
LEFT JOIN resources r
ON e.event_id = r.event_id
GROUP BY e.title;
```

---

## Tools & Technologies

* MySQL 8.0
* MySQL Workbench
* Git
* GitHub
* ANSI SQL

---

## Screenshots

The repository includes screenshots demonstrating:

* Database tables
* Sample data records
* Query execution
* Output results
* Assignment solutions

---

## Learning Outcomes

Through this project, the following skills were developed:

* Database schema design
* SQL query writing
* Relational database management
* Data analysis using SQL
* Git and GitHub version control
* Documentation and project organization

---

## Author

**DHIRAVIYA S**

Digital Nurture Program
SQL & Database Management Assignment
