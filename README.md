# MedControl – Medical Clinic Management Database

## Project Overview

MedControl is a relational database project developed to manage the core operations of a medical clinic. The system was designed and implemented using Microsoft SQL Server Management Studio (SSMS), with the goal of organizing patient records, medical appointments, consultations, insurance policies, billing, and payment information.

This project demonstrates practical SQL skills in database design, data management, data validation, relational queries, and operational reporting.

## Project Objectives

- Design and implement a structured relational database.
- Establish relationships between entities using primary and foreign keys.
- Apply data integrity constraints to improve data consistency and accuracy.
- Insert and manage sample datasets.
- Develop SQL queries to retrieve, filter, join, and analyze information.
- Generate operational and financial insights through SQL reporting.

## Technologies & Tools

- **Database Management System:** Microsoft SQL Server
- **Development Environment:** SQL Server Management Studio (SSMS)
- **Query Language:** SQL

## Database Structure

The database consists of 12 related tables:

- Patients
- Specialties
- Doctors
- Insurance Policies
- Medical Services
- Appointments
- Medical Consultations
- Payment Methods
- Invoices
- Payments
- Prescriptions
- Medical Leave Certificates

The relational model uses primary keys, foreign keys, unique constraints, and CHECK constraints to maintain data integrity and consistency.

## SQL Skills Demonstrated

**1. Database Design & Data Management**
- Created relational tables using CREATE TABLE.
- Defined primary and foreign key relationships.
- Applied UNIQUE and CHECK constraints.
- Inserted and structured sample records.

**2. Data Retrieval & Validation**
- Used SELECT statements to retrieve records.
- Applied WHERE conditions to filter information.
- Implemented data validation rules to prevent inconsistent records.
- Identified records with missing or incomplete related information.

**3. Relational Queries**
- Used JOIN operations to combine information from multiple tables.
- Connected patient, doctor, appointment, prescription, and billing records.

**4. Data Analysis & Reporting**
- Applied aggregate functions and GROUP BY to summarize operational information.
- Used subqueries to compare individual performance against overall averages.
- Generated financial and operational reports.

## Key Business Questions & Analysis

The project includes 12 SQL queries designed to answer practical operational questions, including:

- Which patients are currently active?
- Which appointments were cancelled or missed?
- Which patients have completed consultations but no registered insurance policy?
- What are the total billed revenues by doctor?
- How many appointments fall into each status category?
- What is the average insurance coverage percentage by provider?
- Which doctors have completed appointments above the overall average?
- Which invoices remain pending payment?

## Data Integrity & Business Rules

Several database constraints were implemented to prevent inconsistencies, including:

- Ensuring insurance coverage percentages remain between 0 and 100.
- Preventing duplicate appointments for the same doctor at the same scheduled date and time.
- Ensuring patient payment amounts match the invoice subtotal minus insurance coverage.
- Maintaining relationships between appointments, consultations, prescriptions, and medical leave records.

## Key Learnings

Through this project, I strengthened my practical understanding of relational database management, SQL query development, data integrity, and information retrieval.

I also gained experience translating operational requirements into structured database relationships and developing queries that transform stored information into meaningful operational and financial reports.

## Project Information

- **Project:** MedControl – Medical Clinic Management System
- **Course:** Database Fundamentals
- **Database:** Microsoft SQL Server
- **Development:** Collaborative academic project
- **Authors:** Nathalie Sandí & María Paula Jiménez
- **Year:** 2026

## How to Run the Project

To reproduce the database locally, follow these steps:

**Requirements:**
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

**Execution Steps:**

1. Connect to your local SQL Server instance using SSMS.
2. Execute `SQLQueryMedControl_v2.sql` to create the database and its 12 tables.
3. Execute `SQLQueryMedControl_DatosPrueba.sql` to populate the database with sample records.
4. Execute `SQLQueryMedControl_FixRecetasIncapacidades.sql` to recreate the prescriptions and medical leave tables and insert their corresponding sample records.
5. Execute `SQLQueryMedControl_Consultas.sql` to run the 12 analytical and operational queries.

**Note:** The fix script drops and recreates the `Recetas` and `Incapacidades` tables. Run it after the initial database creation and sample data insertion.

## Dataset & Project Scope

This project was developed as part of an academic database course using fictional sample data for demonstration purposes. No real patient information is included.

The database was implemented locally using Microsoft SQL Server. Cloud deployment and AWS integration were not part of this project.
