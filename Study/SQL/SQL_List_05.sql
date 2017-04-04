/*	16. a16_sequence */

/*
sequence
����Ŭ���� �ߺ��� ���� ���� �ʱ� ���� �⺻ Ű(primary key)�� 
���̺� �ϳ��� �÷��� �����Ѵ�.
�� �÷��� �ߺ����� �ʴ� ���� �ֱ� ���ؼ� ����Ŭ������ sequence
��� ��ü�� �����ϰ� �ִ�. 
�������� ���̺� ���� ������ ���ڸ� �ڵ����� �����Ͽ� �ڵ�����
��ȣ�� �Է��� �� �ְ� �ϱ⿡ ������� ����Ű ������ ���� �δ���
�ٿ� �ش�.
ex) �л� ���̺� ��ȣ�� �Է��Ѵ�.
	no �̸� ....
	no �÷��� 1, 2, 3, 4, 5..  ���� �ڵ����� �Է��� �ؾ��� ��.
	��� ���̺� ��ȣ�� �Է��Ѵ�.
	empno ename
	1000 ���� ���� 1001, 1002, 1003, 1004 .... 	
	�й��Է�..
	studId  name..
	C020001   ���ۿ� C020002, C020003.....
	[�ܰ��ڵ�][SEQUENCE] : �ռ���ȣ..
EX) �Է½�, �ڵ����� NUMBERING ó��..	
	INSERT INTO ���̺�  VALUES( SEQUENCE��.NEXTVAL, ....)
	INSERT INTO ���̺�  VALUES( 'C0'||SEQUENCE��.NEXTVAL, ....)
					--> ���ڿ� ���յ� sequence ó��..

����]	
CREATE SEQUENCE ��������
   	START WITH N  --> �����ϴ� ��ȣ�� ����..EX) 1, 1001, 20001
	INCREMENT BY N  --> ���� ����..EX) 1, 2(2 STEP������ ����)
	                                 -1(1 STEP������ ����)
	MAXVALUE N  --> �������� ��, �ְ� ���� EX) 999999
							1 ~ 999999 ���� �����͸�  NUMBERING
							ó���Ѵ�.									  	
������ �Է��̳� Ȱ���.
	��������.NEXTVAL : �������� ������Ű�� ���簪�� ���..
	��������.CRURRVAL : �������� ���簪�� ���.

EX) ## ���۰��� 1�̰� 1�� �����ϰ�, �ִ밪�� 99999�� ������ 
	EXP01_SEQ�� ����� ����..

*/
CREATE SEQUENCE EXP01_SEQ
		START WITH 1
		INCREMENT BY 1
		MAXVALUE 99999;
SELECT EXP01_SEQ.NEXTVAL FROM DUAL; -- ���� ��ȣ�� 1�� ���� �� NUMBERRING
-- ���� ������ ������ NUMBER ....
SELECT EXP01_SEQ.CURRVAL FROM DUAL; -- ���� ��ȣ ȣ��.
-- EX) �л����̺�(STUDENT_SEQ_EXP)�� 
--     no �̸� 
create table student_seq_exp(
	no number primary key,
	name varchar2(50)
);
-- ���̺� seqence�� Ȱ���Ͽ� �����͸� �Է��Ѵ�.
CREATE SEQUENCE student_SEQ
		START WITH 1
		INCREMENT BY 1
		MAXVALUE 99999;
insert into student_seq_exp values(	student_SEQ.nextval, '�̸��Է�');
select * from student_seq_exp;
/* Ȯ�ο���
	1) emp_seq_exp ���̺� ������(empno ename)
	emp_seq10 ������ ����,
		1000 ���� ���� 1001, 1002, 1003, 1004 .... 	
	�Է�ó��..
	2) college ���̺� ����(studid, name)
	college_seq ������ ����.
		20001, 20002
	�й��Է�..
	studId  name..
	C020001   ���ۿ� C020002, C020003.....
	[�ܰ��ڵ�][SEQUENCE] : �ռ���ȣ..
*/

create sequence emp_seq10
	start with 1000
	increment by 1
	maxvalue 9999;
create table emp_seq_exp(
	empno number primary key,
	ename varchar2(50)
);	  


/*	17. a17_user */
/*
## ����� �������� ���� ���..
command â���� �����ϴ� ���..
sqlplus system/1111  �Ǵ� sqlplus scott/tiger
sqlplus ���ο��� 
sql>conn ������/��й�ȣ

## �������� client ���� �̿��ؼ� ���� �ֿ� �ٽ� ����..

IP/port��ȣ/ sid/ ����/��й�ȣ

*/
/*
## ����� �����ϱ�..(system������ worksheet���� ó��)
create user ����ڸ�
identified by �н�����;
ex) scott01�̶� ������ ��й�ȣ�� tiger�� �����Ͽ�
	���� �ϰڽ��ϴ�.
*/
create user c##scott01 identified by tiger;
/*
���� �ο�
1. session : ���� ���õ� ���� �ο�..
����
grant ��������
to ����ڰ���
 ������ ������ ������ �ش� ������ �����ؼ� ����� �� �ִ�
 ���� �ƴ϶�, ���� ������ �����ؾ��� ������ �ȴ�..
 ex) scott01 ������ ���ӱ��Ѹ� ������ �� �ڿ� ������ �غ���.
 system ������ �������� ������ ��..
 grant create session
 to scott01;   -- ������ session������ scott01���� �ش�.

*/
grant create session
to c##scott01;
/*
���̺� �����̽�
�����ͺ��̽� ������, ���� ������Ʈ(���̺�, �ε���, ���)��
���� ������ ���Ͽ� ����Ǵ� ������ �����̰�, 
����ڿ� �����ؼ� ���̺� �����̽� �� ������ ���� ������ ������ 
�� �ִ�..
1. ���� ����..
	## create tablespace ���̺����̽���
		datafile '������������ �ִ� ��ġ' size ũ�⼳��(ex 10M
		default storage( -- ������ ũ�⿡ ���� �ʱ� �� 
									block���� �� ���� ũ��.
		   initial ũ��   : �ʱ��� ũ�⼳��.
		   next  ũ�� : ������ ũ�⼳��
		   maxextends : �ִ� ������ ũ�� : ������ extends�� �ִ� ��..
		   pctincrease : extents�� ������, defult���� 50..
		)
	ex) ���̺� �����̽� �̸� ts01�� �ϰ�..
		C:\a01_prog\database\ ���� ����.
		���ϸ� : DF001.DBF01
		ũ��� 50M
		initial : 1024k
		next : 512k
		�ִ� ���� ũ�� maxextents : 128
		pctincrease  :0 
*/
create tablespace ts01
		datafile 'C:\a01_prog\database\DF001.DBF01' size 50M
		default storage(
			initial 1024k
			next 512k
			maxextents 128
			pctincrease 0
		);
/*
Ư���� ���̺� ������, ������ ���̺����̽��� ����..
create table ���̺��̸�(

) tablespace ���������̺����̽���;

default ���̺� �����̽� ����..
alter database default tablespace ���������̺����̽���;

*/		




/*	18. a18_role */
/*
role�̶�?
����ڿ��� ���� ȿ�������� ������ �ο��� �� �ֵ��� ���� ���� ������ ���� ���� ���� ���Ѵ�. ����ڸ� �����ϸ� �ٷ� ����� �� �ִ°��� �ƴ϶�, ���� ������ �ο��ؾ� �ϴµ� role�� ���ؼ� �� ����
�پ��� ������ �ѹ��� �ο� �� �� �ִ�..

���� ����
1. connect ��
�ַ� ����ڰ� �����ͺ��̽��� ������ �� �ֵ��� �ϴ� �⺻���� 
�����ͺ��̽��� �����̶�� �� �� �ִ�.
ex) ALTER SESSION, CREATE CLUSTER, CREATE DATABASE LINK,
CREATE SEQUENCE, CREATE SESSION, CREATE SYNONYM, 
CREATE TABLE, CREATE VIEW
2. resource ��
����ڰ� ��ü(���̺�, ��, �ε� ��)�� ������ �� �ֵ��� ������ ����
���� ���Ѵ�.
create cluster, create procedure, create equence, 
create table, create trigger
3. dba ��
����ڰ� �����ͺ��̽� ��ü�� �����ϰ� ����ڵ��� �ۼ��ϰ� ��������
�� �� �ִ� ������ ������ ���� ���Ѵ�.

���� Ȱ�� ����
1. ���� ����(�����ͺ��̽� ������)
	����) create role ���� �̸�..
	ex) create role roleexp01;
2. �ѿ� ���� �ο�
	����) grant ����1, ����2, ����3 to ���� �̸�
	ex) grant create session, create table, create view 
	    to  roleexp01;
3. ##����ڿ� ���� �ο�.
	����) grant ���̸�  to �����
	ex) grant roleexp01 to scott01;
	
*/








