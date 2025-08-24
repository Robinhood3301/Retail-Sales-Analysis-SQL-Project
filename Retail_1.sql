--Data exploration

how many sales we have
select count(transactions_id) 
from retail_1

how many  unquie customer we have
select count(distinct customer_id) 
from retail_1

data analysis & buisness Key Problem & Answers
--1) Write a SQL query to retrieve all columns for sales made on '2022-11-05'
select *
 from retail_1
where sale_date = '2022-11-05'

--2) Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
select * from retail_1
where category = "clothing" AND
quantity > 2
AND sale_date BETWEEN '01-11-2022' AND '30-11-2022';

--3Write a SQL query to calculate the total sales (total_sale) for each category.:
select category, 
cast(sum(total_sale)) as sum_sales
from retail_1
group by 1

--4) Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
select category,Avg(age)
from Retail_1
where category = 'beauty'
group by 1

--5)Write a SQL query to find all transactions where the total_sale is greater than 1000.:
select * 
from retail_1
where total_sale > 1000

--6)Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
select category,gender,count(transactions_id)
from retail_1
group by 1,2

--7)Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_sale
FROM retail_1
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY year, month;

--8)Write a SQL query to find the top 5 customers based on the highest total sales 
select customer_id,
(total_sale)
from retail_1
order by 2 desc
limit 5

--9) Write a SQL query to find the number of unique customers who purchased items from each category.
select category,
Count(distinct customer_id)
from retail_1
group by 1

--10)Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_1
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift

