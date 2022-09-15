--=-=-=-=-=-=-=-=-=-=- Aggregation Functions
/*
	COUNT() - обчислює кількість записів (працює з символьними та числовими типами)
	SUM()	- обчислює суму всіх значень (працює з числовими типами)
	AVG()	- обчислює середнє значення по всіх записах (працює з числовими типами)
	MIN()	- обчислює мінімальне значення (працює з символьними та числовими типами)
	MAX()	- обчислює максимальне значення (працює з символьними та числовими типами)
*/

select Name, Salary
from Doctors

-- кількість всіх записів в таблиці Doctors
select COUNT(Id) as 'Doctors'
from Doctors

-- функція COUTN() не включає записи зі значенням NULL
select COUNT(SponsorId) as 'Donations'
from Donations

-- загальна сума всіх пожертв
select SUM(Amount) as 'Total Amount'
from Donations

-- середня ЗП по всіх докторах
select AVG(Salary) as 'Average Salary'
from Doctors

-- максимальна ЗП зі всіх докторів
select MAX(Salary) as 'Maximum Salary'
from Doctors

-- найперше ім'я зі всіх докторів (за алфавітом)
select MIN(Name) as 'The first name'
from Doctors

-- найбільша та найменша пожертва спонсора 'Microsoft'
select MIN(Amount) as 'Minimum', MAX(Amount) as 'Maximum'
from Donations as d JOIN Sponsors as s ON d.SponsorId = s.Id
where s.Name = 'Microsoft'
