# AI-Loan-Risk-Analysis-System
### AI-powered Loan Decision Support System built with SQL, Power BI, n8n, Streamlit, PostgreSQL, and Groq LLM.

## An end-to-end AI-powered Loan Risk Analysis System that combines SQL-based ETL, Business Intelligence (Excel & Power BI), Workflow Automation (n8n), PostgreSQL, and Generative AI (Groq LLM) to deliver explainable credit risk assessments through a natural language interface.

<p align="center">
  <img src="images/banner.png" alt="AI Loan Risk Analysis System" width="100%">
</p>


![Project Banner](Images/banner.png)

![Python](https://img.shields.io/badge/Python-3.12-blue)

![SQL](https://img.shields.io/badge/SQL-PostgreSQL-blue)

![Power BI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)

![Streamlit](https://img.shields.io/badge/Streamlit-Web_App-red)

![n8n](https://img.shields.io/badge/n8n-Automation-orange)

![Groq](https://img.shields.io/badge/Groq-LLM-green)


## 📖 Project Overview

This project demonstrates an end-to-end AI-powered Loan Risk Analysis System that combines Business Intelligence, Workflow Automation, Relational Databases, and Generative AI.

The project begins with SQL-based ETL and Exploratory Data Analysis, followed by interactive dashboards in Excel and Power BI. Finally, an AI-powered application was developed using n8n, PostgreSQL, Groq LLM, and Streamlit, enabling users to query loan information in natural language and receive explainable credit risk assessment

## 🏗️ System Architecture

![Architecture](Images/architecture.png)

<p align="center">
  <img src="images/architecture.png" width="1000">
</p>

## 🔄 Project Workflow

Raw Dataset
      ↓
SQL (ETL + EDA)
      ↓
Excel Dashboard
      ↓
Power BI Dashboard
      ↓
n8n Workflow
      ↓
PostgreSQL
      ↓
Groq AI
      ↓
Streamlit Web App


## 🎯 Problem Statement

Financial institutions need efficient methods to evaluate borrower risk and explain lending decisions.

Traditional dashboards provide insights but cannot answer natural language questions.

This project bridges that gap by combining Business Intelligence with Generative AI, allowing users to interact with loan data conversationally.


## ✨ Features

- SQL-based ETL pipeline
- Exploratory Data Analysis using SQL
- Excel Dashboard
- Interactive Power BI Dashboard
- PostgreSQL Database
- AI Workflow Automation using n8n
- Natural Language Loan Query
- Explainable AI Loan Analysis
- Streamlit Web Interface

![Excel Dashboard](Images/excel_dashboard.png)

---

# 📈 Excel Dashboard

The project includes interactive Excel dashboards used during the exploratory analysis stage before building the Power BI solution.

## Dashboard 1

<p align="center">
  <img src="images/excel-dashboard.png" width="900">
</p>

---

## Dashboard 2

<p align="center">
  <img src="images/excel-dashboard_2.png" width="900">
</p>


---

# 📥 Download Project Files

Some project files exceed GitHub's recommended file size limit. They are available through Google Drive.

| File | Download |
|------|----------|
| 📊 Excel Dashboard | [[Download Excel Workbook]([https://docs.google.com/spreadsheets/d/11cXF4Ua8mLVkCmEq2auOLMJTHj2kYTmd/edit?usp=drive_link&ouid=104471324997452006420&rtpof=true&sd=true]


![Executive Dashboard](Images/powerbi_overview.png)

---



# 📊 Power BI Dashboard

The Power BI solution transforms the cleaned loan dataset into interactive dashboards that provide comprehensive insights into portfolio performance, credit risk, and customer behavior.

---

## 📌 Portfolio Overview

This dashboard provides a high-level view of the overall loan portfolio, highlighting key business KPIs, lending trends, and portfolio performance.

<p align="center">
  <img src="images/Portfolio Overview.png" width="1000">
</p>

---

## ⚠️ Credit & Risk Analysis

This dashboard focuses on borrower risk profiles, loan performance, and credit quality, helping identify potential risk areas and support informed lending decisions.

<p align="center">
  <img src="images/Credit & Risk Analysis.png" width="1000">
</p>

---

## 👥 Customer Insights

This dashboard analyzes customer demographics, loan behavior, and borrower characteristics, enabling deeper understanding of customer segments and lending patterns.

<p align="center">
  <img src="images/Customers Insights.png" width="1000">
</p>

![Sales Dashboard](Images/powerbi_sales.png)

![Product Dashboard](Images/powerbi_product.png)

![Ratings Dashboard](Images/powerbi_ratings.png)


## 🛠 SQL ETL & Exploratory Data Analysis

Performed:

- Data Cleaning
- Missing Value Handling
- Feature Engineering
- Exploratory Data Analysis
- Business KPI Extraction

## 🤖 AI Workflow

The AI workflow was built using n8n.

Workflow Steps:

1. User enters a natural language query.
2. AI extracts Loan ID.
3. PostgreSQL retrieves borrower details.
4. Groq LLM generates explainable credit risk analysis.
5. Streamlit displays the response.


---

# ⚡ Workflow Automation using n8n

The AI automation layer was developed using **n8n**, enabling seamless integration between PostgreSQL, Groq LLM, and the Streamlit application.

The workflows automate loan data retrieval, natural language processing, AI-powered risk explanation, and user response generation.

---

## 🔄 Workflow 1 – AI Loan Analysis Workflow

This workflow receives a natural language query, extracts the Loan ID, retrieves loan information from PostgreSQL, and prepares structured data for AI processing.

<p align="center">
  <img src="images/workflow-1.png" width="1000">
</p>

---

## 🤖 Workflow 2 – AI Loan Decision Explanation Workflow

This workflow generates explainable loan risk assessments using **Groq LLM**, validates loan records, handles invalid loan IDs, and returns structured responses to the Streamlit web application.

<p align="center">
  <img src="images/workflow-2.png" width="1000">
</p>

## Streamlit

# 🚀 Project Demo

The Streamlit application allows users to query loan decisions using natural language. It communicates with an automated n8n workflow, retrieves loan information from PostgreSQL, and generates AI-powered explanations using Groq LLM.

## 🏠 Streamlit Home Page

<p align="center">
  <img src="images/streamlit-home.png" width="900">
</p>

## 🤖 AI Loan Decision Explanation

<p align="center">
  <img src="images/streamlit-analysis.png" width="900">
</p>


## 🚀 Future Enhancements

- Deploy on AWS / Azure
- Authentication
- Multi-user support
- Loan recommendation engine
- Predictive ML model integration
- Chat history


## 👨‍💻 Author

**Tanmay Gautam**

https://www.linkedin.com/in/tanmay-gautam-59443b23/

tanmayg19@gmail.com  

