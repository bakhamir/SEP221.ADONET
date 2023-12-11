create table student(
id int primary key identity,
lastname nvarchar(500),
firstname nvarchar(400),
datebirth datetime,
gender char (1),
facultyid int foreign key references faculty
)

drop table student

insert into student (lastname,firstname,datebirth,gender)
values ('Петров','Артем','2001-01-01','m'),
('Наталья','Наталья','2000-01-01','w'),('Бекназаров','Гани','2003-01-01','m'),('asf','asfasf','2003-01-01','m')

select * from student


create proc pStudentByGender
@gender char(1)
as
declare
@count int
select @count = COUNT(*)
from student
where gender = @gender
return @count

declare 
@count int 
exec @count = pStudentByGender 'm'
select @count

alter proc pStudentLenById
@id int
as
declare
@name nvarchar(100)
set @name = (select lastname from student where id = @id)
select @name 
declare
@namelen int  
set @namelen = len(@name)
return @namelen



declare @length int
exec @length =  pStudentLenById 1
select @length

declare @length int
exec @length =  pStudentLenById 2
select @length

declare @length int
exec @length =  pStudentLenById 4
select @length


create table faculty (
id int identity primary key,
name nvarchar(500),

) 
select * from faculty
   
   create proc pGetStudentsAndFaculties
   as
   select * from student 
   select * from faculty

   alter proc sqrtEquationSolver
   @a int,
   @b int,
   @c int,
   @answ1 int output,
   @answ2 int output
   as
   declare @Discriminant int 
   set @Discriminant = (@b * @b) - (4 * @a * @c)
   if(@Discriminant < 0)
		set @answ1 = 404
   if(@Discriminant = 0)
		set @answ1 = (-1 * @b) / (@a * 2)
	if(@Discriminant > 0)
	begin
		set @answ1 =  (-1 * @b) + sqrt(@Discriminant) / (@a * 2)
		set @answ2 =  (-1 * @b) - sqrt(@Discriminant) / (@a * 2)
	end


	declare @answ1 int
	declare @answ2 int

	exec  sqrtEquationSolver 1 ,5, 3,@answ1 output,@answ2 output
	select @answ1
	select @answ2