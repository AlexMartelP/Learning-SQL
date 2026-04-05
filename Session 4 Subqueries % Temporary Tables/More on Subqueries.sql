--If the table only has a single value, you can use it in places other than FROM, 
--like HAVING, WHERE, or even SELECT. :0

SELECT AVG(standard_qty) standard, AVG(gloss_qty) gloss, AVG(poster_qty)
poster
FROM orders
WHERE DATE_TRUNC('month',occurred_at)=
(SELECT MIN(DATE_TRUNC('month',occurred_at))
 FROM ORDERS)

SELECT sum(total_amt_usd)
poster
FROM orders
WHERE DATE_TRUNC('month',occurred_at)=
(SELECT MIN(DATE_TRUNC('month',occurred_at))
 FROM ORDERS)