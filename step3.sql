# Daily prices of bitcoin and etherium

select * from prices;

# select the first 5 "btc" prices #
select * 
from prices
where ticker ='btc'
limit 5;

# select the first 5 "eth" prices#

select *
from prices
where ticker = 'eth'
limit 5;

# ques1. how many total records do we have in the price table?

select count(*)
from prices;

# ques 2. how many records are there per ticker value?

select ticker, count(*) as record_count
from prices
group by ticker;

# ques 3. what is the minimum and maximum market date values?

select min(market_date), max(market_date)
from prices;

# ques 4. are there any differences in the min and max market date for each ticker?

select ticker, min(market_date), max(market_date)
from prices
group by ticker;

# ques 5. what is the avg of the price column for bitcoin records during the year 2020?

select ticker,
	avg(price)
from prices
where ticker = 'btc'
and market_date between '2020-01-01' and '2020-12-31';

# ques 6. what is the monthly average of the price column for ethereum in 2020? sort the output in chronological order and also round the average price value to 2 decimal places

SELECT
  DATE_FORMAT(MIN(market_date), '%Y-%m-01') AS month_start,
  ROUND(AVG(CAST(price AS DECIMAL(10, 2))), 2) AS average_eth_price
FROM trading.prices
WHERE YEAR(market_date) = 2020
  AND ticker = 'ETH'
GROUP BY MONTH(market_date)
ORDER BY month_start;

# ques 7. are there any duplicate market_date values for any ticker value in our table?

select ticker,
	   count(market_date) as total_count,
       count(market_date) as unique_count
from prices
group by ticker;

# ques 8 . how many days from the prices table exist where the high price of bitcoin is over $30, 000?

select
	count(*) as row_count
from prices
where ticker = 'btc'
and high > 30000;

# ques 9. how many 'breakout' days were there in 2020 where the price col is greater than the open column for each ticker?

SELECT
  ticker,
  SUM(CASE WHEN price > open THEN 1 ELSE 0 END) AS breakout_days
FROM trading.prices
WHERE DATE_FORMAT(market_date, '%Y') = '2020'
GROUP BY ticker;

# ques 10. how many non_breakout days were there in 2020 where price col is less than the open col for each ticker?

select 
	ticker,
    sum(case when price < open then 1 else 0 end) as non_breakout_days
from prices
where date_format(market_date, '%Y') = '2020'
group by ticker;

# ques 11. what percentage of days in 2020 where breakout days vs non-breakout days? round the percentages to 2 decimal places

SELECT
  ticker,
  ROUND(
    SUM(CASE WHEN price > open THEN 1 ELSE 0 END)
      / CAST(COUNT(*) AS DECIMAL(10, 2)),
    2
  ) AS breakout_percentage,
  ROUND(
    SUM(CASE WHEN price < open THEN 1 ELSE 0 END)
      / CAST(COUNT(*) AS DECIMAL(10, 2)),
    2
  ) AS non_breakout_percentage
FROM trading.prices
WHERE market_date >= '2020-01-01' AND market_date <= '2020-12-31'
GROUP BY ticker;





