--Find the total amount of poster_qty paper ordered in the orders table.
SELECT SUM(poster_qty) Poster_total
FROM orders

--Find the total amount of standard_qty paper ordered in the orders table.
SELECT SUM(standard_qty) Standard_total
FROM orders


--Though the price/standard_qty paper varies from one order to the next. 
--I would like this ratio across all of the sales made in the orders table.
SELECT SUM(standard_amt_usd)/SUM(standard_qty) standard_price
FROM orders

--Interesting
