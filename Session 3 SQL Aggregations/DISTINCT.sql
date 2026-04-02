--It's useful for discarding repetitive elements like a cleaner, but it's not useful for adding aggregations.

--Use DISTINCT to test if there are any accounts associated with more than one region.
SELECT a.id Account, r.id region, a.name accountname, r.name ragionname
FROM accounts a
JOIN sales_reps sr
ON a.sales_rep_id=sr.id
JOIN region r
ON r.id=sr.region_id
ORDER BY a.name;
--Will returned same rows
SELECT DISTINCT id, name
FROM accounts;

--have any sales reps worked on more than one account
SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id=a.sales_rep_id
GROUP BY s.id, s.name
ORDER BY num_accounts
--same results, so,all wored on more than one account
SELECT DISTINCT id, name
FROM sales_reps
