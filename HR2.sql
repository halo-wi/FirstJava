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

insert into customer values(1, '홍길동', 'm','남', sysdate, interval '36' month(3), interval '100' day(3));
insert into customer values(2, '홍길동2', 'f','남', sysdate, interval '36' month(3), interval '100' day(3));
insert into customer values(3, '홍길동3', 'm','남', sysdate, interval '36' month(3), interval '100' day(3));
insert into customer values(4, '홍길동4    ', 'm','남  ', sysdate, interval '36' month(3), interval '100' day(3));

select* from customer
where cust_name = '홍길동4    ';

select* from customer
where trim cust_name = '홍길동4';

select* from customer
where gender2 = '남';

--char 고정길이
--varchar 가변길이

select cust_name, birthday, birthday+year01, birthday+day01 from customer;


create table emp2(
empid number(3),
empname vatchar(20),
salary number(9,2)
)
insert into emp2 values(1, '아아아아아아아아', 1000000.12)
insert into emp2 values(1, '아아아아아아아아', 1000000.12)

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

--구조와 데이터 모두 삭제 
drop table customer2


--구조는 남기고 데이터 삭제
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

insert into customer2 values(1,'aa','M','남자', sysdate)
insert into customer2(cust_id,cust_name,gender,gender2)(2,'aa','M','남자')
insert into customer2 (cust_id,cust_name) values (3,'aa')

--입력되지 않은 칼럼은 null



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

--P(primary key) 유일 값 , null 불가 하나의 체이블에 오직하나(필수값)
--U(unique) 유일값 null가능
--R(Foregin key) 참조키, 외래키, 일반적으로 다른 테이블의 pk를 참조 캍은테이블의 컬럼 참조
--C(Check) 조건에 맞는 데이터만 가능

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


insert into customer (cust_id, cust_name, email,gender,dept_id,loc) values(5, '아아아','eye2ty3', 'M', 100,'deajoen');


select constraint_type, column_name
from user_constraints join user_cons_columns using(constraint_name)
where user_constraints.table_name = 'JOB_HISTORY';


상품정보 -> 번호, 이름, 가격
주문 -> 고객번호 주문일자 순서 상품번호 수량
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
2007년 입사한(hire_date) 직원들의 사번(employee_id), 이름(employee_id), 
성(last_name), 부서명(department_name)을 조회하려 합니다.
임시 테이블 용도로 사용하는 Object를 생성합니다.
==>emp_2007_details

이때, 부서에 배치되지 않은 직원의 경우, '<NOT ASSIGNED>'로 보여줍니다.


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
기존 EMPLOYEES 테이블에 있는 레코드들 중, 'Marketing'부서에 근무하는 직원 레코드를
  이용하여 EMPLOYEES_MARKETING 테이블을   만들기 위한 DDL을 작성하십시오. 
  단, EMPLOYEES_MARKETING 테이블의 키는   없어도 관계없습니다.


 create table EMPLOYEES_MARKETING
 as
 select *
 from employees left outer join departments using (department_id)
 where department_name = 'Marketing'
 

========================================

3.
인사관리를 위하여 현재 직원정보에 대한 백업테이블을 생성하여 보관하기로 합니다. 
새로 생성하는 백업테이블명은 "EMPLOYEES_BACKUP" 이며 기존테이블(EMPLOYEES)의 Index, 
Constraint는 필요로 하지 않습니다. 단 급여(Salary)가 5000을 초과하는 직원만 백업테이블 내에 존재해야 합니다.
위 설명에 해당하는 테이블을 생성하기 위한 sql 스크립트를 작성하시오. 

 create table EMPLOYEES_BACKUP
 as
 select *
 from employees
 where salary >= 5000



 
========================================

4.
인사관리를 위한 시스템 구축중 지역(Regions), 국가(Countries), 
위치(Locations)에 대한 전체 리스트 정보를 빈번하게 사용할 경우가 생겼다. 
여러 프로그램에서 매번 반복적으로 사용되며 일부 개발자의 경우 잘못된 
조인으로 올바른 결과를 가져오지 못하는 경우가 발생하였다. 
이를 해결하기 위해 복잡한 질의를 숨기기 위한 논리적 테이블의 용도로 
쓰이는 DB Object 를 생성하기로 하였다. 
DB Object 이름은 LOC_DETAILS_{DB OBJECT명} 을 사용한다.
위 설명에 해당하는 DB Object를 생성하기 위한 sql 스크립트를 작성하라.

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
사원이 한 명 이상인 부서들에 대해 부서 번호, 부서 이름, 사원 수, 
최고 급여, 최저 급여, 평균 급여, 급여 총액을 빈번하게 조회하여야 
할 필요가 있어, VIEW를 생성하여 사용하고자 합니다. 
생성된 DB Object(VIEW)의 전체 레코드에 대한 조회 를 작성하십시오. 결과가 아래와 같이 출력되도록 
"DEPT_SAL_INFO"라는 VIEW 를 생성하는 sql 스크립트
단, 평균 급여의 소수점 이하는 절사합니다.

출력 : DEPT_ID | DEPT_NAME | NUM_EMP | MAX_SAL | MIN_SAL | AVG_SAL | SUM _SAL

select*from departments
select*from employees

 
 create table DEPT_SAL_INFO as
 select department_id, department_name, count(first_name), max(salary), min(salary), avg(salary), sum(salary)
 
 
 )
 
 
 

========================================
6.
Sales 부서에서 Gerald Cambrault 라는 관리자(Manager_id)를 가지는 
직원의 정보를 조회하여 employee_sales_Gerald 라는 view를 생성하십시오.

사원번호  |  사원명  |  부서명  |  관리자명

 
=====================================
7.
다음 조건을 만족하는 테이블 생성 DDL을 작성하십시오. 

테이블 명 : board

테이블에 대한 이해 : 게시판 정보를 가지는 테이블

칼럼명: 
board_seq	    (게시물 번호) 정수 최대 10자리,
board_title	    (게시물 제목) 문자 가변 자릿수 255자리,
board_contents   (게시물 내용) 문자 가변 자릿수 4000자리
board_writer     (게시물 작성자) 문자 가변 자릿수 100자리,
board_date       (게시물 작성시간) 날짜,	
board_viewcount  (게시물 조회수) 정수 최대 6자리,
board_password   (게시물 암호) 문자 가변 자릿수 20자리,	

제약조건 :  board_seq : 기본 키(Primary Key)  제약 조건명은 BOARD_SEQ_PK
 board_title :  값이 반드시 존재(NOT NULL) 
 board_writer : Member 테이블의 member_id 컬럼 참조

(Member  테이블
member_id 문자 가변 자릿수 100자리
           primary key 라고 가정합니다)


====================================

8.locations 테이블에서 2000번 이상의 도시코드, 도시명, 국가명, 그 도시에 있는
 부서명을 조회하여 citycode_gt_2000 라는 이름의 view를  생성하는 SQL 문장을 작성하시오.
단, citycode_gt_2000 view는 변경 가능하도록 생성합니다.

LOCATION_ID	  CITY	  COUNTRY_NAME	  DEPARTMENT_NAME






























