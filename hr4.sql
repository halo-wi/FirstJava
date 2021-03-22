create or replace procedure sp_epmlist1
is
--�����
    v_emp_record employees%rowtype;
    --1.Ŀ������
    cursor cur_emp is select employee_id, first_name, last_name from employees;
begin
--�����
--2.Ŀ������
    open cur_emp;
--3.�ѰǾ� fetch
    loop
    fetch cur_emp into v_emp_record.employee_id, v_emp_record.first_name, v_emp_record.last_name;
    exit when cur_emp%NOTFOUND;
    dbms_output_line('������ȣ'|| v_emp_record.employee_id);
    dbms_output_line('������ȣ'|| v_emp_record.first_name);
    dbms_output_line('������ȣ'|| v_emp_record.last_name);
    end loop;
--4.Ŀ���ݱ�
    close cur_emp;
end;
/


set serverout on;
execute sp_epmlist1;



create or replace procedure sp_epmlist
is
--�����
    v_emp_record employees%rowtype;
    --1.Ŀ������
    cursor cur_emp is select employee_id, first_name, last_name from employees;
begin
--�����
--2.Ŀ������
    open cur_emp;
--3.�ѰǾ� fetch
    loop
    fetch cur_emp into v_emp_record.employee_id, v_emp_record.first_name, v_emp_record.last_name;
    exit when cur_emp%NOTFOUND;
    dbms_output.put_line('������ȣ'|| v_emp_record.employee_id);
    dbms_output.put_line('������ȣ'|| v_emp_record.first_name);
    dbms_output.put_line('������ȣ'|| v_emp_record.last_name);
    end loop;
--4.Ŀ���ݱ�
    close cur_emp;
end;
/

execute sp_epmlist;





















create or replace procedure sp_epmlist2
is
begin
    for emp_rec in (select employee_id, first_name, last_name from employees) loop
    dbms_output.put_line('������ȣ'|| v_emp_record.employee_id);
    dbms_output.put_line('������ȣ'|| v_emp_record.first_name);
    dbms_output.put_line('������ȣ'|| v_emp_record.last_name);
    end loop;
end;
/






--��Ű�� �����
creat or replace package body pkg_ep2
is
   procedure sp_epmlist1
is
--�����
    v_emp_record employees%rowtype;
    --1.Ŀ������
    cursor cur_emp is select employee_id, first_name, last_name from employees;
begin
--�����
--2.Ŀ������
    open cur_emp;
--3.�ѰǾ� fetch
    loop
    fetch cur_emp into v_emp_record.employee_id, v_emp_record.first_name, v_emp_record.last_name;
    exit when cur_emp%NOTFOUND;
    dbms_output_line('������ȣ'|| v_emp_record.employee_id);
    dbms_output_line('������ȣ'|| v_emp_record.first_name);
    dbms_output_line('������ȣ'|| v_emp_record.last_name);
    end loop;
--4.Ŀ���ݱ�
    close cur_emp;
end;
    procedure sp_epmlist2
is
begin
    for emp_rec in (select employee_id, first_name, last_name from employees) loop
    dbms_output.put_line('������ȣ'|| v_emp_record.employee_id);
    dbms_output.put_line('������ȣ'|| v_emp_record.first_name);
    dbms_output.put_line('������ȣ'|| v_emp_record.last_name);
    end loop;
end;
end;
/


--trigger : �ڵ����� ����Ǵ� procedure

create or replace trigger tri_jobs
after insert on jobs
begin
    dbms_output.put_line ('jobs ���̺� 1�� �Էµ�');
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
    dbms_output.put_line ('jobs ���̺� 1�� �Էµ�');
    insert into jobs_ref values(jobs_ref_seq.nextval,1000, :new.job_id);
end;
/



create or replace trigger tri_jobs_del
after insert on jobs
for each row
begin
    dbms_output.put_line ('jobs ���̺� 1�� ������');
    delete from jobs_ref where job_id = :OLD.job_id;
end;
/




CREATE TABLE ��ǰ(
��ǰ�ڵ� CHAR(6) PRIMARY KEY,
��ǰ�� VARCHAR2(12) NOT NULL,
������ VARCHAR(12),
�Һ��ڰ��� NUMBER(8),
������ NUMBER DEFAULT 0
);


create table �԰�(
�԰��ȣ NUMBER(6) PRIMARY KEY,
��ǰ�ڵ� CHAR(6) REFERENCES ��ǰ(��ǰ�ڵ�),
�԰����� DATE DEFAULT SYSDATE,
�԰���� NUMBER(6),
�԰�ܰ� NUMBER(8),
�԰�ݾ� NUMBER(8)
);

INSERT INTO ��ǰ(��ǰ�ڵ�, ��ǰ��, ������, �Һ��ڰ���)
VALUES('A00001','��Ź��', 'LG', 500); 
INSERT INTO ��ǰ(��ǰ�ڵ�, ��ǰ��, ������, �Һ��ڰ���)
VALUES('A00002','��ǻ��', 'LG', 700);
INSERT INTO ��ǰ(��ǰ�ڵ�, ��ǰ��, ������, �Һ��ڰ���)
VALUES('A00003','�����', '�Ｚ', 600);


CREATE OR REPLACE TRIGGER TRG_04
AFTER INSERT ON �԰�
FOR EACH ROW
BEGIN
UPDATE ��ǰ
SET ������ = ������ + :NEW.�԰����
WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
END;
/

UPDATE �԰� SET �԰����=10, �԰�ݾ�=2200
WHERE �԰��ȣ=2;
SELECT * FROM �԰� ORDER BY �԰��ȣ;
SELECT * FROM ��ǰ;

INSERT INTO �԰�(�԰��ȣ, ��ǰ�ڵ�, �԰����, �԰�ܰ�, �԰�ݾ�) 
VALUES(1, 'A00001', 5, 320, 1600);
INSERT INTO �԰�(�԰��ȣ, ��ǰ�ڵ�, �԰����, �԰�ܰ�, �԰�ݾ�) 
VALUES(2, 'A00002', 10, 680, 6800);


select * from tab


