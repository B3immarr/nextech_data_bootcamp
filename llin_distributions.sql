CREATE TABLE llin_distribution (
ID INT, -- unique identifier for each distribution record.
number_distributed INT, -- The number of LLINs distributed.
location VARCHAR (30) ,-- The specific location where the LLINs were distributed.
country VARCHAR (30) ,-- The country where the distribution took place.
when_date INT , -- The country where the distribution took place.
By_whom VARCHAR (30) , --  The country where the distribution took place.
Country_code VARCHAR (10), -- The ISO code of the country.

PRIMARY KEY ( ID) -- Unique identifier for a table

);
SELECT * FROM llin_distribution;  -- show all the data from the table

-- total number of llins distributed
SELECT country, -- select the country column
 COUNT(*) AS llins_distributed -- find final amount of llins distributed
FROM llin_distribution -- get the data from the llin distribution table
GROUP BY country -- make data into a group using country 
ORDER BY llins_distributed DESC; -- order them using llins distributed in descending order


-- average number of LLINS distributed per event
SELECT * FROM llin_distribution; -- show all the data from the table
SELECT By_whom, -- select the organisation that did the distribution
AVG(number_distributed) -- and get the average number of distribution per organisation
FROM llin_distribution -- get the data from the llin distribution table
GROUP BY By_whom -- make data into a group using the organisations
;

-- earliest  distribution date and latest distribution date
 SELECT * FROM llin_distribution; -- show all the data from the table
SELECT 
    MIN(when_date) AS earliest_date, -- select the earliest date using MIN() function
    MAX(when_date) AS latest_date -- select the newest date using MAX() function
FROM llin_distribution; -- get the data from the llin distribution table

-- total number of llins ditributed by each organisation
SELECT * FROM llin_distribution; -- show all the data from the table
SELECT By_whom , SUM(number_distributed)  AS total_products -- total number of distributions per organisation
FROM llin_distribution -- get the data from the llin distribution table
GROUP BY By_whom -- group by the organisation that did the distribution
ORDER BY total_products DESC -- order them by the total products in descending order
;

-- total number of llins distributed in each year
SELECT * FROM llin_distribution; -- show all the data from the table
SELECT when_date , SUM(number_distributed) -- select the year and get the total number of llins distributed
AS year_totals -- header is named year_totals
FROM llin_distribution   -- get the data from the llin distribution table
GROUP BY when_date -- group by the year
ORDER BY year_totals DESC -- order by the year totals in descending order
;

-- locations with highest and lowest number of llins distributed
SELECT * FROM llin_distribution; -- show all the data from the table
SELECT location, SUM(number_distributed) -- select the location and number of distributions in that location
 AS location_totals -- header is called location totals
FROM llin_distribution -- get the data from the llin distribution table
GROUP BY location -- group data by location
ORDER BY location_totals DESC -- order by the location totals in descending order
;


-- difference between amount of llins distributed by different organisations
SELECT * FROM llin_distribution; -- show all the data from the table
SELECT By_whom, COUNT(number_distributed) -- select the organisations and get the number of times they distributed
AS organisations_distributions -- name header as organisations_distributions
  FROM llin_distribution  -- get the data from the llin distribution table
 GROUP BY By_whom -- group by organisation that did the distribution
ORDER BY organisations_distributions DESC -- order by the organisation distribution total in descending order
;

-- average number of llins distributed
SELECT AVG(number_distributed) -- show the average of the number distributed
FROM llin_distribution;  -- get the data from the llin distribution table

-- times where the distribution amount is greater than the average amount
SELECT * FROM llin_distribution;  -- show all the data from the table
   SELECT By_whom, when_date, number_distributed AS above_avg_distr -- select the organisations columns, the year and amount distributed
FROM llin_distribution -- get the data from the llin distribution table
WHERE number_distributed > (SELECT AVG(number_distributed) FROM llin_distribution);  -- Compare amount with the average amount


-- times where the distribution amount is lower than the average amount
SELECT * FROM llin_distribution;  -- show all the data from the table
   SELECT By_whom, when_date, number_distributed AS below_avg_distr
FROM llin_distribution  -- get the data from the llin distribution table
WHERE number_distributed < (SELECT AVG(number_distributed) FROM llin_distribution);  -- Compare amount with the average amount

--  Minimum and  Maximum amounts distributed
SELECT
	MIN(number_distributed) AS min_number_distributed, -- to get the minimum amount
    MAX(number_distributed) AS max_number_distributed -- to get the maximum amount
 FROM 
 llin_distribution;



