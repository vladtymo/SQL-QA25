create database Airlines;
use Airlines;

/* Logical operators: returns true/false
	
	>		(10 > 5)	- true
	<		(10 < 5)	- false
	>=		(30 >= 30)	- true
	<=		(30 <= 30)	- true
	=		(20 = 19)	- false
	<> !=	(20 <> 19)	- true	
	!> !<	(40 !> 30)	- false
*/

-- CHECK(condition) - гарантує, що всі значення в колонці будуть відповідати логічній умові

create table Flights
(
	Id int identity,

	DepartureCity nvarchar(50) not null check(DepartureCity <> ''),
	ArrivalCity nvarchar(50) not null check(ArrivalCity <> ''),

	DepartureTime datetime not null,
	ArrivalTime datetime not null,

	Price money not null default(0) check(Price >= 0),

	-- table level
	check(ArrivalTime > DepartureTime),
	primary key(Id)
);

-- incorrect values
insert into Flights values('', '', '2022/08/29 22:00', '2022/08/28 04:30', -100);
-- correct values
insert into Flights values('Paris', 'Roma', '2022/09/10 14:00', '2022/09/10 20:10', 2300);

select * from Flights
