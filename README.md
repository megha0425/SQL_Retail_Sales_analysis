# SQL_Retail_Sales_analysis
# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Database**: `Sales_database

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `sales_database;
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
CREATE DATABASE Sales_database;

CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:
-- Q1. Write Sql query to retreive all columns for sales made on '2022-11-05'
Select * From retail_sales
where sale_date='2022-11-05';

-- Q2. Write SQL query to retreive all transactions where category is 'Clothing' and the qty sold is more than or equal to 3
Select * From retail_sales
where category='Clothing'
And quantity >=3;

--Q3. Write SQL query to retreive all transactions where category is 'Clothing' in month of Nov 2022 where qty is more than equal to 3
Select * From retail_sales
Where
date_Format(sale_date,'%Y-%m') = '2022-11'
and 
category = 'Clothing'
and
quantity >=3

---Q4. Write a query to calculate total sales for each category:
Select category,
Sum(total_sale) as Net_sales
From retail_sales
Group By category

---Q5. wrie a Sql query to find avg. age of customers who purchased items from beauty category:
Select
 Round(Avg(Age),2) as Average_age
From retail_sales
Where Category='Beauty'

---Q6. Write a sql query to find all transactions where total sale >1000
Select * From retail_sales
Where total_sale>1000

---Q7.Write a sql query to find total number of trans.  made by each gender in each category
Select gender, category,
Count(*) as total_transactions
From retail_sales
Group By category, Gender
Order By category

---Q8. Calculate avg sale for each month , find out best selling month for each year
Select
Year(sale_date)as Year,
Month(sale_date) as Month,
Avg(total_sale) as avg_sale
From retail_sales
Group By Year, Month
Order by Year, avg_sale desc

---Q9. Find Top 5 customers based on highest total sales
Select customer_id,
Sum(total_sale) as total_sale
From retail_sales
Group by customer_id
Order By total_sale Desc
Limit 5

---Q10. Find unique customers who purchased from each category
Select Category,
Count(Distinct customer_id) as distinct_customers
From retail_sales
Group By Category 

---Q11. Create each shift and no. of orders (eg. morning <=12, afternoon between 12 & 17, evening >17)
With Hourly_sale
As
(Select*,
Case
When Hour(sale_time) <12 then 'Morning'
When Hour(sale_time) Between 12 And 17 then 'Afternoon'
Else 'Evening'
End as Shift
From retail_sales)

Select Shift,
Count(*) as total_orders
From Hourly_sale
Group by Shift

------END OF PROJECT----

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

