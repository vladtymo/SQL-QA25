-- DQL Commands: SELECT

/*
	select column1, column2... (* - all columns)
	from table1, table2...
	... additional commands (filtering, sorting, grouping)
*/

select DepartureCity, DepartureTime
from Flights

-- with expressions
select DepartureCity, DepartureTime, Price / 40
from Flights

-- set column name: AS 'name'
select DepartureCity, DepartureTime, Price / 40 as 'Dolars'
from Flights

-- filtering: WHERE condition
select * 
from Flights
--where DepartureCity = 'Paris' 
--where Price < 1000
where ArrivalTime = '2022-08-18 02:19:39'

/* Functions for working with date
	* YEAR(date)
	* MONTH(date)
	* DAY(date)
*/

select * 
from Flights
where DAY(DepartureTime) = 24
--where YEAR(DepartureTime) = 2022

-- Sorting: ORDER BY [key] ASC/DESC
select * 
from Flights
order by ArrivalCity

-- TOP: TOP [count] / TOP [percent] percent
select top 10 * 
from Flights
order by DepartureTime DESC

select * 
from Flights
where Price < 1000
order by Price 

-- Multi-condition
-- AND (true true)
-- OR  (true false) (false true) (true true)
select *
from Flights
where Price >= 1000 AND Price <= 2000;

select *
from Flights
where MONTH(DepartureTime) = 12 OR MONTH(DepartureTime) = 1 OR MONTH(DepartureTime) = 2;

-- BETWEEN ([value_from] AND [value_to])
select *
from Flights
where Price between 1000 and 2000;

-- IN (value1, value2, value3...)
select *
from Flights
where MONTH(DepartureTime) IN (12, 1, 2) AND Price < 900;

-- завдання: отримати рейси в Париж які відправляються в серпні або вересні 2022 року
select *
from Flights
where ArrivalCity = 'Paris' AND YEAR(DepartureTime) = 2022 AND MONTH(DepartureTime) IN (8, 9);

-- завдання: отримати рейси в Париж ціною від 500 до 1200 які вилітають в п'ятницю

-- DATENAME(interval, date) - returns a specified part of a date
select *
from Flights
where ArrivalCity = 'Paris' AND Price BETWEEN 500 AND 1200 AND DATENAME(WEEKDAY, DepartureTime) = 'Friday';

-- DISTINCT - remove dublicates
select distinct ArrivalCity
from Flights

-- LIKE 'pattern'
--  The percent sign (%) represents zero, one, or multiple characters
-- The underscore sign (_) represents one, single character
-- [symbol1 symbol2...]

-- завдання: рейси в яких місто прибуття містить слово 'Paris'
select *
from Flights
where ArrivalCity LIKE '%Paris%'

-- завдання: рейси в яких місто прибуття містить передостанню букву 'a'
select *
from Flights
where ArrivalCity LIKE '%a_'; -- Paris- Madrade- Madroe- 

-- завдання: рейси в яких місто прибуття містить передостанню букву голосну (AOUEI)
select *
from Flights
where ArrivalCity LIKE '%[aouie]_';