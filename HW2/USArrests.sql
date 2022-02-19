use ids12db;
SET SQL_SAFE_UPDATES = 0;
select @avg_assault := avg(Assault) 
from USArrestss;
update USArrestss
set Assault = @avg_assault
where Assault = 0;
select * 
from USArrestss;
select min(Murder) as "Min Murder Rate"
from USArrestss;
select max(Murder) as "Max Murder Rate"
from USArrestss;
select avg(Murder) as "Mean Murder Rate"
from USArrestss;
select variance(Murder) as "Murder Rate Variance"
from USArrestss;
select min(Assault) as "Min Assault Rate"
from USArrestss;
select max(Assault) as "Max Assault Rate"
from USArrestss;
select avg(Assault) as "Mean Assault Rate"
from USArrestss;
select variance(Assault) as "Assault Rate Variance"
from USArrestss;
select State, Murder
from USArrestss
where Murder = (select max(Murder) from USArrestss);
select State
from USArrestss
order by UrbanPop;
select State
from USArrestss
where Murder > 8.1;
