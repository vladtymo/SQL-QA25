-- Structured Query Language (SQL) - скриптова мова запитів на сервер. Нечутлива до регістру.

-- це рядковий коментар
/* 
	це блочний коментар
*/

-- запуск скрипта: виділити код -> F5

----------------------------------------------------
/* DDL (Data Definition Language — мова опису даних)
   До цієї категорії входять наступні SQL команди:
		CREATE - створення об'єкта
		ALTER  - зміна об'єкта
		DROP   - видалення об'єкта
*/

-- створення бази даних
create database University2022;

-- видалення бази даних
drop database University2022;

-- вибір поточної бази даних для виконання команд
use University2022;

-- створення таблиці
create table Students
(
	-- обмеження для колонок:
		-- NOT NULL / NULL - дозволяє/забороняє колонці мати значення NULL
		-- UNIQUE - гарантує, що в колонці не буде дублікатів
		-- PRIMARY KEY - первинний ключ, який включає обмеження NOT NULL та UNIQUE
		-- IDENTITY(seed, increment) - встановлює автоінкремент. seed: початкове значення, increment: значення приросту (за замовчуванням 1,1)
		-- DEFAULT(value) - встановлює значення за замовчуванням для колонки, коли значення не вказано
		-- CHECK(condition) - гарантує, що всі значення в колонці будуть відповідати логічній умові

    -- опис колонки містить: ім'я_колонки тип_даних обмеження1 обмеження2 ...
	Id int PRIMARY KEY identity(1,1),
	Name nvarchar(100) not null,
	Surname nvarchar(100) not null,
	Email nvarchar(50) not null unique,
	Birthdate date null,
	IsGraduated bit not null default(0),
	Lessons smallint not null default(0)
);

-- видалення таблиці
drop table Students;

-- вставка значень в таблицю
insert into Students values ('Nazar', 'Fedttt', 'ficurss@gmail.com', '2010/10/4', default, 35);
insert into Students values ('Kolya', 'Vjyu', 'prog67@gmail.com', '2007/12/4', 1, 4);
insert into Students values ('Olga', 'Noirdr', 'gotiot@gmail.com', '2014/5/3', 1, default);

-- перегляд записів таблиці
select * from Students
