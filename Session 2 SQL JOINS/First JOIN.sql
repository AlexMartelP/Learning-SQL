--First they gave me this code; at first I didn't quite understand how to use it, but as I continued using it I was able to understand it better.
SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id=accounts.id

--After they explained PK and FK to me better, we went back to using JOIN and 
--I understood its use better, for joining two or more tables

--So the code they gave me was, from the orders table it 
--was joined to the accounts table using its PK and FK

--NOW EXCERCISES
--Provide a table for all web_events associated with account name of Walmart.
--There should be three columns. Be sure to include the primary_poc,
--time of the event, and the channel for each event. Additionally, 
--you might choose to add a fourth column to assure only Walmart events were chosen.
SELECT a.primary_poc, wb.occurred_at, wb.channel, a.name
FROM web_events wb --I also learned how to use AS
JOIN accounts a
ON wb.account_id=a.id
WHERE a.name='Walmart'

--Provide a table that provides the region for each sales_rep along with their associated accounts. 
--Your final table should include three columns: the region name, the sales rep name, and the account name. 
--Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name region, s.name seller, a.name bussiness --So, I didn't give them names; what happened is that they all gave me the same result. I investigated and it turns out that since they have the same "name," they can repeat data.
FROM sales_reps s
JOIN region r
ON sr.region_id=r.id
JOIN accounts a
ON a.sales_rep_id=sr.id--TWO JOINSSS, works similar
ORDER BY a.name

--Provide the name for each region for every order, as well as the account name and the unit price 
--they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name,
--account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.
SELECT r.name region, a.name account, (o.total_amt_usd/(o.total + 0.01)) unit_price
FROM region r
JOIN sales_reps sr
ON sr.region_id=r.id
JOIN accounts a
ON a.sales_rep_id=sr.id
JOIN orders o
ON o.account_id=a.id;
