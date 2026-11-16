create database [Tableau Project 1];

use [Tableau Project 1];

select * from dbo.[Project1 Depression+Student+Dataset];

select Gender,count(*) from dbo.[Project1 Depression+Student+Dataset]
group by Gender;

update dbo.[Project1 Depression+Student+Dataset]
set Gender = 'F' where Gender = 'Female';

update dbo.[Project1 Depression+Student+Dataset]
set Gender = 'M' where Gender = 'male';

select * from dbo.[Project1 Depression+Student+Dataset]
where Gender is null;

select * from dbo.[Project1 Depression+Student+Dataset]
where Gender = '';

select age,count(*) as count
from dbo.[Project1 Depression+Student+Dataset]
group by age
order by age desc;

alter table dbo.[Project1 Depression+Student+Dataset]
add Age_Group varchar(max);

select * from dbo.[Project1 Depression+Student+Dataset];

update dbo.[Project1 Depression+Student+Dataset]
set Age_Group = 
case when age between 18 and 24 then 'A1'
else case when age between 25 and 30 then 'A2'
else 'A3' end end;

select age_group,count(*) as count from dbo.[Project1 Depression+Student+Dataset]
group by age_group;

select * from INFORMATION_SCHEMA.columns where table_name
like 'Project1 Depression+Student+Dataset';

select Study_Satisfaction,count(*) from dbo.[Project1 Depression+Student+Dataset]
group by Study_Satisfaction;

select Sleep_Duration,count(*) from dbo.[Project1 Depression+Student+Dataset]
group by Sleep_Duration;

select Dietary_Habits,count(*) from dbo.[Project1 Depression+Student+Dataset]
group by Dietary_Habits;

select Have_you_ever_had_suicidal_thoughts,count(*) from dbo.[Project1 Depression+Student+Dataset]
group by Have_you_ever_had_suicidal_thoughts;

select Study_Hours,count(*) from dbo.[Project1 Depression+Student+Dataset]
group by Study_Hours;

select Financial_Stress,count(*) from dbo.[Project1 Depression+Student+Dataset]
group by Financial_Stress;

select Family_History_of_Mental_Illness,count(*) from dbo.[Project1 Depression+Student+Dataset]
group by Family_History_of_Mental_Illness;

select Depression,count(*) from dbo.[Project1 Depression+Student+Dataset]
group by Depression;

select * from [Project1 Depression+Student+Dataset]

alter table [Project1 Depression+Student+Dataset]
add Index_Column int identity (1,1);

update [Project1 Depression+Student+Dataset]
set Depression = 'No' where Depression = 0

alter table [Project1 Depression+Student+Dataset]
alter column Depression varchar(max);

update [Project1 Depression+Student+Dataset]
set Depression = 'Yes' where Depression = '1';


