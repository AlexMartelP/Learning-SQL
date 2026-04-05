--Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.

SELECT t1.region_name, t1.rep_name, t2.max_amt
FROM (SELECT r.name region_name, sr.name rep_name, SUM(o.total_amt_usd) total_amt
        FROM sales_reps sr
        JOIN accounts a ON a.sales_rep_id = sr.id
        JOIN orders o ON o.account_id = a.id
        JOIN region r ON r.id = sr.region_id
        GROUP BY 1, 2) t1
JOIN
(SELECT region_name, MAX(total_amt) max_amt
    FROM (
        SELECT r.name region_name, sr.name rep_name, SUM(o.total_amt_usd) total_amt
        FROM sales_reps sr
        JOIN accounts a ON a.sales_rep_id = sr.id
        JOIN orders o ON o.account_id = a.id
        JOIN region r ON r.id = sr.region_id
        GROUP BY 1, 2
    ) sub
    GROUP BY 1) t2
ON t1.region_name = t2.region_name AND t1.total_amt = t2.max_amt;
--Honestly, that was a struggle, haha. Doing three subqueries was a lot for me, especially since we literally just learned how to do single ones.


--For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were placed?

SELECT t1.region_name, t1.rep_name, t2.max_amt, t2.total_qty
FROM (SELECT r.name region_name, sr.name rep_name, SUM(o.total_amt_usd) total_amt, sum(o.total) total_qty
        FROM sales_reps sr
        JOIN accounts a ON a.sales_rep_id = sr.id
        JOIN orders o ON o.account_id = a.id
        JOIN region r ON r.id = sr.region_id
        GROUP BY 1, 2) t1
JOIN
(SELECT region_name, MAX(total_amt) max_amt,MAX(total_qty) total_qty
    FROM (
        SELECT r.name region_name, sr.name rep_name, SUM(o.total_amt_usd) total_amt, sum(o.total) total_qty
        FROM sales_reps sr
        JOIN accounts a ON a.sales_rep_id = sr.id
        JOIN orders o ON o.account_id = a.id
        JOIN region r ON r.id = sr.region_id
        GROUP BY 1, 2
    ) sub
    GROUP BY 1) t2
ON t1.region_name = t2.region_name AND t1.total_amt = t2.max_amt
ORDER BY 3 DESC;
--I added the total sum to the base subquery, then pulled the MAX just like I did with total_amt_usd.


--How many accounts had more total purchases than the account name which has bought the most standard_qty paper throughout their lifetime as a customer?
SELECT COUNT(*)
FROM(SELECT a.name, sum(total_amt_usd)
 FROM accounts a
 JOIN orders o
 ON o.account_id=a.id
 GROUP BY 1
 HAVING sum(total_amt_usd)>(SELECT SUM(o.total_amt_usd)
  FROM accounts a
  JOIN orders o ON a.id = o.account_id
  GROUP BY a.name
  ORDER BY SUM(o.standard_qty) DESC
  LIMIT 1))
