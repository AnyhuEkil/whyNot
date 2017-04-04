/*

	16. a11_hierarchQuery

������ ����
����Ŭ���� ������ ������ ���̺��� ȿ�������� �����ϱ� ����
query�� ���Ѵ�. (self join�� ȿ���� ó��)

������ ���� : ������ ���迡 ���̺� ������ ������ ���� ���Ѵ�.
ex)         �Ҿƹ���(id, parentId, role : 1, 0, '�Ҿƹ���') 
   �ƹ���(2,1,'�ƹ���')      ����(3,1,'����')    
 �Ƶ�(4,2,'�Ƶ�')          ���̵���(5,3,'����')
����(6,4,'����')
������ sql ����
select ....�÷�
from ���̺��
where ����
start with ����(�񱳿����� ex)�÷�=������  : 
                              ����sql�� �������� ó��-�ֻ��� ������ ����ó��.
                  ex) ���������� �ֻ��� ������ parentId=0
				    �츮������ ���� ������ ó���ϰ��� �� ��,
					 parentId=2(�ƹ��� �������ķ� ��Ÿ��)
connect by [nocycle]  ���� and ����
    �������踦 ��������ִ� ���ǿ� ���� ����. nocycle :�ݺ����ο� ���� ó��.
	ex) connect by id = parentId  
	  ���� id���� Ȯ���ؼ� ������ �ִ� id���� �ִ��� ���������Ϳ� Ȯ���ؼ�
	  ���������� ��Ÿ���� �ϴ� ���� ���Ѵ�. prior:���� - ������ ���迡 ����
	                                       ó���ϰ� �� 					 
	ex) emp ���̺��� �������� ���������� ���� ó���ϰ��� �Ѵ�.
order siblings by �÷� [asc/desc]
 �ش� �������� �÷��� ���� ���� ������ ���� ������ �����Ѵ�.
 �ֱٿ� ��ϵ� ������ ���� list�ϴ���? ���� ��ϵ� ������ ���� list�ϴ���?
 level�� ����, �θ� ���� �����͵鿡 ���� list �켱 ������ ����.  	

## column �ɼ�  :level -�ش� ������ �����ܰ��� ǥ��
	ex) �ֻ��� �����ʹ� 1, �������� 2...	
	
*/
select * from emp;
-- mgr(������ ��ȣ)�ε�, empno�� ���εǾ� ����..
select level, empno, lpad(' ', 4*(level)) || job job, mgr
from emp
start with mgr is null --�ֻ������ ������ mgr�� null�� ��
connect by prior empno = mgr;
-- �ֻ��÷��� ���� �÷��� ����ó��.
/*  
���������� mgr�� null�� �� ���� �����Ͽ�, ���������� empno�� mgr�� �ִ���
���θ� Ȯ���Ͽ�, �ش��ϴ� mgr�� �����Ͱ� empno�� ���� �� ����
�ϴ� �ϳ��� node��ü�� �������Ѵ�.
�������Ƿ� ������ ó��... lpad('���ʿ� �Է��� ����', �ݺ��� Ƚ��)
 �������� �������� ǥ�õ� �� �ְԲ� ó��..
 ' ' :������ 4ĭ��  lpad(' ', 4*(level)) || job
*/
-- ex) Ȯ�ο��� family�� ���������� ����ϼ���.
-- ������� :  level  role(������������ó��), �̸�
select level, lpad(' ',4*(level-1)) || role01 role, name 
from family
start with parentnumid=0
connect by prior numid=parentnumid
order siblings by numid asc;
-- role01==> numid
select * from family;
insert into family values(5,1,'ū�ƹ���','ȫ����');
insert into family values(6,0,'�����Ҿƹ���','ȫ���');
/*
board ������ �Խ��� ���̺� ���� list�ϱ�..
	����id(�۹�ȣ), Ÿ��Ʋ, ����, �������, ��������, �ۼ���, ��ȸ��
	no,    parentno, title,        content,       credte,uptdte, writer,    readcnt
	number,number, varchar2(50), varchar2(1000), date, date, varchar2(50), number
*/
create table board(
	no number primary key,
	parentno number,
	title varchar2(50),
	content varchar2(1000),
	credte date,
	uptdte date,
	writer varchar2(50)
);
select * from board;
-- 1, 0, '�۵�Ͻ���','�ù�',sysdate,sysdate,'�۰�01'
insert into board values(1, 0, '�۵�Ͻ���','�ù�',sysdate,sysdate,'�۰�01');
insert into board values(2, 0, '2��°�׿�!�̷�!','�ù�',sysdate,sysdate,'�۰�02');
-- ù��° �ۿ� ���� ��۷� ó��..
insert into board values(3, 1, '1��°�� ���ƽ��ϴ�.','�ù�',sysdate,sysdate,'ȫ����');
insert into board values(4, 3, '���� ����� �����׿�','�ù�',sysdate,sysdate,'�۰�01');
insert into board values(5, 1, '���� �� ��Ź�մϴ�!','�ù�',sysdate,sysdate,'�۰�03');
-- �۹�ȣ, Ÿ��Ʋ, �����(YYYY/MM/DD), �����
select rownum , no, lpad(' ',4*(level-1)) || title title, 
       to_char(credte,'YYYY/MM/DD') credte, writer
from board
start with parentno=0  -- �ֻ��� ���� ���� ó��
connect by prior no = parentno -- ���� ���� ���� ����
order siblings by no desc;
-- �ֱٿ� ��ϵ� ���� �ֻ����� ó��
select * from board;
insert into board values(7, 1, 'ù��°�� ����~~',
		'�ù�',sysdate,sysdate,'���̸�');
select rownum, a.*
from emp a
order by empno desc;
-- rownum : ������ list���� ������ numbering�� �ٴ� Ű����..




/*	17. a12_dml_adv */
/*
�������� ��� DML query!!
1. ���� ���̺� ������ �Է��ϱ�..
	insert ������ ������ �Ἥ �����͸� �Է��ϴ� ��찡 ���� �����͸� �Է�
	�� �� ���ŷ��� ��찡 �ִ�.
	�ѹ��� suberquery�� ���ؼ� ���� ������ ������ ���̺� �Է��� ��,
	insert all ������ Ȱ���ϸ� �ս��� ó���� �� �ִ�.
	1) ����
	INSERT ALL
	INTO ���̺�1�� VALUES(�÷�1, �÷�2, �÷�3)
	INTO ���̺�2�� VALUES(�÷�1, �÷�2, �÷�4)
	SELECT �÷�1, �÷�2, �÷�3, �÷�4
	FROM ���̺��
	WHERE ����
	EX) EMP���̺��� �����������̺� ���� 
	    	EMP_HIR(EMPNO, ENAME, HIREDATE)
			EMP_MGR(EMPNO, ENAME, MGR)
		���� EMP���̺��� �μ���ȣ��20�� �����͸� �ش� ���̺�
		������ �Է�ó��..
		
*/
-- �����������̺� �����ϱ�..
	CREATE TABLE EMP_HIR
	AS
	SELECT EMPNO, ENAME, HIREDATE
	FROM EMP WHERE 1=0;
	SELECT * FROM EMP_HIR;
	CREATE TABLE EMP_MGR
	AS
	SELECT EMPNO, ENAME, MGR
	FROM EMP WHERE 1=0;
INSERT ALL
	INTO EMP_HIR VALUES(EMPNO,ENAME, HIREDATE)
	INTO EMP_MGR VALUES(EMPNO, ENAME, MGR)
	SELECT EMPNO, ENAME, HIREDATE, MGR
	FROM EMP
	WHERE DEPTNO=10;
/*
���� ������ �̿��� ������ �����ϱ�..
UPDATE ���̺��
SET (�������÷�1, �������÷�2) = (SELECT �÷�1,�÷�2 FROM ���̺�)
WHERE ����..
EX) 20�� �μ��� �������� 40�� �μ��� ���������� �����ϱ� ���ؼ� ��������
	�� Ȱ���غ���..
*/		
CREATE TABLE DEPT01
AS
SELECT * FROM DEPT;
-- �Է��� ������ LOADING(SUBQUERY)
SELECT DNAME, LOC
FROM DEPT
WHERE DEPTNO=40; 
-- MAIN QUERY
UPDATE DEPT01
SET (DNAME, LOC) =( SELECT DNAME, LOC
					FROM DEPT
					WHERE DEPTNO=40)
WHERE DEPTNO=20;
SELECT * FROM DEPT01;
SELECT * FROM EMP;
CREATE TABLE EMP11
AS
SELECT *
FROM EMP;

UPDATE EMP11
SET (SAL,DEPTNO)=(
	SELECT SAL,DEPTNO
	FROM EMP11
	WHERE JOB='PRESIDENT')
WHERE JOB='CLERK';
SELECT * FROM EMP11
WHERE JOB='CLERK';
/*
MERGE ó��..
 DATA MINGRATION(������ �̰�ó��) �Ҷ�, ���� Ȱ��ȴ�.
 ���̺�  A, ���̺� B �� �����͸� �̰�ó����, �μ��� �޶� �ԷµǾ� �ִ� �����͵� �ְ�,
 �űԷ� �Է��ؾߵ� �����͵� ������, �ԷµǾ� �ִ� �����ʹ� Ư�� �÷��� ����ó���ؾ�
 �� ��� ���� Ȱ��ȴ�.
���� ex) ���̺�A�� ������  ���̺�B���� ���� �����ʹ� insertó��
            ���̺�A�� �ְ�, ���̺�B�� ������ Ư���� �÷��� �����ϴ� ���� updateó��
		�ΰ��� ������ �ѹ��� ó���ϴ� ���� MERGE
	MERGE INTO ���������̺�  EX) ���̺�B
		USING ���������������̺�  ex) ���̺�A
		ON ����ó��-�Ϲ������� �� ���̺��� KEY��(�����÷�)�� �������� ó���Ѵ�.
		                       ex) ���̺�A.�÷�01=���̺�B.�÷�01
		WHEN MATCHED THEN -- �ΰ��� ���̺� KEY�����Ͱ� �������� ���� ��.
		    �������� ����ó��         ex) ���̺�A�� �÷�01�� ���̺�B�� �÷�01��
			update set 		�ش� �����Ͱ� ������ ���..
			���������̺�.�������÷�=���������������̺�.�÷�	
			              ex) ���̺�B.�����÷� = ���̺�A.�÷�														
		WHEN NOT MATCHED THEN -- ���� ���̺� ������ ���� ���
								EX) ���̺�A���� ������, ���̺� B���� ���� ���
			�Է°���ó��..					
		    insert [���̺�X] values(���������������̺�.�÷�...)
								EX) INSERT VALUES(���̺�B.�÷���....);
*/
/*
EMP01, EMP02 �����͸� �ε��ؼ�..EMP01�� ������ ����ó��..
1. EMP01 �������̺� �����.
2. EMP02 �������̺� �����  EMP�� JOB='MANAGER'��... 
   EMP02 JOB ==> 'test'�� UPDATE (##empno�� ����, job�� �ٸ� ������)
   EMP02 �Է� 7935 'ȫ�浿', 'SUPERMAN' 7839 SYSDATE 4000 100 40 
   	(## empno�� EMP01�� ���� ������)
*/
select * from emp order by empno desc;
DROP TABLE EMP01;
CREATE TABLE EMP01
AS
	SELECT * FROM EMP; -- EMP01 �������̺� ����
SELECT * FROM EMP01; -- �� ���̺� ���� ó��..
DROP TABLE EMP02;
CREATE TABLE EMP02
AS
	SELECT * FROM EMP
	WHERE JOB='MANAGER';
SELECT * FROM EMP02;
UPDATE EMP02
SET JOB='TEST'; -- EMP02�� JOB�� 'TEST'�� ����
-- EMP02 �Է� 7935 'ȫ�浿', 'SUPERMAN' 7839 SYSDATE 4000 100 40 
INSERT INTO EMP02 VALUES(7935,'ȫ�浿','SUPERMAN',7839,SYSDATE, 4000,100,40);
SELECT * FROM EMP01;
SELECT * FROM EMP02;
MERGE INTO EMP01  -- ���� �����ʹ� EMP01�� ó��
	 USING EMP02   -- EMP02�����͸� �����..
	 ON (EMP01.EMPNO = EMP02.EMPNO) -- �ش� KEY���� EMPNO�� �ִ��� ���ο� ���� UPDATE/INSERT                   
WHEN MATCHED THEN -- EMPNO���� ���� ��..
	UPDATE SET
	  EMP01.JOB = EMP02.JOB  -- EMP02.JOB ������ ��, 'test'�����͸� EMP01.JOB�� UPDATE
WHEN NOT MATCHED THEN --������ EMPNO���� EMP01�� ���� ���,
	INSERT VALUES(EMP02.EMPNO, EMP02.ENAME, EMP02.JOB, EMP02.MGR, EMP02.HIREDATE,
	              EMP02.SAL, EMP02.COMM,EMP02.DEPTNO); 
SELECT * FROM EMP01 ORDER BY EMPNO;				  	  
/*
Ȯ�ο���. 
EMP�� �������̺� EMP03
EMP���� �μ���ȣ(DEPTNO)�� 30�� �����͸� EMP04�� �������̺� �����
	EMP04�� HIREDATE�� ���ó�(SYSDATE)�� UPDATE ó��..
EMP04�� 7370 '������' 'SUPERMAN' 7839 SYSDATE 6000 400 40 ������ �Է�
�� ���̺� ����ó��..
*/
DROP TABLE EMP03;
CREATE TABLE EMP03
AS
	SELECT * FROM EMP;
DROP TABLE EMP04;
CREATE TABLE EMP04
AS 
	SELECT * FROM EMP
	WHERE DEPTNO=30;
UPDATE EMP04
SET HIREDATE=SYSDATE;
INSERT INTO EMP04 VALUES(7370,'������','SUPERMAN',7839,SYSDATE,6000,400,40);
MERGE INTO EMP03
 USING EMP04
 ON	(EMP03.EMPNO=EMP04.EMPNO)
WHEN MATCHED THEN
	UPDATE SET
		EMP03.HIREDATE=EMP04.HIREDATE
WHEN NOT MATCHED THEN
	INSERT VALUES(EMP04.EMPNO, EMP04.ENAME, EMP04.JOB, EMP04.MGR, EMP04.HIREDATE,
				  EMP04.SAL, EMP04.COMM, EMP04.DEPTNO);
SELECT * FROM EMP03;
SELECT * FROM EMP;				  
	



/*	13. a13_constraintsExp	*/

select * from a01_not_nullExp;




/*	14.a14_constraintsExp */
select * from a01_not_nullExp;
select * from a02_nullExp;
-- ������ null �� �Է�. ���������� �ֱ⿡ �����߻�..
insert into a01_not_nullExp(job) values('���α׷���1');
-- ����� null �� �Է�..
-- ���̺��(�÷����X) ==> ��ü �÷��� ���� �Է��� ó���ϰڴ�
-- values(��ü�÷��� �� �����͸� ���)
insert into a02_nullExp values(null, 'ȫ�浿','���α׷���3');
select * from a02_nullExp;
insert into a01_not_nullExp values(null, '�ű浿','���α׷���3');
-- ��������� null���� ȣ���ϴ��� ���������� �ϳ��� ������ �Է���
-- ���� �ʴ´�.
/*
������ ��Ǿ(data dictionary)�� ���� constraints Ȯ���ϱ�..
user_constraints : ��ü ���̺� ���� �������� ���� Ȯ���ϱ�..
constraint_type
 ���������� ������ ���� ������ �����ϴ� �κ�.
 P : PRIMARY KEY : ## - �������ǿ� NOT NULL, UNIQUE�� �����Ѵ�.
 						���� �������̺��� KEY�� �����ϴ� �÷�����.
 R : FOREIGN KEY(�ܷ�Ű) : �ش� �÷��� �����ʹ� ������ �ٸ� ���̺�
 						�����Ͱ� �ݵ�� �־�� ó���Ǵ� ���
						EX) dept�� deptno�� ���, �μ���ȣ�� ���� ����
						�μ����� key deptno�� ��ϵǾ� �־����..
						emp���̺��� deptno�� ������ �Է��� �� �ְԲ� 
						ó���ؾ� ���Ἲ�� ��ų �� �ִ�.
 U : UNIQUE (����Ű����) : �ش� �÷��� �����Ͱ� �ٸ� �÷��� �����Ϳ� ��
 						�ؼ� �ݵ�� �ϳ��� ������ �����Ͱ� �ǰ� �� ��
						�����ϴ�  �ɼ�.												
 						EX) DEPT���̺� DEPTNO�� �ٸ� �����Ϳ� ���ؼ�
						���� DEPTNO�� �ٸ� DNAME(�μ��̸�)�� �Էµǰ�
						�Ǹ� ������ ���Ἲ�� ������ �߻��ϱ⿡ �̸� �Է�
						��� ������ ������ �߻����� ���Ἲ�� Ȯ���ϱ� ��
						�ؼ� ó���Ѵ�.
						20 ȸ�谨��  
						20 �ѹ�      ==> ���Ἲ�� ������ �߻���Ŵ.
 C : CHECK              Ư���� �÷��� Ư���� �����͸� ������ ó���ϴ�
 						���� ������ ���Ѵ�. 
						EX) EMP�� �÷����� GENDER(����)�� �������� ��,
						F(����), M(����)�� ������ �Ͽ�, ������ ��ü
						�� ���� ������ �����Ͽ� ���Ἲ Ȯ���� �ϱ� ����
						�������� ���ȴ�.					
*/
select * from user_constraints;
/*
UNIQUE : ����Ű ���� ó��..
1. �������̺����( EMP03)
2. �÷��� ����Ű �����ϱ�(UNIQUE)
3. ������ �Է� TEST - �����͸� ������ ��, � ������ �߻��ϴ��� Ȯ��.
4. ������ ��ǳʸ����� �ش� ������� Ȯ���ϱ�..
*/
SELECT * FROM EMP03;
DROP TABLE EMP03;
CREATE TABLE EMP03(
	EMPNO NUMBER UNIQUE, -- EMPNO�� �ߺ��� ���� �ʰ� ������������ ����
	ENAME VARCHAR2(30),
	JOB VARCHAR2(30)
);
SELECT * FROM EMP03;
INSERT INTO EMP03 VALUES(1000,'ALLEN','SALESMAN');
INSERT INTO EMP03 VALUES(1001,'JONES','MANAGER');
-- ������ �� 1000�� �÷����� ������ UNIQUE�� �����߱⿡ ������ �߻��Ѵ�.
INSERT INTO EMP03 VALUES(1000,'HIMAN', 'SUPERMAN');
-- DATA DICTIONARY�� ���ؼ� ��������� Ȯ���� �� �ִ�.
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP03';
/*
Ȯ�ο��� - ���̺� ������ DROP�ϰ�, ���� ����ó��.
STUDENT��� �л����̺� �÷�����  �й�, �̸�, �а��� ������ �Ŀ�,
������������ �й��� UNIQUE�� �����ؼ� �����ϼ���.
������ �Է����� �ش� ������ ó���Ǵ��� Ȯ��
������ ��ǳʸ��� ���ؼ� ���������� ��ϵǾ� �ִ��� Ȯ��..
*/
DROP TABLE STUDENT; 
CREATE TABLE STUDENT(
	STNUMBER VARCHAR2(10) UNIQUE,
	NAME VARCHAR2(50),
	MAJOR VARCHAR2(100)
);
INSERT INTO STUDENT VALUES('C070801','ȫ����','��ǻ�Ͱ���');
INSERT INTO STUDENT VALUES('C070802','������','�濵����');
INSERT INTO STUDENT VALUES('C070801','������','��Ƽ�̵��');
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='STUDENT';
/*
���� ���Ǹ��� ����� �����ϱ�..
1. ���̺� ������, ����
	����
	create table ���̺��
		�������Ǽ������÷� ������type ex) empno number
		constraint �������Ǹ�(���̺��_�÷���_���������������) ��������
							ex) constraint emp_empno_pk primary key,

*/
create table emp05(
	empno number constraint emp_empno_pk primary key,
	ename varchar2(20)
);
select * 
from user_constraints
where table_name='EMP05';

/*
Ȯ�ο���..
   PROFESSOR ���̺��� �����ϵ�
	PROID, NAME ==> �Ѵ� CONSTRAINT�� �����ϴµ�,
			NOT NULL, UNIQUE�� �̸��� �����ؼ� �����ϼ���.
	MAJOR
   user_constraints���� ������ ���������̸� �˻��ؼ� Ȯ��.
*/

create table PROFESSOR(
	PROID VARCHAR2(10) CONSTRAINT PROFESSOR_PROID_NN NOT NULL,
	NAME VARCHAR2(30) CONSTRAINT PROFESSOR_NAME_UQ UNIQUE,
	MAJOR VARCHAR2(20) 
);
select * 
from user_constraints
where table_name='PROFESSOR';
/*
�ϳ��� �÷��� �ƴ϶�, �ΰ��� �̻��� �÷����� ���������� �����ϴ� ���..
EX) �л����̺��� KEY�� �÷��� �űԷ� �����ϴ� ���� �ƴ϶�.
	GRADE(�г�) PART(��) NO(��ȣ)  �̸�..
����
	CREATE TABLE ���̺��(
		�÷���1 ������TYPE,
		�÷���2 ������TYPE,
		�÷���3  ������TYPE,
		CONSTRAINT �������Ǹ�(���̺�_�÷�����_�������) ��������(�÷�1, �÷�2..)
	);	
	�Ѳ����� ������ �÷����� ���������� ó�������� �ش� ���뿡 ���� KEY �÷��� �ű��ۼ��� �ʿ䰡 
	���� ��, Ȱ��ȴ�. �� �� �������� �ش� ���뿡 �Ѳ����� ó������ ������ ������ �߻�..
EX) �л����̺��� KEY�� �÷��� �űԷ� �����ϴ� ���� �ƴ϶�.
	GRADE(�г�) PART(��) NO(��ȣ)  �̸�..
*/
DROP TABLE HIGHSCHOOL;
CREATE TABLE HIGHSCHOOL(
	GRADE NUMBER,
	PART NUMBER,
	NO NUMBER,
	NAME VARCHAR2(30),
	CONSTRAINT HIGHSCHOOL_DIST_PK PRIMARY KEY(GRADE, PART, NO)
	-- HIGHSCHOOL���̺� PRIMARY KEY�� 3���� �÷����� ��µ�, GRADE, PART, NO
	-- GRADE, PART, NO�� ���ÿ� ���տ��� ������ �����Ͱ� �� ������ ó��..
);
INSERT INTO HIGHSCHOOL VALUES(1,1,2,'��浿');
INSERT INTO HIGHSCHOOL VALUES(1,1,3,'�ű浿');
SELECT * FROM HIGHSCHOOL;
select * 
from user_constraints
where table_name='HIGHSCHOOL';

CREATE TABLE ADDRESS(
	STATE VARCHAR2(50),
	CITY VARCHAR2(50),
	AREA VARCHAR2(50),
	ADNUMBER NUMBER,
	HOST VARCHAR2(50),
	RISDNUMBER NUMBER,
	CONSTRAINT ADDRESS_COM_PK 
		PRIMARY KEY(STATE, CITY,AREA,ADNUMBER)
);
INSERT INTO ADDRESS VALUES('����Ư����','������','��ġ��',253,'��浿',4);
SELECT * FROM ADDRESS;
/*2. ���������� ���� �����Ͽ� �����ϴ� ���..
	1) ���̺� ����
	2) ALTER TABLE ���̺��
	      ADD CONSTRAINT �������Ǹ� ������������(�÷���)
		  MODIFY �÷��� CONSTRAINT �������Ǹ� ������������
		  DROP �������Ǹ�*/
		  

/* 15. a15_constraintsExp */
���� ���� �߰��ϱ�
ALTER TABLE ���̺��
ADD CONSTRAINT ���̺��_�÷���_�������Ǵ��� ������������(�÷���);
EX) �������� NOT NULL(x), UNIQUE(O)
*/
/* �������� �߰�, ����, ���� ����.
1. address ���̺�  host�÷���  UNIQUE ���������� �߰�..
2. ������ ��Ǿ���� Ȯ��.
3. host�÷��� ���������� ����..
4. address ���̺� host�÷��� NOT NULL ������������ ����.
5. ������ ��Ǿ���� Ȯ��
*/
-- 1. �߰�
ALTER TABLE address
add constraint address_host_uq unique(host);
-- 2. Ȯ��
select * from user_constraints
where table_name='ADDRESS';
-- 3. ����..
/*
ALTER TABLE ���̺��
DROP CONSTRAINT ��ϵ��������Ǹ�
*/
ALTER TABLE address
drop constraint address_host_uq; 
-- address ���̺��� �������� address_host_uq ����
-- 4. ����(modify)
-- ������ ������ ���� add�� modify�� ���� ��찡 �ִ�..
-- not null�� ��쿡�� add�� ���������� ����� �� ����.
-- �� ��쿡�� modify�� Ȱ���Ͽ��� �Ѵ�.
/* ����
	 ALTER TABLE ���̺��
	 MODIFY �÷��� CONSTRAINT �������Ǹ�  ������������(EX-NOT NULL)
*/
	ALTER TABLE address
	MODIFY host constraint address_host_nn NOT NULL;
-- 	host��� �÷��� ���������� address_host_nn�� �ϰ�, �̴� not null
--  ������������ ���� ó���Ѵ�.
	select * from user_constraints
	where table_name='ADDRESS';
/*  Ȯ�ο���
	1. EMP���̺��� ���� ���̺� EMP07�� �����,
	2. ENAME�÷��� UNIQUE ���������� ������ ��,
	3. �� ���������� �����ϰ�,
	4. ENAME�÷��� ���������� NOT NULL�� �����ϼ���..
*/	
CREATE TABLE emp07
as select * from emp;

alter table EMP07
add constraint emp07_ename_uq unique(ename);
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP07';
ALTER TABLE EMP07
DROP CONSTRAINT emp07_ename_uq;



ALTER TABLE EMP07
MODIFY ename CONSTRAINT emp07_ename_nn not null;

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP07';

/*
�������� Ȱ�� �� ��Ȱ��ȭ ó��..
: ���������� �ӽ������� ��Ȱ��ȭ ������ �����͸� test�ϰų�,
Ư���� �Ⱓ�� ���������� ���� �ʴ� ������ �Է��ϴ� �ϰ� ó���ϴ�
���� ���Ѵ�.
����
alter table ���̺��
enable/disable CONSTRAINT �������Ǹ�; 

ALTER TABLE EMP07
MODIFY ename CONSTRAINT emp07_ename_nn not null;
*/
ALTER TABLE EMP07
ENABLE CONSTRAINT emp07_ename_nn;





select * from address;







	









