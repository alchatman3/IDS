use ids12db;
SET SQL_SAFE_UPDATES = 0;

set @rowindex := -1;
select @underFive_median := avg(d.UnderFive) as median
from (select @rowindex := @rowindex + 1 as rowindex, UnderFive
from childmortality
order by UnderFive) as d
where d.rowindex in (floor(@rowindex / 2), ceil(@rowindex / 2));
update childmortality
set UnderFive = @underFive_median
where UnderFive = 0;

set @rowindex := -1;
select @infant_median := avg(d.Infant) as median
from (select @rowindex := @rowindex + 1 as rowindex, Infant
from childmortality
order by Infant) as d
where d.rowindex in (floor(@rowindex / 2), ceil(@rowindex / 2));
update childmortality
set Infant = @infant_median
where Infant = 0;

set @rowindex := -1;
select @neonatal_median := avg(d.Neonatal) as median
from (select @rowindex := @rowindex + 1 as rowindex, Neonatal
from childmortality
order by Neonatal) as d
where d.rowindex in (floor(@rowindex / 2), ceil(@rowindex / 2));
update childmortality
set Neonatal = @neonatal_median
where Neonatal = 0;

select * from childmortality;

select @min_infant := min(Infant)
from childmortality;
select @max_infant := max(Infant)
from childmortality;
select Year, Infant
from childmortality 
where Infant = @min_infant;
select Year, Infant
from childmortality 
where (Infant = @max_infant);

select @avg_neo := avg(Neonatal)
from childmortality;
select Year
from childmortality
where Neonatal > @avg_neo;

select Infant
from childmortality 
order by Infant desc;

select min(Infant) as "Min Infant", max(Infant) as "Max Infant", format(avg(Infant), 1) as "Avg Infant", format(variance(Infant),2) as "Infant Variance", format(std(Infant), 2) as "Infant STD"
from childmortality;
select min(Neonatal) as "Min Neonatal", max(Neonatal) as "Max Neonatal", format(avg(Neonatal), 1) as "Avg Neonatal", format(variance(Neonatal), 2) as "Neonatal Variance", format(std(Neonatal), 2) as "Neonatal STD"
from childmortality;
select min(UnderFive) as "Min Under-five", max(UnderFive) as "Max Under-five", format(avg(UnderFive), 1) as "Avg Under-five", format(variance(UnderFive), 2) as "Under-five Variance", format(std(UnderFive), 2) as "Under-five STD"
from childmortality;

alter table childmortality
add column AboveFive double;
update childmortality
set AboveFive = 12.3
where Year = 1990;
update childmortality
set AboveFive = 11.5
where Year = 1991; 
update childmortality
set AboveFive = 10.8
where Year = 1992;
update childmortality
set AboveFive = 10.1
where Year = 1993; 
update childmortality
set AboveFive = 9.4
where Year = 1994;
update childmortality
set AboveFive = 8.8
where Year = 1995;
update childmortality
set AboveFive = 8.2
where Year = 1996;
update childmortality
set AboveFive = 7.7
where Year = 1997;
update childmortality
set AboveFive = 8.9
where Year = 1998;
update childmortality
set AboveFive = 6.9 
where Year = 1999;
update childmortality
set AboveFive = 6.6 
where Year = 2000;
update childmortality
set AboveFive = 6.4
where Year = 2001;
update childmortality
set AboveFive = 6.2
where Year = 2002; 
update childmortality
set AboveFive = 6 
where Year = 2003;
update childmortality
set AboveFive = 5.9
where Year = 2004;
update childmortality
set AboveFive = 5.9
where Year = 2005;
update childmortality
set AboveFive = 5.9 
where Year = 2006;
update childmortality
set AboveFive = 6
where YEar = 2007;
update childmortality
set AboveFive = 6
where Year = 2008;
update childmortality
set AboveFive = 5.9 
where Year = 2009;
update childmortality
set AboveFive = 5.6 
where Year = 2010;
update childmortality
set AboveFive = 5.4
where Year = 2011;
update childmortality
set AboveFive = 5
where Year = 2012;
update childmortality
set AboveFive = 4.6
where Year = 2013;
update childmortality
set AboveFive = 4.2 
where Year = 2014;
update childmortality
set AboveFive = 3.9
where Year = 2015;
update childmortality
set AboveFive = 3.6
where Year = 2016;
select *
from childmortality;