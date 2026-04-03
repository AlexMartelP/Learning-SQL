--Similar to a WHERE clause, but the filter is applied at the end, unlike a WHERE clause which filters at the beginning;
--therefore, it is also used to filter aggregations.

--Use the SQL environment below to assist with answering the following questions. Whether you get stuck or you just want
--to double check your solutions, my answers can be found at the top of the next concept.

--How many of the sales reps have more than 5 accounts that they manage?
SELECT sr.name, count(*) amount
FROM sales_reps sr
JOIN accounts a
ON a.sales_rep_id=sr.id
GROUP BY sr.name
HAVING count(*)>5; --I realized that aliases still don't work for the HAVING clause.

--How many accounts have more than 20 orders?
SELECT a.name, COUNT(o.total) Qty_orders
FROM accounts a
JOIN orders o
ON o.account_id=a.id
GROUP BY a.name
HAVING COUNT(o.total)>20;

--Which account has the most orders?
SELECT a.name, COUNT(o.total) qty_orders
FROM accounts a
JOIN orders o
ON o.account_id=a.id
GROUP BY a.name
ORDER BY qty_orders DESC
LIMIT 1;

--Which accounts spent more than 30,000 usd total across all orders?
SELECT a.name, SUM(o.total_amt_usd) total_usd
FROM accounts a
JOIN orders o
ON o.account_id=a.id
GROUP BY a.name
HAVING SUM(o.total_amt_usd)>30000
ORDER BY total_usd;

--Which accounts spent less than 1,000 usd total across all orders?
SELECT a.name, SUM(o.total_amt_usd) total_usd
FROM accounts a
JOIN orders o
ON o.account_id=a.id
GROUP BY a.name
HAVING SUM(o.total_amt_usd)<=1000
ORDER BY total_usd;

--Which account has spent the most with us?
SELECT a.name, SUM(o.total_amt_usd) total_usd
FROM accounts a
JOIN orders o
ON o.account_id=a.id
GROUP BY a.name
ORDER BY total_usd DESC
LIMIT 1;

--Which account has spent the least with us?
SELECT a.name, SUM(o.total_amt_usd) total_usd
FROM accounts a
JOIN orders o
ON o.account_id=a.id
GROUP BY a.name
ORDER BY total_usd
LIMIT 1;

--Which accounts used facebook as a channel to contact customers more than 6 times?
SELECT a.name, we.channel, count(we.channel)
FROM accounts a
JOIN web_events we
ON we.account_id=a.id
WHERE we.channel='facebook'
GROUP BY a.name, we.channel
HAVING COUNT(we.channel)>6; --I really had to overthink this one; it gave me a bit of a hard time.

--Which account used facebook most as a channel?
SELECT a.name, we.channel, count(we.channel)
FROM accounts a
JOIN web_events we
ON we.account_id=a.id
WHERE we.channel='facebook'
GROUP BY a.name, we.channel
ORDER BY count(we.channel) DESC
LIMIT 1;

--Which channel was most frequently used by most accounts?
SELECT a.id, a.name, we.channel, COUNT(*) use_
FROM accounts a
JOIN web_events we
ON a.id=we.account_id
GROUP BY a.id, a.name, we.channel
ORDER BY use_ DESC
LIMIT 100;
