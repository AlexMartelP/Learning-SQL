--So, in the previous methods, it only returned one row, and once you used aggregations,
--you couldn't add the regular rows. Therefore, `groupby` is used to add those. And also, as its name suggests, to group them according to need.

--Which account (by name) placed the earliest order? 
--Your solution should have the account name and the date of the order.
SELECT a.name, o.occurred_at
FROM accounts a
JOIN orders o
ON a.id=o.account_id
ORDER BY occurred_at
LIMIT 1

--Find the total sales in usd for each account. 
--You should include two columns - the total sales for each company's orders in usd and the company name.
SELECT a.name, SUM(total_amt_usd) total_sales
FROM orders o
JOIN accounts a
ON a.id=o.account_id
GROUP BY a.name

--What was the smallest order placed by each account in terms of total usd. 
--Provide only two columns - the account name and the total usd. Order from smallest dollar amounts to largest.

SELECT a.name, MIN(total_amt_usd) smallest_order
FROM accounts a
JOIN orders o
ON a.id=o.account_id
GROUP BY a.name
ORDER BY smallest_order

-- Find the number of sales reps in each region. Your final table should have two columns -
--the region and the number of sales_reps. Order from fewest reps to most reps.
SELECT r.name, COUNT(*) num_sales_reps
FROM region r
JOIN sales_reps s
ON r.id=s.region_id
GROUP BY r.name
ORDER BY num_sales_reps

--For each account, determine the average amount of each type of paper they purchased across their orders.
--Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account.
SELECT a.name, AVG(standard_qty) StandardAVG, AVG(gloss_qty)GlossAVG, AVG(poster_qty)PosterAVG
FROM orders o
JOIN accounts a
ON a.id=o.account_id
GROUP BY a.name

--For each account, determine the average amount spent per order on each paper type. Your result should have four columns
-- one for the account name and one for the average amount spent on each paper type.
SELECT a.name, AVG(standard_amt_usd) StandardAVG, AVG(gloss_amt_usd)GlossAVG, AVG(poster_amt_usd)PosterAVG
FROM orders o
JOIN accounts a
ON a.id=o.account_id
GROUP BY a.name

--Determine the number of times a particular channel was used in the web_events table for each region. Your final table should have three columns 
--the region name, the channel, and the number of occurrences. 
--Order your table with the highest number of occurrences first.
SELECT sr.name Name_Seller, we.channel, COUNT(*) countch
FROM sales_reps sr
JOIN accounts a
ON sr.id=a.sales_rep_id
JOIN web_events we
ON we.account_id=a.id
GROUP BY sr.name, we.channel
ORDER BY countch

--Determine the number of times a particular channel was used in the web_events table for each region. Your final table should have three columns 
--the region name, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.
SELECT r.name, we.channel, COUNT(*) countch
FROM region r
JOIN sales_reps sr
ON r.id=sr.region_id
JOIN accounts a
ON a.sales_rep_id=sr.id
JOIN web_events we
ON we.account_id=a.id
GROUP BY r.name, we.channel
ORDER BY countch DESC

-- It was somewhat confusing to understand count(*), not because of its use, but because I thought it could only be put in a specific column.