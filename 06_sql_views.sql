-- task 1: get doctor names 

select d.Name, d.Surname
from Doctors as d JOIN DoctorsExaminations as de ON d.Id = de.DoctorId
				  JOIN Wards as w ON de.WardId = w.Id
where w.Name = 'N346-SF'

select Salary, Name from Doctors

-- create view template: 
/*
	create view [name]
	as
	select query...
*/

-- 
create view doctors_of_ward
as
	select d.Name, d.Surname
	from Doctors as d JOIN DoctorsExaminations as de ON d.Id = de.DoctorId
					  JOIN Wards as w ON de.WardId = w.Id
	where w.Name = 'N346-SF'

-- invoke view
select Salary 
from doctors_of_ward

-- task 2: get donations from the last year
create or alter view donations_of_current_year
as
	select *
	from Donations
	where YEAR(Date) = YEAR(GETDATE())
	--order by Amount desc -- can not use order by operator in views (except with TOP)

-- drop view
drop view donations_of_last_year;

-- invokation
select * from donations_of_current_year
order by Amount desc

-- type 2
create or alter view donations_of_last_year
as
	select *
	from Donations
	where DATEDIFF(YEAR, Date, GETDATE()) !> 1;

-- test 
select * from donations_of_last_year;