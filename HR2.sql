drop table customer;
create table customer(
cust_id number,
cust_name varchar2(20),
gender char(1),
gender2 varchar(10),
birthday date,
year01 interval year(3) to month,
day01 interval day(3) to second
);

insert into customer values(1, 'È«±æµ¿', 'm','³²', sysdate, interval '36' month(3), interval '100' day(3));
insert into customer values(2, 'È«±æµ¿2', 'f','³²', sysdate, interval '36' month(3), interval '100' day(3));
insert into customer values(3, 'È«±æµ¿3', 'm','³²', sysdate, interval '36' month(3), interval '100' day(3));
insert into customer values(4, 'È«±æµ¿4    ', 'm','³²  ', sysdate, interval '36' month(3), interval '100' day(3));

select* from customer
where cust_name = 'È«±æµ¿4    ';

select* from customer
where trim cust_name = 'È«±æµ¿4';

select* from customer
where gender2 = '³²';

--char °íÁ¤±æÀÌ
--varchar °¡º¯±æÀÌ

select cust_name, birthday, birthday+year01, birthday+day01 from customer;


create table emp2(
empid number(3),
empname vatchar(20),
salary number(9,2)
)
insert into emp2 values(1, '¾Æ¾Æ¾Æ¾Æ¾Æ¾Æ¾Æ¾Æ', 1000000.12)
insert into emp2 values(1, '¾Æ¾Æ¾Æ¾Æ¾Æ¾Æ¾Æ¾Æ', 1000000.12)

create table emp3
as
select *from employees

create table emp4
as
select *from employees
where department_id = 80;

create table emp5
as
select *from employees
where 1=0;

select*from emp5

create table emp6
as
select employee_id, first_name, salary, hire_date
from employees
where 1=0;

alter table emp6
modify (dept_id number(3), address varchar2(20));

alter table emp6
drop (deptid)

select*from emp3

alter table emp6
add (dept_id number(3));

--±¸Á¶¿Í µ¥ÀÌÅÍ ¸ğµÎ »èÁ¦ 
drop table customer2


--±¸Á¶´Â ³²±â°í µ¥ÀÌÅÍ »èÁ¦
truncate table emp3

rename table emp6


select *
from all_tables



drop table customer2;
create table customer2(
cust_id number,
cust_name varchar2(20),
gender char(1),
gender2 varchar(10),
birthday date
);

insert into customer2 values(1,'aa','M','³²ÀÚ', sysdate)
insert into customer2(cust_id,cust_name,gender,gender2)(2,'aa','M','³²ÀÚ')
insert into customer2 (cust_id,cust_name) values (3,'aa')

--ÀÔ·ÂµÇÁö ¾ÊÀº Ä®·³Àº null



create table emp_backup
as
select department_id, hire_date, first_name
from employees
where department_id=10

desc emp_backup

insert into emp_backup
select department_id, hire_date, first_name
from employees
where department_id=20

insert into emp_backup
select department_id, hire_date, first_name
from employees
where department_id=30

insert into emp_backup
select location_id, department_name, sysdate
from departments
where department_id=30

drop table emp_addinfo
create table emp_basic
as
select department_id, first_name, hire_date
from employees
where 1=0;

create table emp_addinfo
as
select department_id, first_name, salary
from employees
where 1=0;


insert all
into emp_basic values(department_id, first_name, hire_date)
into emp_addinfo values(department_id, first_name, salary)
select department_id, first_name, salary, hire_date
from employees;

select sysdate from dual
select hire_date from employees

truncate table emp_addinfo
truncate table emp_backup

insert all
when department_id<50 then
into emp_basic values(department_id, first_name, hire_date)
into emp_addinfo values(department_id, first_name, salary)
select department_id, first_name, salary, hire_date
from employees;


select * from emp_basic;
select * from emp_addinfo;

update emp_addinfo
set salary = salary*0.9
where salary>=10000


select * from emp_backup;

update emp_backup
set hire_date = sysdate
where department_id = 20

update emp_backup
set department_id = (select department_id
                    from emp_backup
                    where first_name ='Den')
where first_name ='Pat'

delete from emp_backup;
select * from emp_backup;

desc emp_backup;

drop table emp_backup;

insert into emp_backup;
select DEPARTMENT_ID,HIRE_DATE, HIRE_DATE 
from employees

select*from employees

create table emp_backup
as
select employee_id, first_name,hire_date, DEPARTMENT_ID
from employees

select * from emp_backup;

--merge
create table emp01
as
select employee_id, first_name, hire_date, DEPARTMENT_ID
from employees;

create table emp02
as
select employee_id, first_name, hire_date, DEPARTMENT_ID
from employees
where department_id =60

update table emp02
set first_name = 'suzy';

insert into emp02
values (99,'kim', sysdate, 50)

merge into emp01 using emp02
on (emp01.employee_id = emp02.employee_id)
when matched then
update set emp01.first_name = emp02.first_name
when not matched then
insert values (emp02.employee_id, emp02.first_name, emp02.salary,emp02.hire_date )

delete from emp02 where employee_id = 103;
delete from emp02 where employee_id = 104;
delete from emp02 where employee_id = 105;

select * from emp02;

rollback;

GRANT
    SELECT, INSERT, UPDATE, DELETE
ON
	hr.employees
TO
	hr


desc departments;
insert into departments(DEPARTMENT_ID, DEPARTMENT_NAME)
values (22,'aa')

select * from departments;

desc user_constraints;

select *
from user_constraints
where table_name = 'EMPLOYEES'

select *
from user_cons_columns
where table_name = 'EMPLOYEES';

select constraint_type, column_name
from user_constraints join user_cons_columns using(constraint_name)
where user_constraints.table_name = 'EMPLOYEES';

--P(primary key) À¯ÀÏ °ª , null ºÒ°¡ ÇÏ³ªÀÇ Ã¼ÀÌºí¿¡ ¿ÀÁ÷ÇÏ³ª(ÇÊ¼ö°ª)
--U(unique) À¯ÀÏ°ª null°¡´É
--R(Foregin key) ÂüÁ¶Å°, ¿Ü·¡Å°, ÀÏ¹İÀûÀ¸·Î ´Ù¸¥ Å×ÀÌºíÀÇ pk¸¦ ÂüÁ¶ ¯˜ÀºÅ×ÀÌºíÀÇ ÄÃ·³ ÂüÁ¶
--C(Check) Á¶°Ç¿¡ ¸Â´Â µ¥ÀÌÅÍ¸¸ °¡´É

drop table customer;
--p/ not null/ u/ c/ r
create table customer(
cust_id number constraint custmer_cust_id_pk primary key,
cust_name varchar2(30) not null,
email varchar2(20) constraint custmer_email_unique unique,
address varchar2(100),
gender char(1) constraint custmer_gender_check  check (gender in ('M','F')), 
dept_id number constraint custmer_dept_id_references references departments(department_id),
loc varchar2(20) default 'seoul'
)


insert into customer (cust_id, cust_name, email,gender,dept_id,loc) values(5, '¾Æ¾Æ¾Æ','eye2ty3', 'M', 100,'deajoen');


select constraint_type, column_name
from user_constraints join user_cons_columns using(constraint_name)
where user_constraints.table_name = 'JOB_HISTORY';


»óÇ°Á¤º¸ -> ¹øÈ£, ÀÌ¸§, °¡°İ
ÁÖ¹® -> °í°´¹øÈ£ ÁÖ¹®ÀÏÀÚ ¼ø¼­ »óÇ°¹øÈ£ ¼ö·®
create table item_i(
ino number constraint item_i_item_pk primary key,
iname varchar2(100),
iprice number(9)
)

create table ordr(
cno number ,
odate date,
oror number,
ino number constraint ordr_item_fk references item_i(ino),
vol number,
constraint ordr_pk primary key(cno,odate,oror)
)

insert into item_i values(1, 'note',100);
insert into item_i values(2, 'coke',100);

select * from customer;
insert into ordr values(4, '2001/03/17', 1,2,10);
insert into ordr values(4, '2001/03/17', 2,2,10);
insert into ordr values(4, '2001/03/17', 3,2,10);

select* from ordr;


select * from departments;


delete from departments where department_id=100

alter table employees
disable constraint emp_dept_fk;


alter table employees
disable constraint CUSTMER_dept_fk;





---------------------------------------



conn hr/hr
1. 
2007³â ÀÔ»çÇÑ(hire_date) Á÷¿øµéÀÇ »ç¹ø(employee_id), ÀÌ¸§(employee_id), 
¼º(last_name), ºÎ¼­¸í(department_name)À» Á¶È¸ÇÏ·Á ÇÕ´Ï´Ù.
ÀÓ½Ã Å×ÀÌºí ¿ëµµ·Î »ç¿ëÇÏ´Â Object¸¦ »ı¼ºÇÕ´Ï´Ù.
==>emp_2007_details

ÀÌ¶§, ºÎ¼­¿¡ ¹èÄ¡µÇÁö ¾ÊÀº Á÷¿øÀÇ °æ¿ì, '<NOT ASSIGNED>'·Î º¸¿©Áİ´Ï´Ù.


create table emp_2007_details
as
select hire_date,employee_id,first_name,last_name,department_id
from employees;


select hire_date,employee_id,first_name,last_name,departments.department_name
from emp_2007_details left outer join departments using (department_id)


select aa.constraint_name, aa.table_name, aa.constraint_type , bb.table_name
from  user_constraints aa, user_constraints bb
where aa.constraint_name  = bb.r_constraint_name




  
========================================

2.
±âÁ¸ EMPLOYEES Å×ÀÌºí¿¡ ÀÖ´Â ·¹ÄÚµåµé Áß, 'Marketing'ºÎ¼­¿¡ ±Ù¹«ÇÏ´Â Á÷¿ø ·¹ÄÚµå¸¦
  ÀÌ¿ëÇÏ¿© EMPLOYEES_MARKETING Å×ÀÌºíÀ»   ¸¸µé±â À§ÇÑ DDLÀ» ÀÛ¼ºÇÏ½Ê½Ã¿À. 
  ´Ü, EMPLOYEES_MARKETING Å×ÀÌºíÀÇ Å°´Â   ¾ø¾îµµ °ü°è¾ø½À´Ï´Ù.


 create table EMPLOYEES_MARKETING
 as
 select *
 from employees left outer join departments using (department_id)
 where department_name = 'Marketing'
 

========================================

3.
ÀÎ»ç°ü¸®¸¦ À§ÇÏ¿© ÇöÀç Á÷¿øÁ¤º¸¿¡ ´ëÇÑ ¹é¾÷Å×ÀÌºíÀ» »ı¼ºÇÏ¿© º¸°üÇÏ±â·Î ÇÕ´Ï´Ù. 
»õ·Î »ı¼ºÇÏ´Â ¹é¾÷Å×ÀÌºí¸íÀº "EMPLOYEES_BACKUP" ÀÌ¸ç ±âÁ¸Å×ÀÌºí(EMPLOYEES)ÀÇ Index, 
Constraint´Â ÇÊ¿ä·Î ÇÏÁö ¾Ê½À´Ï´Ù. ´Ü ±Ş¿©(Salary)°¡ 5000À» ÃÊ°úÇÏ´Â Á÷¿ø¸¸ ¹é¾÷Å×ÀÌºí ³»¿¡ Á¸ÀçÇØ¾ß ÇÕ´Ï´Ù.
À§ ¼³¸í¿¡ ÇØ´çÇÏ´Â Å×ÀÌºíÀ» »ı¼ºÇÏ±â À§ÇÑ sql ½ºÅ©¸³Æ®¸¦ ÀÛ¼ºÇÏ½Ã¿À. 

 create table EMPLOYEES_BACKUP
 as
 select *
 from employees
 where salary >= 5000



 
========================================

4.
ÀÎ»ç°ü¸®¸¦ À§ÇÑ ½Ã½ºÅÛ ±¸ÃàÁß Áö¿ª(Regions), ±¹°¡(Countries), 
À§Ä¡(Locations)¿¡ ´ëÇÑ ÀüÃ¼ ¸®½ºÆ® Á¤º¸¸¦ ºó¹øÇÏ°Ô »ç¿ëÇÒ °æ¿ì°¡ »ı°å´Ù. 
¿©·¯ ÇÁ·Î±×·¥¿¡¼­ ¸Å¹ø ¹İº¹ÀûÀ¸·Î »ç¿ëµÇ¸ç ÀÏºÎ °³¹ßÀÚÀÇ °æ¿ì Àß¸øµÈ 
Á¶ÀÎÀ¸·Î ¿Ã¹Ù¸¥ °á°ú¸¦ °¡Á®¿ÀÁö ¸øÇÏ´Â °æ¿ì°¡ ¹ß»ıÇÏ¿´´Ù. 
ÀÌ¸¦ ÇØ°áÇÏ±â À§ÇØ º¹ÀâÇÑ ÁúÀÇ¸¦ ¼û±â±â À§ÇÑ ³í¸®Àû Å×ÀÌºíÀÇ ¿ëµµ·Î 
¾²ÀÌ´Â DB Object ¸¦ »ı¼ºÇÏ±â·Î ÇÏ¿´´Ù. 
DB Object ÀÌ¸§Àº LOC_DETAILS_{DB OBJECT¸í} À» »ç¿ëÇÑ´Ù.
À§ ¼³¸í¿¡ ÇØ´çÇÏ´Â DB Object¸¦ »ı¼ºÇÏ±â À§ÇÑ sql ½ºÅ©¸³Æ®¸¦ ÀÛ¼ºÇÏ¶ó.

select*from Countries
select*from Regions
select*from Locations

create table LOC_DETAILS_hr
as
select Regions, Countries, Locations
from Locations join Countries using(Country_id) 
join Regions using (Region_id)


 
======================================
5.
»ç¿øÀÌ ÇÑ ¸í ÀÌ»óÀÎ ºÎ¼­µé¿¡ ´ëÇØ ºÎ¼­ ¹øÈ£, ºÎ¼­ ÀÌ¸§, »ç¿ø ¼ö, 
ÃÖ°í ±Ş¿©, ÃÖÀú ±Ş¿©, Æò±Õ ±Ş¿©, ±Ş¿© ÃÑ¾×À» ºó¹øÇÏ°Ô Á¶È¸ÇÏ¿©¾ß 
ÇÒ ÇÊ¿ä°¡ ÀÖ¾î, VIEW¸¦ »ı¼ºÇÏ¿© »ç¿ëÇÏ°íÀÚ ÇÕ´Ï´Ù. 
»ı¼ºµÈ DB Object(VIEW)ÀÇ ÀüÃ¼ ·¹ÄÚµå¿¡ ´ëÇÑ Á¶È¸ ¸¦ ÀÛ¼ºÇÏ½Ê½Ã¿À. °á°ú°¡ ¾Æ·¡¿Í °°ÀÌ Ãâ·ÂµÇµµ·Ï 
"DEPT_SAL_INFO"¶ó´Â VIEW ¸¦ »ı¼ºÇÏ´Â sql ½ºÅ©¸³Æ®
´Ü, Æò±Õ ±Ş¿©ÀÇ ¼Ò¼öÁ¡ ÀÌÇÏ´Â Àı»çÇÕ´Ï´Ù.

Ãâ·Â : DEPT_ID | DEPT_NAME | NUM_EMP | MAX_SAL | MIN_SAL | AVG_SAL | SUM _SAL

select*from departments
select*from employees

 
 create table DEPT_SAL_INFO as
 select department_id, department_name, count(first_name), max(salary), min(salary), avg(salary), sum(salary)
 
 
 )
 
 
 

========================================
6.
Sales ºÎ¼­¿¡¼­ Gerald Cambrault ¶ó´Â °ü¸®ÀÚ(Manager_id)¸¦ °¡Áö´Â 
Á÷¿øÀÇ Á¤º¸¸¦ Á¶È¸ÇÏ¿© employee_sales_Gerald ¶ó´Â view¸¦ »ı¼ºÇÏ½Ê½Ã¿À.

»ç¿ø¹øÈ£  |  »ç¿ø¸í  |  ºÎ¼­¸í  |  °ü¸®ÀÚ¸í

 
=====================================
7.
´ÙÀ½ Á¶°ÇÀ» ¸¸Á·ÇÏ´Â Å×ÀÌºí »ı¼º DDLÀ» ÀÛ¼ºÇÏ½Ê½Ã¿À. 

Å×ÀÌºí ¸í : board

Å×ÀÌºí¿¡ ´ëÇÑ ÀÌÇØ : °Ô½ÃÆÇ Á¤º¸¸¦ °¡Áö´Â Å×ÀÌºí

Ä®·³¸í: 
board_seq	    (°Ô½Ã¹° ¹øÈ£) Á¤¼ö ÃÖ´ë 10ÀÚ¸®,
board_title	    (°Ô½Ã¹° Á¦¸ñ) ¹®ÀÚ °¡º¯ ÀÚ¸´¼ö 255ÀÚ¸®,
board_contents   (°Ô½Ã¹° ³»¿ë) ¹®ÀÚ °¡º¯ ÀÚ¸´¼ö 4000ÀÚ¸®
board_writer     (°Ô½Ã¹° ÀÛ¼ºÀÚ) ¹®ÀÚ °¡º¯ ÀÚ¸´¼ö 100ÀÚ¸®,
board_date       (°Ô½Ã¹° ÀÛ¼º½Ã°£) ³¯Â¥,	
board_viewcount  (°Ô½Ã¹° Á¶È¸¼ö) Á¤¼ö ÃÖ´ë 6ÀÚ¸®,
board_password   (°Ô½Ã¹° ¾ÏÈ£) ¹®ÀÚ °¡º¯ ÀÚ¸´¼ö 20ÀÚ¸®,	

Á¦¾àÁ¶°Ç :  board_seq : ±âº» Å°(Primary Key)  Á¦¾à Á¶°Ç¸íÀº BOARD_SEQ_PK
 board_title :  °ªÀÌ ¹İµå½Ã Á¸Àç(NOT NULL) 
 board_writer : Member Å×ÀÌºíÀÇ member_id ÄÃ·³ ÂüÁ¶

(Member  Å×ÀÌºí
member_id ¹®ÀÚ °¡º¯ ÀÚ¸´¼ö 100ÀÚ¸®
           primary key ¶ó°í °¡Á¤ÇÕ´Ï´Ù)


====================================

8.locations Å×ÀÌºí¿¡¼­ 2000¹ø ÀÌ»óÀÇ µµ½ÃÄÚµå, µµ½Ã¸í, ±¹°¡¸í, ±× µµ½Ã¿¡ ÀÖ´Â
 ºÎ¼­¸íÀ» Á¶È¸ÇÏ¿© citycode_gt_2000 ¶ó´Â ÀÌ¸§ÀÇ view¸¦  »ı¼ºÇÏ´Â SQL ¹®ÀåÀ» ÀÛ¼ºÇÏ½Ã¿À.
´Ü, citycode_gt_2000 view´Â º¯°æ °¡´ÉÇÏµµ·Ï »ı¼ºÇÕ´Ï´Ù.

LOCATION_ID	  CITY	  COUNTRY_NAME	  DEPARTMENT_NAME






























