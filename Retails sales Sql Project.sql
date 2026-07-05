--- Create Database SQL Project Sales Database (Retail Sales Analysis)
Create Database Sales_database;

---Create table 
Drop Table if Exists retail_sales;
Create Table retail_sales (
 transation_id Integer Primary Key ,
 sale_date Date,
 sale_time Time,
 customer_id Integer ,
 gender varchar(15),
 age Integer,
 category Varchar(15),
 quantity Integer,
 price_per_unit Float,
 cogs Float,
 total_sale Float
);
---retail_sales data table imported
Select * From retail_sales;

---count the record
Select Count(*) From retail_sales

---Data Exploration

---How Many sales we have
Select Count(*) as total_sales From retail_sales;

---How many Customers we have
Select Count(Distinct customer_id ) as total_sales From retail_sales;

--How many Category we have
Select Count(Distinct category) as Category From retail_sales;

---Show Distinct Category Name
Select Distinct(category) From retail_sales;

-- Data Analysis Business Key Problems & Answers
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











