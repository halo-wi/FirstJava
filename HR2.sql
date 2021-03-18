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

insert into customer values(1, 'ȫ�浿', 'm','��', sysdate, interval '36' month(3), interval '100' day(3));
insert into customer values(2, 'ȫ�浿2', 'f','��', sysdate, interval '36' month(3), interval '100' day(3));
insert into customer values(3, 'ȫ�浿3', 'm','��', sysdate, interval '36' month(3), interval '100' day(3));
insert into customer values(4, 'ȫ�浿4    ', 'm','��  ', sysdate, interval '36' month(3), interval '100' day(3));

select* from customer
where cust_name = 'ȫ�浿4    ';

select* from customer
where trim cust_name = 'ȫ�浿4';

select* from customer
where gender2 = '��';

--char ��������
--varchar ��������

select cust_name, birthday, birthday+year01, birthday+day01 from customer;


create table emp2(
empid number(3),
empname vatchar(20),
salary number(9,2)
)
insert into emp2 values(1, '�ƾƾƾƾƾƾƾ�', 1000000.12)
insert into emp2 values(1, '�ƾƾƾƾƾƾƾ�', 1000000.12)

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

--������ ������ ��� ���� 
drop table customer2


--������ ����� ������ ����
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

insert into customer2 values(1,'aa','M','����', sysdate)
insert into customer2(cust_id,cust_name,gender,gender2)(2,'aa','M','����')
insert into customer2 (cust_id,cust_name) values (3,'aa')

--�Էµ��� ���� Į���� null



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

--P(primary key) ���� �� , null �Ұ� �ϳ��� ü�̺� �����ϳ�(�ʼ���)
--U(unique) ���ϰ� null����
--R(Foregin key) ����Ű, �ܷ�Ű, �Ϲ������� �ٸ� ���̺��� pk�� ���� �������̺��� �÷� ����
--C(Check) ���ǿ� �´� �����͸� ����

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


insert into customer (cust_id, cust_name, email,gender,dept_id,loc) values(5, '�ƾƾ�','eye2ty3', 'M', 100,'deajoen');


select constraint_type, column_name
from user_constraints join user_cons_columns using(constraint_name)
where user_constraints.table_name = 'JOB_HISTORY';


��ǰ���� -> ��ȣ, �̸�, ����
�ֹ� -> ����ȣ �ֹ����� ���� ��ǰ��ȣ ����
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
2007�� �Ի���(hire_date) �������� ���(employee_id), �̸�(employee_id), 
��(last_name), �μ���(department_name)�� ��ȸ�Ϸ� �մϴ�.
�ӽ� ���̺� �뵵�� ����ϴ� Object�� �����մϴ�.
==>emp_2007_details

�̶�, �μ��� ��ġ���� ���� ������ ���, '<NOT ASSIGNED>'�� �����ݴϴ�.


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
���� EMPLOYEES ���̺� �ִ� ���ڵ�� ��, 'Marketing'�μ��� �ٹ��ϴ� ���� ���ڵ带
  �̿��Ͽ� EMPLOYEES_MARKETING ���̺���   ����� ���� DDL�� �ۼ��Ͻʽÿ�. 
  ��, EMPLOYEES_MARKETING ���̺��� Ű��   ��� ��������ϴ�.


 create table EMPLOYEES_MARKETING
 as
 select *
 from employees left outer join departments using (department_id)
 where department_name = 'Marketing'
 

========================================

3.
�λ������ ���Ͽ� ���� ���������� ���� ������̺��� �����Ͽ� �����ϱ�� �մϴ�. 
���� �����ϴ� ������̺���� "EMPLOYEES_BACKUP" �̸� �������̺�(EMPLOYEES)�� Index, 
Constraint�� �ʿ�� ���� �ʽ��ϴ�. �� �޿�(Salary)�� 5000�� �ʰ��ϴ� ������ ������̺� ���� �����ؾ� �մϴ�.
�� ���� �ش��ϴ� ���̺��� �����ϱ� ���� sql ��ũ��Ʈ�� �ۼ��Ͻÿ�. 

 create table EMPLOYEES_BACKUP
 as
 select *
 from employees
 where salary >= 5000



 
========================================

4.
�λ������ ���� �ý��� ������ ����(Regions), ����(Countries), 
��ġ(Locations)�� ���� ��ü ����Ʈ ������ ����ϰ� ����� ��찡 �����. 
���� ���α׷����� �Ź� �ݺ������� ���Ǹ� �Ϻ� �������� ��� �߸��� 
�������� �ùٸ� ����� �������� ���ϴ� ��찡 �߻��Ͽ���. 
�̸� �ذ��ϱ� ���� ������ ���Ǹ� ����� ���� ���� ���̺��� �뵵�� 
���̴� DB Object �� �����ϱ�� �Ͽ���. 
DB Object �̸��� LOC_DETAILS_{DB OBJECT��} �� ����Ѵ�.
�� ���� �ش��ϴ� DB Object�� �����ϱ� ���� sql ��ũ��Ʈ�� �ۼ��϶�.

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
����� �� �� �̻��� �μ��鿡 ���� �μ� ��ȣ, �μ� �̸�, ��� ��, 
�ְ� �޿�, ���� �޿�, ��� �޿�, �޿� �Ѿ��� ����ϰ� ��ȸ�Ͽ��� 
�� �ʿ䰡 �־�, VIEW�� �����Ͽ� ����ϰ��� �մϴ�. 
������ DB Object(VIEW)�� ��ü ���ڵ忡 ���� ��ȸ �� �ۼ��Ͻʽÿ�. ����� �Ʒ��� ���� ��µǵ��� 
"DEPT_SAL_INFO"��� VIEW �� �����ϴ� sql ��ũ��Ʈ
��, ��� �޿��� �Ҽ��� ���ϴ� �����մϴ�.

��� : DEPT_ID | DEPT_NAME | NUM_EMP | MAX_SAL | MIN_SAL | AVG_SAL | SUM _SAL

select*from departments
select*from employees

 
 create table DEPT_SAL_INFO as
 select department_id, department_name, count(first_name), max(salary), min(salary), avg(salary), sum(salary)
 
 
 )
 
 
 

========================================
6.
Sales �μ����� Gerald Cambrault ��� ������(Manager_id)�� ������ 
������ ������ ��ȸ�Ͽ� employee_sales_Gerald ��� view�� �����Ͻʽÿ�.

�����ȣ  |  �����  |  �μ���  |  �����ڸ�

 
=====================================
7.
���� ������ �����ϴ� ���̺� ���� DDL�� �ۼ��Ͻʽÿ�. 

���̺� �� : board

���̺� ���� ���� : �Խ��� ������ ������ ���̺�

Į����: 
board_seq	    (�Խù� ��ȣ) ���� �ִ� 10�ڸ�,
board_title	    (�Խù� ����) ���� ���� �ڸ��� 255�ڸ�,
board_contents   (�Խù� ����) ���� ���� �ڸ��� 4000�ڸ�
board_writer     (�Խù� �ۼ���) ���� ���� �ڸ��� 100�ڸ�,
board_date       (�Խù� �ۼ��ð�) ��¥,	
board_viewcount  (�Խù� ��ȸ��) ���� �ִ� 6�ڸ�,
board_password   (�Խù� ��ȣ) ���� ���� �ڸ��� 20�ڸ�,	

�������� :  board_seq : �⺻ Ű(Primary Key)  ���� ���Ǹ��� BOARD_SEQ_PK
 board_title :  ���� �ݵ�� ����(NOT NULL) 
 board_writer : Member ���̺��� member_id �÷� ����

(Member  ���̺�
member_id ���� ���� �ڸ��� 100�ڸ�
           primary key ��� �����մϴ�)


====================================

8.locations ���̺��� 2000�� �̻��� �����ڵ�, ���ø�, ������, �� ���ÿ� �ִ�
 �μ����� ��ȸ�Ͽ� citycode_gt_2000 ��� �̸��� view��  �����ϴ� SQL ������ �ۼ��Ͻÿ�.
��, citycode_gt_2000 view�� ���� �����ϵ��� �����մϴ�.

LOCATION_ID	  CITY	  COUNTRY_NAME	  DEPARTMENT_NAME






























