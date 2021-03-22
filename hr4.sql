create or replace procedure sp_epmlist1
is
--선언부
    v_emp_record employees%rowtype;
    --1.커서선언
    cursor cur_emp is select employee_id, first_name, last_name from employees;
begin
--실행부
--2.커서실행
    open cur_emp;
--3.한건씩 fetch
    loop
    fetch cur_emp into v_emp_record.employee_id, v_emp_record.first_name, v_emp_record.last_name;
    exit when cur_emp%NOTFOUND;
    dbms_output_line('직원번호'|| v_emp_record.employee_id);
    dbms_output_line('직원번호'|| v_emp_record.first_name);
    dbms_output_line('직원번호'|| v_emp_record.last_name);
    end loop;
--4.커서닫기
    close cur_emp;
end;
/


set serverout on;
execute sp_epmlist1;



create or replace procedure sp_epmlist
is
--선언부
    v_emp_record employees%rowtype;
    --1.커서선언
    cursor cur_emp is select employee_id, first_name, last_name from employees;
begin
--실행부
--2.커서실행
    open cur_emp;
--3.한건씩 fetch
    loop
    fetch cur_emp into v_emp_record.employee_id, v_emp_record.first_name, v_emp_record.last_name;
    exit when cur_emp%NOTFOUND;
    dbms_output.put_line('직원번호'|| v_emp_record.employee_id);
    dbms_output.put_line('직원번호'|| v_emp_record.first_name);
    dbms_output.put_line('직원번호'|| v_emp_record.last_name);
    end loop;
--4.커서닫기
    close cur_emp;
end;
/

execute sp_epmlist;





















create or replace procedure sp_epmlist2
is
begin
    for emp_rec in (select employee_id, first_name, last_name from employees) loop
    dbms_output.put_line('직원번호'|| v_emp_record.employee_id);
    dbms_output.put_line('직원번호'|| v_emp_record.first_name);
    dbms_output.put_line('직원번호'|| v_emp_record.last_name);
    end loop;
end;
/






--패키지 실행부
creat or replace package body pkg_ep2
is
   procedure sp_epmlist1
is
--선언부
    v_emp_record employees%rowtype;
    --1.커서선언
    cursor cur_emp is select employee_id, first_name, last_name from employees;
begin
--실행부
--2.커서실행
    open cur_emp;
--3.한건씩 fetch
    loop
    fetch cur_emp into v_emp_record.employee_id, v_emp_record.first_name, v_emp_record.last_name;
    exit when cur_emp%NOTFOUND;
    dbms_output_line('직원번호'|| v_emp_record.employee_id);
    dbms_output_line('직원번호'|| v_emp_record.first_name);
    dbms_output_line('직원번호'|| v_emp_record.last_name);
    end loop;
--4.커서닫기
    close cur_emp;
end;
    procedure sp_epmlist2
is
begin
    for emp_rec in (select employee_id, first_name, last_name from employees) loop
    dbms_output.put_line('직원번호'|| v_emp_record.employee_id);
    dbms_output.put_line('직원번호'|| v_emp_record.first_name);
    dbms_output.put_line('직원번호'|| v_emp_record.last_name);
    end loop;
end;
end;
/


--trigger : 자동으로 실행되는 procedure

create or replace trigger tri_jobs
after insert on jobs
begin
    dbms_output.put_line ('jobs 테이블에 1건 입력됨');
end;
/

desc jobs;
insert into jobs
values ('test','sd',1000,333);

drop jobs_ref;

create table jobs_ref(
    salno number(4) primary key,
    sal number(7,2),
    job_id varchar2(10) references jobs(job_id)
);


create sequence jobs_ref_seq; 

select *from jobs_ref;

create or replace trigger tri_jobs
after insert on jobs
for each row
begin
    dbms_output.put_line ('jobs 테이블에 1건 입력됨');
    insert into jobs_ref values(jobs_ref_seq.nextval,1000, :new.job_id);
end;
/



create or replace trigger tri_jobs_del
after insert on jobs
for each row
begin
    dbms_output.put_line ('jobs 테이블에 1건 삭제됨');
    delete from jobs_ref where job_id = :OLD.job_id;
end;
/




CREATE TABLE 상품(
상품코드 CHAR(6) PRIMARY KEY,
상품명 VARCHAR2(12) NOT NULL,
제조사 VARCHAR(12),
소비자가격 NUMBER(8),
재고수량 NUMBER DEFAULT 0
);


create table 입고(
입고번호 NUMBER(6) PRIMARY KEY,
상품코드 CHAR(6) REFERENCES 상품(상품코드),
입고일자 DATE DEFAULT SYSDATE,
입고수량 NUMBER(6),
입고단가 NUMBER(8),
입고금액 NUMBER(8)
);

INSERT INTO 상품(상품코드, 상품명, 제조사, 소비자가격)
VALUES('A00001','세탁기', 'LG', 500); 
INSERT INTO 상품(상품코드, 상품명, 제조사, 소비자가격)
VALUES('A00002','컴퓨터', 'LG', 700);
INSERT INTO 상품(상품코드, 상품명, 제조사, 소비자가격)
VALUES('A00003','냉장고', '삼성', 600);


CREATE OR REPLACE TRIGGER TRG_04
AFTER INSERT ON 입고
FOR EACH ROW
BEGIN
UPDATE 상품
SET 재고수량 = 재고수량 + :NEW.입고수량
WHERE 상품코드 = :NEW.상품코드;
END;
/

UPDATE 입고 SET 입고수량=10, 입고금액=2200
WHERE 입고번호=2;
SELECT * FROM 입고 ORDER BY 입고번호;
SELECT * FROM 상품;

INSERT INTO 입고(입고번호, 상품코드, 입고수량, 입고단가, 입고금액) 
VALUES(1, 'A00001', 5, 320, 1600);
INSERT INTO 입고(입고번호, 상품코드, 입고수량, 입고단가, 입고금액) 
VALUES(2, 'A00002', 10, 680, 6800);


select * from tab


