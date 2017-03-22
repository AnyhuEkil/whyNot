-- 	11 start. z01_sql_basic
/*
1. DML : Data Maniplulation Language
1) select : ��ȸ�� ���.
2) insert : ������ �Է½� ���.
   insert into ���̺�� values(������1, ������2, ������3);
   
*/
select * from dept;
/*
���̺� �����ϱ�..
create table ���ο����̺��
as select * from ���������̺��;
*/
create table dept01
as select * from dept;
select * from dept01;
/*
������ �Է�1)
ex) insert into dept01 values(50,'�ѹ���','����');
*/
insert into dept01 values(50,'�ѹ���','����');
select * from dept01;
commit;
-- Ȯ��ó��, �������ϰų� �ٸ� ����ڵ� ����� �����͸� �� �� �ְ�.
/*
������ �Է�2
insert into ���̺��(�������÷���1, ������ �÷���2) 
           values(ù��°�Է��ҵ�����,�ι�°�Է��� ������);
ex) dept01���̺��� deptno�� 60�� �Է��Ѵ�.
    dept01���̺��� deptno�� loc�� �Է��Ѵ�.
*/
insert into dept01(deptno) values(60);
select * from dept01;
insert into dept01(deptno, loc) values(70,'��õ');
/*
3) update : �ԷµǾ� �ִ� ������ ������, ������ �ʿ��� �κ���
	����ó���Ѵ�.
	update ���̺��
	  set �����ϰ����ϴ��÷���1=�����ҵ�����,
	  	  �����ϰ����ϴ��÷���2=�����ҵ�����
	 where �����ϰ����ϴ� ����(�÷���=���ǵ�����);
*/
select * from dept01;
-- dept01�� deptno�� 60�� �������� �ϴ� �����͸� dname �λ�, loc ��������
-- ����ó��.
update dept01
  set dname='�λ�',
      loc='����'
where deptno=60;
select * from dept01;
-- Ȯ�ο���..
-- select * from emp;
-- emp01�̶�� ���� ���̺��� �����
-- 1) empno�� ���� ���� ��ȣ���� +1�ؼ�, ename�� job, sal�� �Է��ϼ���
-- 2) �׿ܿ� �÷� mrg, hirdate(sysdate-���糯¥�μ���), deptno�� 40���� ����ó���ϼ���
select * from emp;
create table emp01
as select * from emp;
select max(empno)+1 from emp01;
-- 7935
insert into emp01(empno, ename, job, sal) 
          values(7935, 'ȫ�浿','SUPERMAN',5000);
commit;
SELECT * FROM emp01 where empno=7935;
update emp01
   set mgr=7777,
       hiredate=sysdate,
	   deptno=40
where empno=7935;
--  ����
-- emp03 �������̺� ����
-- 1. �Է�  empno�� ���� ���������� -1, mgr: CLERK �� mgr�Է�, sal:��տ���,
--    comm:��ücomm�� �հ�
select min(empno)-1, avg(sal), sum(comm)
from EMP03;
-- 7368, 2073.21, 2200
select mgr
from EMP03
where job='CLERK';
-- 7902, 7788, 7698, 7782
INSERT INTO EMP03(EMPNO, SAL, COMM, MGR) VALUES( 7368,2073.21,2200,7902);
INSERT INTO EMP03(EMPNO, SAL, COMM, MGR) VALUES( 7368,2073.21,2200,7788);
INSERT INTO EMP03(EMPNO, SAL, COMM, MGR) VALUES( 7368,2073.21,2200,7698);
INSERT INTO EMP03(EMPNO, SAL, COMM, MGR) VALUES( 7368,2073.21,2200,7782);
SELECT * FROM EMP03;
-- 2. ���� ename:'�ű浿', job�� SUPERMAN, hirdate�� �ֱٿ� �Ի���+1
SELECT MAX(HIREDATE)+1
FROM EMP;
UPDATE EMP03
		SET ENAME='�ű浿',
		JOB='SUPERMAN',
		HIREDATE=(SELECT MAX(HIREDATE)+1 FROM EMP03);
select * from  EMP03;
/*
4. delete : Ư�� ������ �����͸� ����ó���ϴ� ����
	delete [����] from ���̺��
	where ����[�÷��� = ���ǵ�����]
*/
-- DNAME�� 'SALES'�� �����͸� DEPT01���� �����Ͻÿ�..
DELETE FROM dept01
where DNAME='SALES';
-- Ȯ�ο��� deptno�� 50�̻��� �����͸� ��� �����Ͻÿ�..
select * from dept01;
delete from dept01
where deptno>=50;
-- emp01���̺� comm�� null�̰�, deptno�� 20�� �����͸� �����ϼ���.
delete from emp01
where comm is null
and deptno=20;
/*
Transaction(Ʈ�����) : �����ͺ��̽����� ó���� �� ������ �ǹ��ϸ�, 
�������� sql���� �ϳ��� ���� �۾� ������ ó���ϴµ� �̸� �ǹ��ϱ⵵ �Ѵ�.
TCL(Trasaction Control Language) : �̷��� Ʈ������� ��� ���� ��ɾ�..
 commit : �������� dml�� ���� ����,����, �Էµ� ������ Ȯ��ó��..
 rollback : �����͸� commit�ϱ����� ���� ���� �Էµ� ������ ����ó��..
 savepoint : �����͸� Ư���������� ����ó���ϰ��� �Ҷ�, ������ save�ϴ� ���� ���Ѵ�.
*/
select * from dept01;
-- 1) dept01���̺� deptno 30 '�ѹ�' '����'�� �Է��� ��, rollbackó���� �غ���.
-- 2) dept01���̺� deptno 40 '�λ�' '����'�� �Է��ѵ�,
--        commit�ϰ�  �������� ���� commit���� �ʰ� �������� ��� �������� ���� ������
--        Ȯ���Ѵ�.
insert into dept01 values(30,'�ѹ�','����');
rollback;
-- �����Ͱ� �ԷµǱ� ������ ���ư��� ���� Ȯ���� �� �ִ�.
insert into dept01 values(50,'�λ�1','����1');
-- db������ ���´�.
-- �ܺο��� comit�ϱ� ������ �����Ͱ� ���� ������ �ȴ�.
-- tool�� ���� autocommit�� �߻��ϴ� ��찡 �ִ�..
select * from emp01;
-- 	12 start. z02_sql_basic
/* z02_sql_basic.sql
DDL :data definition language
���̺� ���� ����, ���� �� �����ϴ� ���� ���Ѵ�.
ũ��..
1. ���̺� ������ �űԷ� �����ϴ� create table
2. ���̺� ������ �����ϴ� alter table
3. ���̺� ������ ���� drop table
4. ��Ÿ  -  truncate, rename ���̺��
*/
/*
1. create table(���̺����)
	create table ���̺��(�÷��� datatype ��Ÿ��������,
	                       ...      );
	1) datatype
		char(size) : ������ ���ڿ�, ���ڿ��� ũ�Ⱑ ������ ������
				ū�����Ͱ� ���� �� ������, ���������ʹ� ������ ũ��� ����ȴ�.
		varchar2(size) : ������ ���ڿ�, �������� �ִ� ũ�⸦ �����ϸ�,
				�� ������ ������ ũ�Ⱑ ���������� ����� �� �ִ�.
		number(��ü�ڸ���, �Ҽ��������ڸ���) : ���ڸ� �����ϴ� data type,
				number(����), number( ����, 0) : ������ data type ����.
				�Ҽ��������ڸ����� �����ָ� �Ǽ��� �����͸� ������ �� �ִ�.
		date : ��¥�� �����ϴ� ������ type (��¥+�ú���)
		long : 4000byte�̻��� ���ڿ��� ���� �Ҷ� Ȱ��Ǵ� ������Ÿ��.�ְ�ġ 2gb
		lob : 2g���� ���̳ʸ�(��� �������尡��) ������ ����
			

	1) ���̺� �����ϱ�.
		create table ���̺��(�÷��� ������type)
		ex) emp10��� ���̺� �÷��� empno ������, ename ����������, sal �Ǽ�������
			������� �Ѵ�.			
*/
create table emp10( empno number(4), ename varchar2(20), sal number(7,2) );
/*
���� login�� �ϴ� ȭ���� ����� id�� password�� üũ�ϰ�, ���� ȭ�鿡��
	id@@@ �� ȯ���մϴ�. ���� point�� @@@ �Դϴ�. ��� ������ ��Ÿ���ٰ� �Ѵ�.
	�̿� �ʿ�� �ϴ� ���̺�� ���̺� ������ ���弼��..
*/
CREATE TABLE LOGIN(
	ID VARCHAR2(10),
	PASSWORD VARCHAR2(15),
	POINT NUMBER
);
/*���̺� ���� �����ϱ�.
1. ���̺��� ���ο� �÷��� �߰� �� �� - add column
2. ���̺� �÷��� ������ �� - modify column
3. ���̺� �÷��� ������ �� - drop column

## �⺻ ����..
alter table ���̺��̸� add(�÷��� ������type)
ex) emp01�� job�̶�� �̸����� ����������9�� ���� �÷��� �߰��Ѵ�..
*/
select * from emp10;
alter table emp10 add(job varchar2(9));
-- Ȯ�� emp10 ��¥�������� createDate, �Ǽ���������7,3 �߰��ҷ��� �Ѵ�.
alter table emp10 add(createDate date, sal2 number(7,3));
/*
���̺� �÷� ����
alter table ���̺��
modify(�������÷��� �����ҵ�����type);

ex) emp10���̺��� sal2 �� ���������� �����ϰ��� �Ѵ�.

*/
alter table emp10
modify(sal2 varchar2(10));
/*
���̺��� data type������ �Ѱ�
1. ������ �ִ� ���
	1) �ٸ� data type���� ������ �Ұ���..
	2) ���� data type�̶� ���� ���� ���� ������ type������ �Ұ���.
2. ������ ���� ���
	type�� ũ�⺯���� �����Ӵ�.. 
*/
/*
���̺��� �÷� ����..
alter table ���̺��
drop column  �÷���;

ex) emp10���� sal2 �÷��� ���� ó���Ѵ�..
*/
alter table emp10
drop column sal2;
select * from emp10;
/*
���̺�� ����
alter table �������̺�� rename to ���ο����̺��.
ex) emp10���̺���� empexp10���� ���̺���� �����Ѵ�.
*/
select * from empexp10;
alter table emp10 rename to empexp10;
/*
�÷��� ����
alter table ���̺�� rename column �����÷��� to ���ο��÷���

ex) empexp10���� createdate�÷��� hiredate�� ����ó��..
*/
alter table empexp10 rename column createdate to hiredate;
select * from empexp10;
/* Ȯ�ο���
	dept01 ���̺���  dept10Exp��� ���̺������ �����ϰ�,
	�÷��� loc�� location���� �����Ͻÿ�. ũ��� 13--> 25��.
	
*/
alter table dept01 rename to dept10Exp;
select * from dept10Exp;
alter table dept10Exp rename column loc to location;
alter table dept10Exp modify location varchar(25);
/*
ddl�� �������� ��� ���� ���� ó��..
truncate table ���̺��..
 ex) dept10Exp�� �ִ� ��� �����͸� ddl�� ���� ó��..
*/
truncate table dept10Exp;
select * from dept10Exp;
/*
���̺� ���� ����

*/
-- 	13 start. z03_sql_constraint
/* z03_sql_constraint.sql
������ ���Ἲ ���� ����?
�������� �ŷڼ��� Ȯ���ϱ� ���Ͽ�, ���̺� ������, �÷� �Ӽ�������
�����ϴ� ���� ���Ѵ�.
#�������� 5����..
1) not null : null ������� �ʴ´�.
2) unique : ���ϰ��� �Է��� ������� �ʴ´�.
3) primary key : not null�� unqique�� ó���ؾ� �ϴ� ��..
4) foreign key : �����Ǵ� ���̺��� �÷����� �����ؾ� �Է��� ����
5) check : ���� ������ �����Ͱ��� ������ ������ ����..

1. not null
	��� ���̺� ����� ������ ������ ��, �ݵ�� �����ȣ�� ����̸��� ����Ǿ�� �Էµǵ���
	ó���ϰ��� �Ҷ�..
	create table ���̺��(�÷��� �÷�type not null, ..., ...);

*/
create table emp02(
	empno number(4) not null,
	ename VARCHAR2(10) not null,
	job varchar2(9),
	deptno number(4)
);
-- �������ǿ� �մ��ؾ��� �����Ͱ� �Է��� �����ϰ� ó�� ��..
insert into emp02 values(1000,'ȫ�浿','�븮',30);
select * from emp02;
/*
unique �������� : ������ �Է¿� �־, ������ ������ �Է��� ������� �ʴ� ���� ���Ѵ�.
emp03 ���̺�  empno�� unique������������ ������ ����� �Է����� ���ϰ� ó���ϼ���..
*/
create table emp03(
	empno number(4) unique,
	ename varchar(25),
	mgr number(4)
);
insert into emp03 values(1000,'himan',null);
insert into emp03 values(1001,'himan2',7788);
insert into emp03 values(1002,null,null);
insert into emp03 values(1003,'himan3',8888);
select * from emp03;
/*
primary key : not null(�ݵ�� ������ �Է��ؾ�), unique(�ݵ�� ������ ������)
	�� ������ �Ѵ� ó���� ��, ���δ�. �ַ� �������̺��� key���� ������ �� Ȱ��ȴ�.
	ex) memeber���̺� memberid����  primary key�� �����ϼ���..
*/
create table memeber(
	memberid varchar(20) primary key,
	pass varchar(20),
	name varchar(50),
	loc varchar(100)
);
insert into memeber values('1111','7777','ȫ�浿','���ﰭ��');
insert into memeber values('1112','7777','ȫ�浿','���ﰭ��');
insert into memeber values(null,'7777','ȫ�浿','���ﰭ��');
/*
foreign key : �����Ǵ� ���̺��� �ݵ�� ���� �Է��ؾ� �ϴ� ��츦 ���Ѵ�.

*/
select * from emp;
select * from dept;
drop table DEPT_REF;
CREATE TABLE DEPT_REF
(
   DEPTNO   NUMBER (2) primary key,
   DNAME    VARCHAR2 (14),
   LOC      VARCHAR2 (13)
);
CREATE TABLE EMP_REF
(
   EMPNO      NUMBER (4) primary key,
   ENAME      VARCHAR2 (10),
   JOB        VARCHAR2 (9),
   MGR        NUMBER (4),
   HIREDATE   DATE,
   SAL        NUMBER (7, 2),
   COMM       NUMBER (7, 2),
   DEPTNO     NUMBER (2) REFERENCES DEPT_REF(DEPTNO)
);
--  �÷� �÷�TYPE references ���������̺��(�������÷���)
insert into DEPT_REF values(20, '�ѹ�','���');
select * from DEPT_REF;
insert into EMP_REF(EMPNO, ENAME, DEPTNO) values(1000,'ȫ�浿',10);
select * from EMP_REF;
insert into EMP_REF(EMPNO, ENAME, DEPTNO) values(1002,'���浿',20);
/* ����
����Ű ���迡 �ִ� ���̺� �����ϱ� 
�������̺�  student_main(id, pass, name) :���̵�, �н�����, �̸�
�������̺�  student_point(id, subject, point); ���̵�, ����, ����
  student_main �� student_point  id��  foreign key ���踦 �����ϰ�,
  student_main�� �����Ͱ� �־�߸� student_point�� �Է��� �� �ְԲ� ó��
*/
CREATE TABLE student_main
(
   ID VARCHAR2(20) PRIMARY KEY,
   PASS VARCHAR2(20),
   NAME  VARCHAR2 (50)
);
SELECT * FROM STUDENT_MAIN;
SELECT * FROM STUDENT_POINT;
INSERT INTO STUDENT_MAIN VALUES('C001001','7777','ȫ�浿');
INSERT INTO STUDENT_MAIN VALUES('C001002','7777','�ű浿');
INSERT INTO STUDENT_MAIN VALUES('C001003','7777','���浿');
CREATE TABLE STUDENT_POINT(
	ID VARCHAR2(20) REFERENCES STUDENT_MAIN(ID),
	subject VARCHAR2(50),
	POINT NUMBER
);
-- �����߻�
INSERT INTO STUDENT_POINT VALUES('C001004','����',70);
INSERT INTO STUDENT_POINT VALUES('C001004','����',80);
INSERT INTO STUDENT_POINT VALUES('C001004','����',90);
SELECT * FROM STUDENT_MAIN A, STUDENT_POINT B
WHERE A.ID = B.ID;
/*
check ���� ����
�Էµȴ� ���� üũ�Ͽ� ������ �� �̿��� ���� ������ ���ϰ� ������ �����ϴ� ���� ���Ѵ�.
ex) ������̺� gender��� �÷��� �ΰ�, ���⿡ 'M', 'F' �ΰ��� �� �ܿ��� �Է� ���� 
���ϰ� ó������.
*/
create table emp04(
 empno number(4),
 ename varchar2(10),
 gender varchar2(1) check(gender in('M','F'))
);
insert into emp04 values(9998,'�ű浿','D');
select * from emp04;
-- 	14 start. z04_sql_datadictionary
/*
������ ����(������ dictionary)
�����ڿ��� �����ͺ��̽��� ���õ� ������ �����ϴ� ���� ���Ѵ�.

DBA_XXX : �����ڸ� ���ٰ����� ��ü(���̺� ��)�� ���� ��ȸ.
ALL_XXX : �ڽ� ���� ���� �Ǵ� ������ �ο� ���� ��ü(���̺�)�� ������ȸ
USER_XXX : �ڽ��� ������ ������ ��ü � ���� ���� ��ȸ.
*/
select * from user_tables
where table_name like '%EMP%';
-- ����� ���̺� ���� ����..
/*
�������� Ȯ���ϱ�..
user_constraints���� �� ���̺��� ���Ἲ �������ǿ� ���õ� ������ ������
��ųʸ��� ���ؼ� Ȯ���� �� �մ�.
## contraint_type
P : primary_key
R : foreign_key
U : unique
C : check, not null

** ������ ������ ���ؼ� ������ ���̺��� ���, ���̺��� ����, ���������� 
Ȯ���� �� �ִ�..
*/
select * from user_constraints
where table_name like '%DEPT%';
-- 	15 start. z05_sql_index
/*
�ε�����?
�����Ϳ� ������ �����ϴ� ���� ���� �����μ� �����ͺ��̽��� ���� ��� ������ �ִ� ��ü
1) ����
- �˻� �ӵ��� ��������.
- �ý��ۿ� �ɸ��� ���ϸ� �ٿ��� �ý��� ��ü ������ ����Ų��.
2) ��������
- ����(������, ��������), ���̺� ����, ������ �Է�, ����
- ��� ������ ���Ͻ� ����
3) ��� ����
- ���̺��� ���� ���� ���� ��.(������ �Ǽ�)
- where ������ index�� �ش� �÷��� ���� ���� ��.(��ȸ���� ����Ѵ�)
	ps) ���̺� �Է�, ����, ������ ���� �Ͼ� ���� ������� �ʴ� ����
		�Ϲ����̴�.
- �˻� ����� ��ü �������� 2~4%������ ��.
	ex) 1000������ �����Ͱ� �ִ� �λ����� �ִ� ��쿡 �˻��� 20~40����  �ȿ�
	    �����͸� �ε��ؼ� ���� �� index�� ó����. 
4) �ε��� ����
- �ε����� ���� �߰� ������ �ʿ�
- �ε����� �����ϴµ� �ð��� �ɸ���.		
*/
/*
�ε��� ���� ���� �����.
1. �������̺� �����
create table EMP_IDX_EXP
AS
SELECT * FROM EMP;
2. �ε��� ó���� �÷� ����.
EMP_IDX_EXP���� EMPNO�� INDEX�� ����
3. �ε��� ����(�ش����̺� �ε��� ����)
CREATE INDEX �ε����̸�
ON ���������̺��(��������÷�)
CREATE INDEX INDEX_EMPNO_EMP_IDX_EXP
ON EMP_IDX_EXP(EMPNO);
*/
create table EMP_IDX_EXP
AS
SELECT * FROM EMP;
SELECT * FROM EMP_IDX_EXP;
-- EMP_IDX_EXP ���̺� EMPNO�� INDEX�� �����Ѵ�.
CREATE INDEX INDEX_EMPNO_EMP_IDX_EXP
ON EMP_IDX_EXP(EMPNO);
-- �ε��� ����
-- DROP INDEX �ε����̸�.
DROP INDEX INDEX_EMPNO_EMP_IDX_EXP;
/*
Ȯ�ο���..
DEPT ���̺� ���纻 DEPT_IDX_EXP �����, 
�ε��� �̸��� IDX_DEPTNO_DEPT�� �ؼ� ����, Ȯ�� �� ���� ó��..

*/
SELECT * FROM DEPT;
CREATE TABLE DEPT_IDX_EXP
AS SELECT * FROM DEPT;
CREATE INDEX IDX_DEPTNO_DEPT
ON DEPT_IDX_EXP(DEPTNO);
SELECT * FROM IDX_DEPTNO_DEPT;
