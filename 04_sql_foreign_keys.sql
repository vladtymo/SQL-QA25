create database UniversityRivne;

use UniversityRivne;

-- GETDATE() - get current date

------------------------- GROUPS -------------------------
create table Groups
(
	Id int primary key identity,
	Name nvarchar(50) not null unique,
	CreationDate date not null default(GETDATE()),
	DepartmentId int not null REFERENCES Departments(Id)
);
drop table Groups;

-- add new column to existing table
alter table Groups add NewColumn int not null default(10);
-- change existing column in existing table
alter table Groups alter column Name nvarchar(100) not null;
-- delete existing column in existing table
alter table Groups drop column NewColumn;

insert into Groups values (NULL, default);			-- error with name
insert into Groups values ('QA24', '2021.05.22', 1);	-- 22.05.2022
insert into Groups values ('33PS56J', default, 2);		-- 30.08.2022
insert into Groups values ('21PR9', default, 1);		-- 30.08.2022

select * from Groups

------------------------- STUDENTS -------------------------

-- FOREIGN KEY - reference to another table
-- template: FOREIGN KEY REFERENCES [table_name]([column_name]);

/* Relationship types:
	- One to One (1...1)
	- One to Many (1...*)
	- Many to Many (*...*)
*/

create table Students
(
	Id int primary key identity,
	Name nvarchar(100) not null,
	Surname nvarchar(100) not null,
	Birthdate date null,
	AverageMark float null check(AverageMark between 1 AND 12),
	GroupId int not null REFERENCES Groups(Id),
);

insert into Students values ('Viktor', 'Fedor', '1992.05.28', 9.5, 1);
insert into Students values ('Olga', 'Belek', NULL, 10.7, 3);

select * from Students;

------------------------- DEPARTMENTS -------------------------
create table Departments
(
	Id int primary key identity,
	Name nvarchar(100) not null,
	Phone char(20) null
);

insert into Departments values ('Software Development', '22-55');
insert into Departments values ('Cubersecurity', '31-55');
insert into Departments values ('Mathematics', '24-90');

select * from Departments;
