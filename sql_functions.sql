-- -=-=-=-=-=-=-=-=-=- functions -=-=-=-=-=-=-=-=-=-

-- view: get examination from Cardiologu department
create view examinations_in_cardiology
as 
	select de.*, d.Name, d.Building
	from DoctorsExaminations as de JOIN Wards as w ON de.WardId = w.Id
								   JOIN Departments as d ON w.DepartmentId = d.Id
	where d.Name = 'Cardiology'

-- test view
select * from examinations_in_cardiology

-- funciton: same query but with function
/*
	create function [name](@[parameter_name] [parameter_type], ...)
	returns [return_type]
	as
		return (select...)
*/

create or alter function examinations_from_dep(@dep_name nvarchar(100))
returns table
as
return (
	select de.*, d.Name, d.Building
	from DoctorsExaminations as de JOIN Wards as w ON de.WardId = w.Id
									JOIN Departments as d ON w.DepartmentId = d.Id
	where d.Name = @dep_name);

-- test function 
select * from examinations_from_dep('Microbiology')

-- task: get sponsors 
create or alter function sponsort_by_max_donation(@amount_from money, @amount_to money)
returns table
as
return (
	select s.Name, d.Amount, d.Date
	from Sponsors as s JOIN Donations as d ON d.SponsorId = s.Id
	where d.Amount BETWEEN @amount_from AND @amount_to
);

-- test function
select * from sponsort_by_max_donation(10000, 20000)
