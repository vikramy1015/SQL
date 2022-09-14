-- 343 line check 
SET SQL_SAFE_UPDATES = 0;
use market_star_schema;
select * From cust_dimen ;
Select count(*) as cust_total,Customer_Segment  from cust_dimen where Customer_Segment='CORPORATE' and State='Maharashtra' ;

select Customer_Name  As "Custoer Full Name ", State from cust_dimen where State = 'West Bengal' ;
Select * from cust_dimen ;

Select * from cust_dimen where State in ('Tamil Nadu', 'Kerala', 'Telangana' ,'karnataka' ) ;

Select * from cust_dimen where Customer_Segment  !=  'Small Business' ;

Select * from market_fact_full ;
Select * from market_fact_full   where Shipping_Cost  > 3.0 and Profit > 500 ;
Select * from market_fact_full   where Shipping_Cost  > 3.0 OR  Profit > 500 ;

Select Ord_id , Shipping_Cost From market_fact_full where Ord_id like'%_5%' and Shipping_Cost between 10 and 15 ; 
-- SAME ABOVE QUERY CAN ALSO WRITE AS BELOW :
Select Ord_id , Shipping_Cost From market_fact_full where Ord_id like'%_5%' and Shipping_Cost >= 10 and Shipping_Cost<=15 ; 

Select City from Cust_dimen where City like 'k%' ;

Select count(Sales) as Sales_Count from market_fact_full ;

Select count(Customer_Name) As City_Wise_Customers , City  from Cust_dimen Group by City ;

Select Count(Customer_Name) As City_Wise_Customers , City,Customer_Segment  from Cust_dimen Group by City,Customer_Segment ;

Select Count(Ord_id) as Loss_Count from market_fact_full where Profit < 0 ;

Select Count(Customer_Name) As City_Wise_Customers , State,Customer_Segment  from Cust_dimen Where State = 'Bihar'  Group by City,Customer_Segment ;
Select Count(Customer_Name) As City_Wise_Customers ,Customer_Segment  from Cust_dimen Where State = 'Bihar'  Group by City,Customer_Segment ;

-- distinct keyword is to eliminate dupliucate values
Select distinct Customer_Name,City from cust_dimen order by Customer_Name,City;

Select  Prod_id , Sum(Order_Quantity) from market_fact_full   group by Prod_id Order by Sum(Order_Quantity) desc limit 3;

Select Customer_Name from cust_dimen order by Customer_Name ;

Select * from market_fact_full ;

Select  Prod_id , Sum(Order_Quantity) from market_fact_full   group by Prod_id Having Sum(Order_Quantity) >20 Order by Sum(Order_Quantity) desc limit 2;

Select  CONCAT(Reverse('Hello'),' N', Upper('Hello')) ;
select ceil(rand() * 6);

Select Customer_Name ,Concat(upper(substring_index2(lower(customer_name),' ',1),1,1)) from cust_dimen ;

Select  count(Ship_id) as Ship_Count, Month(Ship_Date) as SHIPMonth from Shipping_dimen group by SHIPMonth Order by Ship_Count desc Limit 5 ;
Select  count(Ship_id) as Ship_Count, Day(Ship_Date) as SHIPDate from Shipping_dimen group by SHIPDate Order by Ship_Count desc Limit 5 ;

Select  count(Ord_id) as Order_Count, Month(Order_Date) as OrdMonth,Year(Order_Date) as OrdYear
 from orders_dimen Where Order_Priority='Critical'  group by OrdYear,OrdMonth Order by Order_Count desc Limit 5 ;

Select  count(Ord_id) as Order_Count, Month(Order_Date) as OrdMonth,Year(Order_Date) as OrdYear
 from orders_dimen Where Order_Priority='Critical'  group by OrdYear,OrdMonth Order by Order_Count desc Limit 5 ;


Select Customer_Name from cust_dimen where Customer_Name regexp 'car' ;



-- Select customers names starting with A,B,C,or D and endin with 'er'
Select Customer_Name from cust_dimen where Customer_Name REGEXP '^[abcd].*er$' Order By Customer_Name  ;

Select Customer_Name from cust_dimen where Customer_Name REGEXP '^[pr].*er$' Order By Customer_Name  ;

-- NESTED QUERIES :





-- alter
-- Module: Database Design and Introduction to SQL
-- Session: Database Creation in MySQL Workbench
-- DDL Statements

-- 1. Create a table shipping_mode_dimen having columns with their respective data types as the following:
--    (i) Ship_Mode VARCHAR(25)
--    (ii) Vehicle_Company VARCHAR(25)
--    (iii) Toll_Required BOOLEAN
select * from cust_dimen ;
-- 2. Make 'Ship_Mode' as the primary key in the above table.


-- -----------------------------------------------------------------------------------------------------------------
-- DML Statements

-- 1. Insert two rows in the table created above having the row-wise values:
--    (i)'DELIVERY TRUCK', 'Ashok Leyland', false
--    (ii)'REGULAR AIR', 'Air India', false

-- 2. The above entry has an error as land vehicles do require tolls to be paid. Update the ‘Toll_Required’ attribute
-- to ‘Yes’.

-- 3. Delete the entry for Air India.


-- -----------------------------------------------------------------------------------------------------------------
-- Adding and Deleting Columns

-- 1. Add another column named 'Vehicle_Number' and its data type to the created table. 

-- 2. Update its value to 'MH-05-R1234'.

-- 3. Delete the created column.


-- -----------------------------------------------------------------------------------------------------------------
-- Changing Column Names and Data Types

-- 1. Change the column name ‘Toll_Required’ to ‘Toll_Amount’. Also, change its data type to integer.

-- 2. The company decides that this additional table won’t be useful for data analysis. Remove it from the database.


-- -----------------------------------------------------------------------------------------------------------------
-- Session: Querying in SQL
-- Basic SQL Queries

-- 1. Print the entire data of all the customers.

-- 2. List the names of all the customers.

-- 3. Print the name of all customers along with their city and state.

-- 4. Print the total number of customers.
select count(*) as Total_Customers
from cust_dimen;

-- 5. How many customers are from West Bengal?

-- 6. Print the names of all customers who belong to West Bengal.


-- -----------------------------------------------------------------------------------------------------------------
-- Operators

-- 1. Print the names of all customers who are either corporate or belong to Mumbai.

-- 2. Print the names of all corporate customers from Mumbai.

-- 3. List the details of all the customers from southern India: namely Tamil Nadu, Karnataka, Telangana and Kerala.

-- 4. Print the details of all non-small-business customers.

-- 5. List the order ids of all those orders which caused losses.

-- 6. List the orders with '_5' in their order ids and shipping costs between 10 and 15.


-- -----------------------------------------------------------------------------------------------------------------
-- Aggregate Functions

-- 1. Find the total number of sales made.

-- 2. What are the total numbers of customers from each city?

-- 3. Find the number of orders which have been sold at a loss.

-- 4. Find the total number of customers from Bihar in each segment.

-- 5. Find the customers who incurred a shipping cost of more than 50.


-- -----------------------------------------------------------------------------------------------------------------
-- Ordering

-- 1. List the customer names in alphabetical order.

-- 2. Print the three most ordered products.

-- 3. Print the three least ordered products.

-- 4. Find the sales made by the five most profitable products.

-- 5. Arrange the order ids in the order of their recency.

-- 6. Arrange all consumers from Coimbatore in alphabetical order.


-- -----------------------------------------------------------------------------------------------------------------
-- String and date-time functions

-- 1. Print the customer names in proper case.

-- 2. Print the product names in the following format: Category_Subcategory.

-- 3. In which month were the most orders shipped?

-- 4. Which month and year combination saw the most number of critical orders?

-- 5. Find the most commonly used mode of shipment in 2011.


-- -----------------------------------------------------------------------------------------------------------------
-- Regular Expressions

-- 1. Find the names of all customers having the substring 'car'.

-- 2. Print customer names starting with A, B, C or D and ending with 'er'.


-- -----------------------------------------------------------------------------------------------------------------
-- Nested Queries

-- 1. Print the order number of the most valuable order by sales.
Select Ord_id ,Sales , round(Sales) as RoundedSales from market_fact_full 
	Where Sales = (Select max(Sales) from market_fact_full) ;
    
    Select max(Sales) from market_fact_full;
    
    
-- 2. Return the product categories and subcategories of all the products which don’t have details about the product
-- base margin.
Select Prod_id from market_fact_full where Product_Base_Margin = Null ;

Select Prod_id from market_fact_full where Product_Base_Margin IS Null ;

Select * From prod_dimen where Prod_id in (Select Prod_id from market_fact_full where Product_Base_Margin IS Null ) ;


-- 3. Print the name of the most frequent customer.

Select Customer_Name ,Cust_id from cust_dimen 
	Where Cust_id = (Select Cust_id from market_fact_full group by Cust_id Order by count(Cust_id) desc limit 1 );

-- 4. Print the three most common products.
Select Product_Category,Product_Sub_Category from prod_dimen 
	Where Prod_id in (Select Prod_id from market_fact_full group by Prod_id Order by Count(Prod_id) desc  )Limit 3; 

Select Prod_id from market_fact_full group by Prod_id Order by Count(Prod_id) desc ;

Select customerName from Customers where customerName in (Select customerName from Customers where customerName='La Rochelle Gifts') ; 
-- -----------------------------------------------------------------------------------------------------------------
-- CTEs

-- 1. Find the 5 products which resulted in the least losses. Which product had the highest product base
-- margin among these?
Select Prod_id , Profit , Product_Base_Margin from market_fact_full where profit <0 Order by profit desc limit 5 ; 
 
With Least_Losses as (
	Select Prod_id , Profit , Product_Base_Margin
	from market_fact_full 
	where profit <0 Order by profit desc limit 5 
)Select * 
from Least_Losses
where Product_Base_margin = (
	Select max(Product_base_Margin)
    from Least_Losses
    );

-- 2. Find all low-priority orders made in the month of April. Out of them, how many were made in the first half of
-- the month?
Select Ord_id ,Order_Date ,Order_Priority 
from orders_dimen
where Order_Priority = 'low' and month(Order_Date)= 4 ;

With low_priority_orders as (
	select Ord_id ,Order_Date ,Order_Priority 
	from orders_dimen
	where Order_Priority = 'low' and month(Order_Date)= 4 )
Select count(Ord_id) as Order_Count 
from low_priority_orders 
where day(Order_Date) between 1 and 15 ;

-- -----------------------------------------------------------------------------------------------------------------
-- Views
--  It is virtual tables 
-- 1. Create a view to display the sales amounts, the number of orders, profits made and the shipping costs of all
-- orders. Query it to return all orders which have a profit of greater than 1000.
CREATE VIEW order_info 
as Select Ord_id ,Sales,Order_Quantity ,Profit,Shipping_Cost
	from market_fact_full ;

Select Ord_id  from order_info where profit >1000 ;

-- 2. Which year generated the highest profit?


-- -----------------------------------------------------------------------------------------------------------------
-- Session: Joins and Set Operations
-- Joins are a handy tool for outputting data from multiple tables in a single table.
-- Inner Join

-- 1. Print the product categories and subcategories along with the profits made for each order.
Select Ord_id , Product_Category ,Product_Sub_Category,Profit 
From prod_dimen p inner join market_fact_full m 
on p.Prod_id=m.Prod_id ;

Select * From prod_dimen; 
Select * From market_fact_full ;
-- 2. Find the shipment date, mode and profit made for every single order.
Select Ord_id , Profit , Ship_Mode , Ship_Mode
from market_fact_full m inner join shipping_dimen  s
on m.Ship_id=s.Ship_id ;

-- 3 WAY JOIN
-- 3. Print the shipment mode, profit made and product category for each product.

Select m.prod_id , m.profit, p.product_category, s.ship_mode 
from market_fact_full m inner join prod_dimen p on m.prod_id = p.prod_id 
inner join shipping_dimen s on m.ship_id = s.ship_id ;

-- 4. Which customer ordered the most number of products?

Select Customer_Name , sum(Order_Quantity) as Total_Orders
From cust_dimen  c inner join market_fact_full m 
on c.Cust_id=m.Cust_id 
group by Customer_Name 
Order by Total_Orders desc ;


-- Alternative Way 
Select Customer_Name , sum(Order_Quantity) as Total_Orders
From cust_dimen  c inner join market_fact_full m 
Using (Cust_id) 
group by Customer_Name 
Order by Total_Orders desc ;


-- 5. Selling office supplies was more profitable in Delhi as compared to Patna. True or false?
Select  Product_Category , City ,Sum(Profit) as Citt_Wise_Profit 
from prod_dimen p 
inner join market_fact_full m
using (Prod_id)
inner join cust_dimen c
using (Cust_id)
where Product_Category = 'Office Supplies'  and (City = 'Delhi' or City = 'Patna')
group by City ;


-- 6. Print the name of the customer with the maximum number of orders.
Select Customer_Name , Count(Customer_Name) as No_Of_Orders
from cust_dimen c
inner join market_fact_full m
using (Cust_id)
group by Customer_Name 
order by No_Of_Orders desc ;

-- 7. Print the three most common products.
Select Product_Category ,Product_Sub_Category , Order_Quantity
from prod_dimen p 
inner join market_fact_full m
using (Prod_id)
Group by Product_Sub_Category
Order by Order_Quantity ;

Select * from prod_dimen ;

-- -----------------------------------------------------------------------------------------------------------------
-- Outer Join

-- 1. Return the order ids which are present in the market facts table.

-- Execute the below queries before solving the next question.
create table manu (
	Manu_Id int primary key,
	Manu_Name varchar(30),
	Manu_City varchar(30)
);

insert into manu values
(1, 'Navneet', 'Ahemdabad'),
(2, 'Wipro', 'Hyderabad'),
(3, 'Furlanco', 'Mumbai');

alter table Prod_Dimen
add column Manu_Id int;

update Prod_Dimen
set Manu_Id = 2
where Product_Category = 'technology';
-- ------------------------------------------
Select * from manu ;
Select distinct manu_id from prod_dimen ;

Select m.manu_name ,p.Prod_id 
from manu m inner join prod_dimen p using (manu_id) ;
-- 2. Display the products sold by all the manufacturers using both inner and outer joins.
Select m.manu_name ,p.Prod_id 
from manu m inner join prod_dimen p using (manu_id) ;

Select m.manu_name ,p.Prod_id 
from manu m Left join prod_dimen p using (manu_id) ;

Select m.manu_name ,p.Prod_id 
from manu m Right join prod_dimen p using (manu_id) ;

Select m.manu_name  ,count(prod_id )
from manu m inner join prod_dimen p using (manu_id) 
group by m.manu_name ;

Select m.manu_name  ,count(prod_id )
from manu m LEFT join prod_dimen p using (manu_id) 
group by m.manu_name ;




-- 3. Display the number of products sold by each manufacturer.


-- 4. Create a view to display the customer names, segments, sales, product categories and
-- subcategories of all orders. Use it to print the names and segments of those customers who ordered more than 20
-- pens and art supplies products.
create view Order_Details
as Select Customer_Name ,Customer_Segment ,Sales,Order_Quantity ,Product_Category,Product_Sub_Category 
	From cust_dimen c inner join market_fact_full m 
    on c.cust_id=m.cust_id
    inner join prod_dimen p
    on m.prod_id = p.prod_id ;

Select * from Order_Details ;

-- -----------------------------------------------------------------------------------------------------------------
-- Union, Union all, Intersect and Minus

-- 1. Combine the order numbers for orders and order ids for all shipments in a single column.
Select * from cust_dimen ;
select Customer_Name ,City from cust_dimen Order by City ;
select * from shipping_dimen ;
Select * from manu where Manu_Id =null ;



-- 2. Return non-duplicate order numbers from the orders and shipping tables in a single column.

-- 3. Find the shipment details of products with no information on the product base margin.

-- 4. What are the two most and the two least profitable products?
(select prod_id , sum(Profit) from market_fact_full group by Prod_id
Order by Sum(profit) desc limit 2)
UNION
(select prod_id , sum(Profit) from market_fact_full group by Prod_id
Order by Sum(profit)  limit 2) ;

-- -----------------------------------------------------------------------------------------------------------------
-- Module: Advanced SQL
-- Session: Window Functions	
-- Window Functions in Detail

-- 1. Rank the orders made by Aaron Smayling in the decreasing order of the resulting sales.

-- 2. For the above customer, rank the orders in the increasing order of the discounts provided. Also display the
-- dense ranks.

-- 3. Rank the customers in the decreasing order of the number of orders placed.

-- 4. Create a ranking of the number of orders for each mode of shipment based on the months in which they were
-- shipped. 


-- -----------------------------------------------------------------------------------------------------------------
-- Named Windows

-- 1. Rank the orders in the increasing order of the shipping costs for all orders placed by Aaron Smayling. Also
-- display the row number for each order.


-- -----------------------------------------------------------------------------------------------------------------
-- Frames

-- 1. Calculate the month-wise moving average shipping costs of all orders shipped in the year 2011.


-- -----------------------------------------------------------------------------------------------------------------
-- Session: Programming Constructs in Stored Functions and Procedures
-- IF Statements

-- 1. Classify an order as 'Profitable' or 'Not Profitable'.


-- -----------------------------------------------------------------------------------------------------------------
-- CASE Statements

-- 1. Classify each market fact in the following ways:
--    Profits less than -500: Huge loss
--    Profits between -500 and 0: Bearable loss 
--    Profits between 0 and 500: Decent profit
--    Profits greater than 500: Great profit

-- 2. Classify the customers on the following criteria (TODO)
--    Top 20% of customers: Gold
--    Next 35% of customers: Silver
--    Next 45% of customers: Bronze


-- -----------------------------------------------------------------------------------------------------------------
-- Stored Functions

-- 1. Create and use a stored function to classify each market fact in the following ways:
--    Profits less than -500: Huge loss
--    Profits between -500 and 0: Bearable loss 
--    Profits between 0 and 500: Decent profit
--    Profits greater than 500: Great profit


-- -----------------------------------------------------------------------------------------------------------------
-- Stored Procedures

-- 1. Classify each market fact in the following ways:
--    Profits less than -500: Huge loss
--    Profits between -500 and 0: Bearable loss 
--    Profits between 0 and 500: Decent profit
--    Profits greater than 500: Great profit

-- The market facts with ids '1234', '5678' and '90' belong to which categories of profits?