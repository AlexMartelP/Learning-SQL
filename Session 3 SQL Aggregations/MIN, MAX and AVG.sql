--Its similar to Excel

--When was the earliest order ever placed?
SELECT MIN(occurred_at) 
FROM orders

--Try performing the same query as in question 1 without using an aggregation function.
SELECT occurred_at 
FROM orders 
ORDER BY occurred_at
LIMIT 1

--When did the most recent (latest) web_event occur?
SELECT MAX(occurred_at)
FROM web_events

--Try to perform the result of the previous query without using an aggregation function.
SELECT occurred_at
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1

--Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean'
--amount of each paper type purchased per order. Your final answer should have 6 values - one for each paper type for the average number of sales, as well as the average amount.
SELECT AVG(standard_qty) 1, 
AVG(gloss_qty) 2, 
AVG(poster_qty) 3, 
AVG(standard_amt_usd) 4, 
AVG(gloss_amt_usd) 5, 
AVG(poster_amt_usd) 6
FROM orders

