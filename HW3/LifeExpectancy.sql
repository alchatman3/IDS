use ids12db;
select * from Life_Expectancy;
SET SQL_SAFE_UPDATES = 0;

delete from Life_Expectancy 
where Population = 0;

select Country 
from Life_Expectancy
where Life_Expectancy = 0;

update Life_Expectancy
set Life_Expectancy = 72.33
where (Life_Expectancy = 0) and (Country = "Palau");

update Life_Expectancy
set Life_Expectancy = 65.47
where (Life_Expectancy = 0) and (Country = "Tuvalu");

select Country
from Life_Expectancy
where Adult_Mortality = 0;

update Life_Expectancy 
set Adult_Mortality = 17
where (Adult_Mortality = 0) and (Country = "Palau");

update Life_Expectancy 
set Adult_Mortality = 6.8
where (Adult_Mortality = 0) and (Country = "Tuvalu");

update Life_Expectancy 
set Alcohol = 0.1
where Country = "Palau";

update Life_Expectancy 
set Alcohol = 0.4
where Country = "Tuvalu";

select Country, @avg_Mort := format(avg(Adult_Mortality), 2) as "Average Adult Mortlaity Rate"
from Life_Expectancy
group by Country;

select count(Country)
from Life_Expectancy
where Alcohol = 0;

select Country, @avg_Alc := format(avg(Alcohol), 2) as "Average Alcohol Consumption"
from Life_Expectancy
group by Country;
update Life_Expectancy
set Alcohol = @avg_Alc
where Alcohol = 0;

select count(Country)
from Life_Expectancy
where Percentage_Expenditure = 0;

select Country, @avg_perEx := avg(Percentage_Expenditure) as "Average Expenditure Percentage"
from Life_Expectancy
group by Country;
update Life_Expectancy
set Percentage_Expenditure = @avg_perEx
where Percentage_Expenditure = 0;

select count(Country)
from Life_Expectancy
where Total_Expenditure = 0;

select Country, @avg_totalEx := format(avg(Total_Expenditure), 2) as "Average Total Expenditure"
from Life_Expectancy
group by Country;
update Life_Expectancy
set Total_Expenditure = @avg_totalEx
where Total_Expenditure = 0;

select count(Country)
from Life_Expectancy
where GDP = 0;

select Country, @avg_gdp := format(avg(GDP), 6) as "Average GDP"
from Life_Expectancy
group by Country;
update Life_Expectancy
set GDP = @avg_gdp
where GDP = 0;

select count(Country)
from Life_Expectancy
where Schooling = 0;

select Country, @avg_school := format(avg(Schooling), 1) as "Average Schooling"
from Life_Expectancy
group by Country;
update Life_Expectancy
set Schooling = @avg_school
where Schooling = 0;

select count(distinct(Country))
from Life_Expectancy;

select Country, format(avg(Adult_Mortality), 0) as "Max Average Mortality Rate"
from Life_Expectancy
group by Country
order by avg(Adult_Mortality) desc limit 1;
select Country, format(avg(Adult_Mortality), 0) as "Min Average Mortality Rate"
from Life_Expectancy
group by Country
order by avg(Adult_Mortality) limit 1;

select Country, format(avg(Population), 0) as "Max Average Population"
from Life_Expectancy
group by Country
order by avg(Population) desc limit 1;
select Country, format(avg(Population), 0) as "Min Average Population"
from Life_Expectancy
group by Country
order by avg(Population) limit 1;

select Country, format(avg(GDP), 6) as "Max Average GDP"
from Life_Expectancy
group by Country
order by avg(GDP) desc limit 1;
select Country, format(avg(GDP), 6) as "Min Average GDP"
from Life_Expectancy
group by Country
order by avg(GDP) limit 1;

select Country, format(avg(Schooling),1 ) as "Max Average Schooling"
from Life_Expectancy
group by Country
order by avg(Schooling) desc limit 1;
select Country, format(avg(Schooling), 1) as "Min Average Schooling"
from Life_Expectancy
group by Country
order by avg(Schooling) limit 1;

select Country, format(avg(Alcohol), 2) as "Max Average Alcohol Consumption"
from Life_Expectancy
group by Country
order by avg(Alcohol) desc limit 1;
select Country, format(avg(Alcohol), 2) as "Min Average Alcohol Consumption"
from Life_Expectancy
group by Country
order by avg(Alcohol) limit 1;

select Country, Life_Expectancy, Population
from Life_Expectancy
group by Country
order by Population desc;





