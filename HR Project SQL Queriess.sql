CREATE DATABASE HR_Project;

USE HR_Project;

SELECT * FROM HRdata;

---KPI REQUIREMENT

--1.EMPLOYEE COUNT

SELECT SUM(employee_count) AS 'TOTAL EMPLOYEES' FROM hrdata;

--2.ATTRITION COUNT

SELECT Count(attrition) AS 'ATTRITION COUNT' FROM hrdata
WHERE Attrition = 'Yes';

--3.ATTRITION RATE

select 
round (((select count(attrition) from hrdata where attrition='Yes')* 1.0 /sum(employee_count)) * 100,2)
from hrdata;

select count(*) AS TOTALEMP,
sum(case when attrition = 'yes' then 1 else 0 end) as attritioncnt,
round((sum(case when attrition = 'yes' then 1 else 0 end) * 1.0 / count(*))*100,2) AS attrition_rate from hrdata;


--4.Active Employees

SELECT count(active_employee) from hrdata
where active_employee = 1;


--5.Average Age 
select avg(age) from hrdata;


--CHART REQUIREMENT

--1.Attrition by gender

Select gender, count(*) AS 'Gender Attriton' from hrdata
where attrition = 'yes'
group by gender;

--2.Department by Attrition

Select department, count(*) AS 'Department Attrition'from hrdata
where attrition = 'yes'
group by department
order by 'Department Attrition' desc;

--3.Number of employees by age group

Select gender,age_band, count(*) AS 'count of emp' from hrdata
group by gender, age_band
order by age_band;

--Job satisfaction rating

select job_role, job_satisfaction, count(*) 'count of emp' from hrdata
group by job_role, job_satisfaction
order by job_satisfaction;

--Attrition By education 

select  education_field, count(*) AS Attrition from hrdata
where attrition = 'yes'
group by  education_field
order by Attrition desc;

--Attrition by gender different age groups

select gender, age_band, count(*) AS Attrition from hrdata
where attrition = 'yes'
group by gender, age_band
order by attrition desc;

select age_band, gender, count(attrition) as attrition, 
round((cast(count(attrition) as numeric) / (select count(attrition) from hrdata where attrition = 'Yes')) * 100,2) as pct
from hrdata
where attrition = 'Yes'
group by age_band, gender
order by age_band, gender desc;


Select * from hrdata