--Each company in the accounts table wants to create an email address for each primary_poc. The email address should be the first name of the primary_poc . last name primary_poc @ company name .com.
SELECT primary_poc,
LOWER(CONCAT(LEFT(primary_poc,POSITION(' ' in primary_poc)-1)
       ,'.',
       RIGHT(primary_poc,LENGTH(primary_poc)-POSITION(' ' in primary_poc))
,'@',replace(name,' ','_'),'.com'))
FROM accounts --so interesting

--We would also like to create an initial password, 
--which they will change after their first log in. The first password will be the first letter of the primary_poc's first name (lowercase)
--, then the last letter of their first name (lowercase), the first letter of their last name (lowercase), the last letter of their last name (lowercase),
-- the number of letters in their first name, the number of letters in their last name, and then the name of the company they are working with, all capitalized with no spaces.
SELECT CONCAT(
LOWER(LEFT(primary_poc,1)),
LOWER(RIGHT(LEFT(primary_poc, POSITION(' ' IN primary_poc)-1),1)),
LOWER(LEFT(SUBSTR(primary_poc, POSITION(' ' IN primary_poc)+1),1)),
LOWER(RIGHT(primary_poc, 1)),
LENGTH(LEFT(primary_poc, POSITION(' ' IN primary_poc)-1)),
LENGTH(RIGHT(primary_poc,LENGTH(primary_poc)-POSITION(' ' in primary_poc))),
UPPER(REPLACE(name, ' ', ''))
)
FROM accounts
--ufff 
