create database Walmart_db;

select * from walmart;

SELECT 
    payment_method, COUNT(*)
FROM
    walmart
GROUP BY 1;


SELECT 
    COUNT(DISTINCT Branch)
FROM
    walmart; 


select max(quantity) from walmart;
select min(quantity) from walmart;

         -- Business Problems --

   -- Q.1 Find different payment method and number of transaction, number of qty sold --
   
   SELECT 
    payment_method,
    COUNT(*) AS Total_Payment,
    SUM(quantity) AS Total_qty
FROM
    walmart
GROUP BY 1
ORDER BY 2 DESC;


 -- Q.2 Identify the highest-rated category in each branch , displaying the branch , category , avg rating --

SELECT 
    branch, category, ROUND(AVG(rating), 1) AS Avg_rating
FROM
    walmart
GROUP BY 1 , 2
ORDER BY 1 , 3 DESC;


  -- Q.3 Determine the average , min and max rating of products for each city --
  
  SELECT 
    city,
    category,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating,
    ROUND(AVG(rating), 1) AS avg_rating
FROM
    walmart
GROUP BY 1 , 2;


 -- Q.4 Determine the most common payment method for each branch --
 
 SELECT 
    branch,
    payment_method,
    COUNT(*) AS Total_tranc,
    Rank() over(partition by branch order by Count(*) desc ) as Prefer 
FROM
    walmart
GROUP BY 1 , 2; 


-- Q.5 Categorize sales into 3 group Morning, Afternoon, Evening --

SELECT 
    CASE
        WHEN EXTRACT(HOUR FROM time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END Day_time,
    COUNT(*) as Total_transaction
FROM
    walmart
    group by 1;
    
    
   -- Q.6 Calculate Quantity sold by each Branch and category --
    
  SELECT 
    Branch, Category, SUM(quantity) AS Total_qty
FROM
    walmart
GROUP BY 1 , 2
ORDER BY 1; 


 -- Q.7 Calculate Total profit and Revenue by Branch --
 
 SELECT 
    branch,
    ROUND(SUM(unit_price * quantity * profit_margin),
            2) AS Total_profit,
    ROUND(SUM(unit_price * quantity), 2) AS Revenue
FROM
    walmart
GROUP BY 1
ORDER BY 1
;


 -- Q.8 Calculate top 10  Max. Profit margin and Revenue in Category -- 
 
 SELECT 
    category,
    Branch,
    city,
    profit_margin,
    round(SUM(unit_price * quantity),2) AS Revenue
FROM
    walmart
GROUP BY 1 , 2 , 3 , 4
LIMIT 10;
 
 

 