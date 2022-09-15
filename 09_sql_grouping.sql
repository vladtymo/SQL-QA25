--=-=-=-=-=-=-=-=-=-=-=-=- Grouping
-- GROUP BY [key] - дозволяє групувати елементи по певному ключу

-- кількість відділень в кожному корупсі
select Building, COUNT(Id) as 'Departments'
from Departments
group by Building

-- кількість відділень в корупсі 5 та 4
select COUNT(Id)
from Departments
where Building = 5 OR Building = 4

-- кількість обстежень по кожній палаті, не враховуючи обстеження, які завершилися після 18:00
select w.Name, COUNT(de.Id)
from Wards as w JOIN DoctorsExaminations as de ON de.WardId = w.Id
where EndTime < '18:00'
group by w.Name

-- показати кількість пожертв, загальну їх суму та відсоток від суми по кожному спонсору
select Name, COUNT(d.Id), SUM(Amount), SUM(Amount) / dbo.total_amount() * 100
from Sponsors as s JOIN Donations as d ON d.SponsorId = s.Id
group by s.Name

-- функція, яка повертає загальну суму зі всіх пожертв
create function total_amount()
returns money
begin
return (
	select SUM(Amount)
	from Donations
	)
end;

-- перевірка функції
select dbo.total_amount()
