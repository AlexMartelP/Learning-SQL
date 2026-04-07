--In the accounts table, there is a column holding the website for each company. The last three digits specify what type of web address they are using. Pull these extensions and provide how many of each website type exist in the accounts table.
SELECT RIGHT(website,3), COUNT(*)
FROM accounts
GROUP BY 1

--There is much debate about how much the name (or even the first letter of a company name)(opens in a new tab) matters. Use the accounts table to pull the first letter of each company name to see the distribution of company names that begin with each letter (or number).
SELECT left(name,1), COUNT(*)
FROM accounts
GROUP BY 1 

--Use the accounts table and a CASE statement to create two groups: one group of company names that start with a number and a second group of those company names that start with a letter. What proportion of company names start with a letter?
SELECT left(name,1), 
CASE 
    WHEN LEFT(name, 1) BETWEEN '0' AND '9' THEN 'number'
    WHEN LEFT(UPPER(name), 1) BETWEEN 'A' AND 'Z' THEN 'letter'
    ELSE 'other'
END as Category
FROM accounts

--Consider vowels as a, e, i, o, and u. What proportion of company names start with a vowel, and what percent start with anything else?
SELECT 
    100.0 * SUM(CASE WHEN LEFT(LOWER(name), 1) IN ('a', 'e', 'i', 'o', 'u') THEN 1 ELSE 0 END) / COUNT(*) AS proportion_vowels,

    100.0 * SUM(CASE WHEN LEFT(LOWER(name), 1) NOT IN ('a', 'e', 'i', 'o', 'u') THEN 1 ELSE 0 END) / COUNT(*) AS percent_other
FROM accounts;
