CREATE DATABASE SALES_DB;
USE SALES_DB;
SELECT*FROM CALENDER_FILE LIMIT 10;
SELECT*FROM SALES LIMIT 10;
set sql_safe_updates =0;
DESC CALENDER_FILE;
UPDATE calender_file
set date =str_to_date(date, '%d-%m-%Y');
alter table calender_file
modify date date;
DESC SALES;
UPDATE SALES
set SHIPdate =str_to_date(SHIPdate, '%d-%m-%Y');
ALTER TABLE sales
MODIFY SHIPDATE DATE;
ALTER table sales 
modify orderdate date;
select*from calender_file 
where Date is null or
	Year is null or
	Quarter is null or
	`Quarter(Q)` is null or
	`Quarter_&_Year` is null or
	Month is null or
	Month_Name is null or
	`Month_&_Year` is null or
	Week_of_Year is null or
	`Week_of_Year(W)` is null or 
	Day_of_week is null or
	Day_Name is null ;
-- 1 year-over-year (yoy) sales&profit growth 
select c.year, round(sum(s.sales),2) as total_sales,
			round(sum(s.profit),2) as total_profit
 from sales s 
 join calender_file c
 on s.orderdate =c.date
 group by c.year
 order by c.year;
 -- 2. Seasonality (the weekend effect)
  select c.DAY_NAME,
  ROUND(SUM(s.SALES),2) AS TOTAl_sales,
 sum(case when s.returned = 'YES' THEN 1 ELSE 0 END) AS TOTAL_RETURNS
 from sales s 
 join calender_file c 
 on s.orderdate =c.date
 group by c.day_name
 order by total_sales desc;
 
 -- 3. the best quarter 
 select c.year,
 c.`quarter(Q)`,ROUND(sum(s.sales),2) as total_sales
 from sales s 
 join calender_file c 
 on s.orderdate  = c.date
 group by c.year,
 c.`quarter(Q)`
 order by total_sales desc limit 1;
 
 -- 4. discount trap
 select Category,`Sub-Category`,
 Round(sum(sales),2) as total_sales,
 Round(avg(discount)*100,2) as avg_discount_pct,
 Round(sum(profit),2) as total_profit
 from sales
 group by Category, `Sub-Category`
 order by total_profit asc;
 
 -- THE RETURN PROBLEM
--  KIS REGION MEIN CUSTOMERS SABSE ZYADA PRODUCT  RETURN KARTE HAIN RETURN RATE(%) CALCULATE KAREN.
SELECT Region,count(*) as total_orders,
   sum(case when returned ='yes' then 1 else 0 end) as returned_orders,
   round((sum(case when returned ='yes' then 1 else 0 end) /count(*))*100,2)
   as return_rate_pct
   from sales 
   group by Region
   order by return_rate_pct desc;
   
   -- top 10 loss-making customers 
   select Customer_ID, Customer_Name,
     Round(sum(sales),2) as total_sales,
     Round(sum(profit),2) as total_loss
     from sales
     group by Customer_ID, Customer_Name
     having total_loss < 0
     order by  total_loss asc
     limit 10;
 -- Shipping Delay Analysis
 select
  Ship_Mode,
  round(avg(datediff(ShipDate,OrderDate)),2) as avg_shipping_days
  from sales 
  group by Ship_Mode
  order by avg_shipping_days;

-- 8. salesperson performance
select
      Retail_Sales_People,
      round(sum(Sales),2) AS Total_sales,
      round(sum(profit),2) AS Total_profit,
      round((sum(profit) /sum(sales)) *100,2)
      as profit_margin_pct
FROM Sales
group by Retail_Sales_People
order by total_Sales desc;

-- 9. CUSTOMER CHURN
with customer_years as (
select s.Customer_ID, c.year
from sales s 
join calender_file c
on c.Date =s.OrderDate
group by s.Customer_id, c.year
)
select distinct Customer_ID from customer_years
where Customer_ID in (select Customer_ID from customer_years
where year in (2015,2016))
and Customer_ID not in (select Customer_ID from customer_years
where year =2017);

-- 10. 30-DAYS MOVING AVERAGE 
WITH daily_sales as (
select c.date as Order_Date,
   sum(s.sales) as daily_sales
   from sales s 
   join calender_file c 
   on c.Date =s.OrderDate
   group by Order_Date)
 
 select
       order_date,
       daily_sales,
       round(avg(daily_sales) over(order by order_date
       rows between 29 preceding and current  row),2) as 30_days_moving_avg
 from daily_sales
 order by order_date;


      
 

 
  
 
 
 
 

    
