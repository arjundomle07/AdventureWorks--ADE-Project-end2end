# Azure Data Engineering Project: End-to-End ETL Pipeline

This project demonstrates a real-world **End-to-End Azure Data Engineering pipeline** to ingest, transform, and visualize data using a complete set of Azure tools.

> 🚀 Designed to simulate enterprise-level data movement and transformation using a Lakehouse architecture.

---

## 🧰 Tools & Services Used

- **Azure Data Factory (ADF)** – Data ingestion from on-prem SQL Server
- **Azure Data Lake Storage Gen2** – Bronze, Silver, Gold data layers
- **Azure Databricks** – Data transformation using PySpark
- **Azure Synapse Analytics** – Data warehousing and querying
- **Azure Key Vault** – Secure credential storage
- **Power BI** – Data visualization and dashboarding

---

## 📌 Architecture Overview

![architecture_diagram](Architecture/architecture_diagram.png)

- **On-Prem SQL Server** data ingested into **Bronze layer** using ADF
- Transformed in **Azure Databricks** to Silver and Gold layers
- Loaded into **Azure Synapse Analytics**
- Visualized using **Power BI**

---

## 🔁 Data Flow Pipeline (ETL)

### 1. **Ingestion (ADF)**
- Uses **Self-hosted Integration Runtime**
- Copies data from on-prem **AdventureWorksLT** database to Data Lake (Bronze)

### 2. **Transformation (Databricks)**
- Mounted ADLS Gen2 (Bronze/Silver/Gold)
- Transformation includes:
  - Date format standardization (`ModifiedDate`)
  - Column name standardization (`ColumnID` ➝ `Column_ID`)
- Modular notebooks: `bronze_to_silver.ipynb`, `silver_to_gold.ipynb`

### 3. **Loading (Synapse)**
- Gold layer ingested into Synapse using:
  - Views
  - Stored Procedure
  - Metadata-driven ADF pipeline using `ForEach`

### 4. **Visualization (Power BI)**
- Connects directly to **Synapse serverless pool**
- Dynamic dashboard auto-refreshes on new inserts

---

## 🧱 Lakehouse Architecture

- **Bronze**: Raw ingested data
- **Silver**: Cleaned and semi-transformed data
- **Gold**: Business-ready, analytical data

---

## 📂 Project Structure

azure-data-engineering-pipeline/
├── README.md
├── Architecture/
│ └── architecture_diagram.png
├── Notebooks/
│ └── bronze_to_silver.dbc
│ └── silver_to_gold.dbc
├── ADF_Pipelines/
│ └── ingestion_pipeline.Json
│ └── notebook_pipeline.Json
├── SQL_Scripts/
│ └── create_views.sql
│ └── stored_procedure.sql
├── Synapse_Pipeline/
│ └── metadata_foreach_pipeline.json
├── PowerBI/
│ └── sales_dashboard.pbix
├── Documentation/
│ └── project_walkthrough.md
│ └── setup_instructions.md
