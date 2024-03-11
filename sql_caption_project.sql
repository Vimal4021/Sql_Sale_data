 #What is the count of distinct cities in the dataset?

select count(distinct City) from amazon;

#For each branch, what is the corresponding city?

select Branch,city from amazon
group by Branch,city

#What is the count of distinct product lines in the dataset?

select count(distinct product_line) from amazon;

#Which payment method occurs most frequently?

select Payment,count(payment) as total_count from amazon
group by Payment
order by total_count desc

#Which product line has the highest sales?

select Product_line,sum(Total) as Highest_sale
from amazon
group by Product_line
order by Highest_sale desc

#How much revenue is generated each month?

select month(Date_col) as Months,
sum(unit_price*Quantity) as Revnue
from amazon
group by Months
order by Revnue desc

#In which month did the cost of goods sold reach its peak

select month(Date_col) as Months,
sum(unit_price*Quantity) as Revnue
from amazon
group by Months
order by Revnue desc
limit 1

#Which product line generated the highest revenue?

select product_line,
round(sum(unit_price*Quantity),2) as Revnue
from amazon
group by product_line
order by Revnue desc

#In which city was the highest revenue recorded?

select City,
round(sum(Unit_price*Quantity),2) as Revnue
from amazon
group by City
order by Revnue desc

#Which product line incurred the highest Value Added Tax?

Select product_line, Tax 
from amazon
order by Tax desc

#For each product line, add a column indicating "Good" 
#if its sales are above average, otherwise "Bad."

select product_line,Total,
case when Total>avg(Total) over(partition by product_line) then "Good"
else "Bad"
end as Sale_Status
from amazon

#Identify the branch that exceeded the average number of products sold.

select distinct branch
from amazon
where quantity > (select avg(quantity) from amazon)

#Which product line is most frequently associated with each gender?

select product_line,gender,count(*) as frequently
from amazon
group by product_line,gender
order by frequently desc

#Calculate the average rating for each product line.

select month(Date_col) from amazon
describe amazon

select * from amazon

select product_line,round(avg(rating),2) as "rating"
from amazon
group by product_line
order by avg(rating) desc

#Identify the customer type contributing the highest revenue.

select Customer_type,round(sum(total),2) as Hiegst_Revnue
from amazon
group by Customer_type
order by Hiegst_Revnue desc

#Determine the city with the highest VAT percentage.

select city,(vat/Total)*100 as VATt
from amazon
order by VATt desc


#Identify the customer type with the highest VAT payments.

select customer_type,round(sum(vat),2) as highest_Vat
from amazon
group by customer_type
order by highest_Vat desc;

#what is the count of distinct customer types in the dataset?

select customer_type,count(distinct customer_type)
from amazon
group by customer_type

#What is the count of distinct payment methods in the dataset?

select distinct Payment,count(*) as "Count"
from amazon
group by  Payment
order by count(*) desc

#Which customer type occurs most frequently?

select distinct customer_type,count(*) as "Count"
from amazon
group by customer_type
order by count(*) desc

#Identify the customer type with the highest purchase frequency.

select customer_type,round(sum(total),2) as frequency
from amazon
group by customer_type
order by sum(total) desc

#Determine the predominant gender among customers.

select customer_type,gender,count(*) as predominant
from amazon
group by customer_type,gender
order by count(*) desc

#Examine the distribution of genders within each branch.

select branch,gender,count(*) as distribution
from amazon
group by branch,gender
order by branch asc 

#Identify the time of day when customers provide the most ratings  

select time_of_day,count(rating) as "rating"
from amazon
group by time_of_day
order by count(rating) desc

#Determine the time of day with the highest customer ratings for each branch.
 
select time_of_day,branch,round(avg(rating),2) as "rating"
from amazon
group by time_of_day,branch
order by avg(rating) desc

#Identify the day of the week with the highest average ratings

select w_days,round(avg(rating),2) as "rating"
from amazon
group by w_days
order by avg(rating) desc

#Determine the day of the week with the highest average ratings for each branch

select w_days,branch,round(avg(rating),2)
from amazon
group by w_days,branch
order by avg(rating) desc










select * from amazon






























