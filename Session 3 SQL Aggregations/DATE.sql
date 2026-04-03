--It helps you group and filter them much better :)

--Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends in the yearly sales totals?
SELECT DATE_TRUNC('year',occurred_at), SUM(total_amt_usd)
FROM orders 
GROUP BY 1
ORDER BY 2 DESC; --I learned that you can select columns by their position using numbers.

--Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset?
SELECT DATE_TRUNC('month',occurred_at), SUM(total_amt_usd)
FROM orders 
GROUP BY 1
ORDER BY 1 DESC; --2017-01

--Which year did Parch & Posey have the greatest sales in terms of total number of orders? Are all years evenly represented by the dataset?
SELECT DATE_TRUNC('year',occurred_at), COUNT(total)
FROM orders 
GROUP BY 1
ORDER BY 2 DESC;--on 2016

--Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly represented by the dataset?
SELECT DATE_TRUNC('month',occurred_at), COUNT(total)
FROM orders 
GROUP BY 1
ORDER BY 2 DESC; --2016-12

--In which month of which year did Walmart spend the most on gloss paper in terms of dollars?
SELECT a.id, a.name, DATE_TRUNC('month',occurred_at), SUM(gloss_amt_usd)
FROM orders o
JOIN accounts a
ON a.id=o.account_id
WHERE a.name='Walmart' 
GROUP BY 1,2,3
ORDER BY 4 DESC; --2016-05
