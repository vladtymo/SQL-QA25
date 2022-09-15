------------------------------ JOIN operator 

-- get all departments
select * from Departments

select * from Doctors
select * from Wards
select * from Donations
select * from Sponsors
select * from DoctorsExaminations

-- join tables with WHERE condition
select w.Name, Places, DepartmentId, d.Name, d.Id
from Wards as w, Departments as d
where w.DepartmentId = d.Id AND w.Places > 25

-- join tables with JOIN operator
select w.Name, Places, DepartmentId, d.Name, d.Id
from Wards as w JOIN Departments as d ON w.DepartmentId = d.Id
where w.Places > 25

-- get all donations by sponsor 'Twimm'
select d.Id, d.Amount, d.Date, d.SponsorId
from Donations as d JOIN Sponsors as s ON d.SponsorId = s.Id
where s.Name = 'Dabjam';

-- get wards of doctor 'Mycola' examinations
select w.Name  
from Wards as w JOIN DoctorsExaminations as de ON de.WardId = w.Id 
				JOIN Doctors as d ON de.DoctorId = d.Id
where d.Name = 'Elnore';

-- get all doctor examinations sorted by doctor salary descending
select *
from DoctorsExaminations as de JOIN Doctors as d ON de.DoctorId = d.Id
order by d.Salary desc