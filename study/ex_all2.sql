
select ltrim('    this is your best day!!!') showData, 
 	length('    this is your best day!!!') beforeLen,
	length(ltrim('    this is your best day!!!')) afterLen
 from dual;
--  �����ʿ� ���鹮�ڿ��� �����ϴ� ó��
select rtrim('what we dwell on is who we become!   ') showdata,
       length('what we dwell on is who we become!   ') beforeLen,
	   length(rtrim('what we dwell on is who we become!   ')) afterLen
from dual;
select * from emp;
/*
TRIM
	������, ���ʿ� �ִ� ������ ����ؼ� Ư�� ���ڿ��� ���� ó���ϴ� �Լ�.
	TRIM('�����ҹ��ڿ�' FROM ������)
	ex) 'aaaaaaaGood morning!!aaaaaaaa'���� �����ʰ� ���ʿ� a���ڿ��� ����ó��
*/
select trim('a' from 'aaaaaaaGood morning!!aaaaaaaa' ) showdata from dual;
select * from emp;
-- Ȯ�ο��� job�� 'N'�̳� 'R' 'T'�� ������ ������ �������� ������ ���� ����ϼ���.
-- �̸�  ��å
SELECT ename, job, 
      trim('T' from trim('R' from trim('N' FROM job))) chjob
from emp;
select * from emp;
/*
��¥ �Լ�..
sysdate : ����Ŭ ����� ���� ��¥�� �ð��� ����ϴ� ��ü..
*/
select sysdate from dual;
select sysdate+1 from dual;
select sysdate-1 from dual;
select sysdate today, sysdate-1 yesterday, sysdate+1 tomorrow from dual;
select ename, hiredate, sysdate, floor(sysdate - hiredate) from emp;
/*
months_between : �ΰ��� ��¥ ������ ������ ���� ���� ���ϴ� ����..
	months_between(�񱳳�¥������1, �񱳳�¥������2)
ex) �� �������� �ٹ��� ���� ���� ���ϼ���..
*/
select ename, hiredate, trunc(months_between(sysdate, hiredate)) workingMonth
from emp;
select * from emp;
/*
add_months : �̷������� ��Ÿ���� �Լ��� ���� ���� ���ؼ� �ش糯¥�� ��Ÿ���� �Ѵ�.
	add_months(���ص�����, ���İ����� )
 ex) �Ի� ��¥���� 6������ �߰��� ��¥�� ����ϼ���.	
*/
select ename, hiredate, add_months(hiredate,6) after6Months from emp;
select * from emp;
/*
����1)
6������ ���ϱⰣ���� �޿��� 70%�� �����ϱ�� �ߴ�.
����� ���ϱⰣ��������� ����ϰ�, 6�������� �޿��� ������ ����ϼ���..
���޿� - sal/13 
���ϱⰣ - ���޿��� 70%
���ϱⰣ���޿��Ѿ� - ���ϱⰣ6������ �޿� �Ѿ��� 10���� �����ؼ� ���
�����ȣ  ����� �Ի���  ���ϱⰣ�������  ���ϱⰣ���޿��Ѿ�(10��������)
*/
/*
next_day : �ְ������� ���� ����� ��¥�� ������ ��, Ȱ��..
   next_day(��¥������, '����') : �ش� ���Ͽ� ���� ����� ��¥ ���..
*/
select sysdate, next_day(sysdate, '������') from dual;
/*
Ȯ�ο���) ������� �Ի���, ù��° ������� ����ϼ���..
*/
select ename, hiredate, next_day(hiredate,'�����') firstHoliday from emp;
select * from emp;
/*
last_day �Լ�
	�ش� ���� ������ ��¥�� ��ȯó��.
*/
select last_day(sysdate) thisLastDate, 
	last_day(sysdate)+1 nextFirstDate from dual;
-- ������ ù��
--
select * from emp;
-- �޿� ���.. 3�ܰ� �޿����� ����� ����ϼ���.
-- 1�ܰ� ��� 20��
-- 2�ܰ� ��� ��������
-- 3�ܰ� ������ 10��
-- ��� �Ի��� ù����1 ù����2 ù����3
select ename, hiredate, 
	last_day(hiredate) grade02
	 from emp;
/*
����ȯ �Լ�
����Ŭ���� �����Ͱ� ����ȯ�� �ؼ�, �ʿ��� �����̳� type���� ��Ÿ���� �Ѵ�.
�� ��, Ȱ���ϴ� ���� ����ȯ �Լ��̴�.
to_char() : ��¥�� �������� ���������� ��ȯ
to_date() : �������� ��¥������ ��ȯ
to_number() : �������� ���������� ��ȯ

to_char()
1) ��¥���� ���������� ��ȯ�ϱ�.
	to_char(��¥������, 'ǥ���� ��������' )
	��¥ǥ���ϴ� ���� ������ ����
	YYYY : �⵵ ǥ��, YY :�⵵ 2�ڸ�ǥ��
	MM : �� ǥ��, MON:�� �������� ǥ�� ex)JAN
	DAY : ���� ǥ��, DY:���� ���ǥ��.
	DD : ��¥ ǥ��
	
ex) �Ի����� �⵵-��-��  �� ǥ���Ͻÿ�..
*/
select ename, to_char(hiredate, 'YYYY-MM-DD') hiredate1,
to_char(hiredate, 'YY/MM/DD') hiredate2,
to_char(hiredate, 'YYYY"��" MM"��" DD"��"') hiredate2
from emp;
select * from emp;
-- Ȯ�ο���
-- �Ʒ��������� ����ϼ���.
-- [����̸�]��  @@�� @@�� @@�Ͽ� �޿��� @@@ ���� �ޱ�� �ϰ� �Ի��߽��ϴ�.
select ename||'�� '||to_char(hiredate,'YY"��" MM"��" DD"��" DAY')
        ||'�� �޿��� '|| sal ||'���� �ޱ�� �ϰ� �Ի��߽��ϴ�.' show
from emp;
select * from emp;
/*
2) �ð�������� to_char(��¥������, '��¥�������  �ð��������')
	AM �Ǵ� PM  : �������� ǥ��
	AM. �Ǵ� PM. : ����. ����. ǥ��
	HH �Ǵ� HH12 : 12�ð� ǥ��(1~12)
	HH24 : 24�ð� ǥ��(0~23)
	MI :minutes ��ǥ��
	SS : seconds ��ǥ��
ex)	����ð��� ��¥�� �ð� ���Ŀ� ���� ǥ��
	YYYY/MM/DD  HH24:MI:SS
*/
select to_char(sysdate,'YYYY/MM/DD HH24:MI:SS') today from dual;
/*
����
	�ٹ��������� ���� ���� ���ʽ� ����
	���� ������ ����~���� �ֱٿ� �Ի��� ������
	1/3 = 30%, 1/3 = 20%, 1/3 = 10% (��������)
	���, �Ի���, ���糯¥(@@/@@/@@ AM @@�� @@�� @@ ��), �ٹ�������, ���ʽ�
25/3 ==>8.33  410~434 

*/
select 25/3 from emp;
select ename, hiredate, 
	to_char(sysdate,'YY/MM/DD AM HH24"��" MM"��" SS"��"') today,
 floor(months_between(sysdate,hiredate )) workMonth,
  floor(months_between(sysdate,hiredate ))-410 bonusKey,
  (floor((floor(months_between(sysdate,hiredate ))-410)/8.33)+1)*10||'%' bonusKey2,
  round(sal*((floor((floor(months_between(sysdate,hiredate ))-410)/8.33)+1)/100)) bonus
 from emp;
select * from emp;
/*
�������� ������ ó��..
to_char(������, '����')
�������
0 : �ڸ����� ���� ���� ���, ������ �ڸ����� ���� �������� �ڸ��� ���� ū���
    �� 0���� ä������.
9 : �ڸ��� ��� ���� �ش� ������ ��Ÿ��. ä������ �ʴ´�.
L : ������ ���ݴ��� ǥ��
. : �Ҽ��� ǥ��
, : õ���� ǥ��
*/
select to_char(1000,'000000') from dual;
-- �ش� �ڸ��� ���� Ŭ�� 0���� ä����.
select to_char(1000,'999999') from dual;
-- ä������ ó������ ����.
select to_char(1000,'999') from dual;
-- �ڸ����� ������ ##�� ǥ�õ�.
select to_char(24333, 'L999999') from dual;
-- ������ ǥ��
select to_char(23433, 'L999,999') from dual;
--õ����(,) ǥ��.
select to_char(24333.2422, '999,999.999') from dual;
--�Ҽ���(.) ǥ��
select * from emp;
-- Ȯ��) �̸��� �޿��� ǥ���ϵ�
--      �޿��� �Ҽ������ϴ� ǥ�õ��� �ʰ�, �ڸ����� 7�ڸ��� ǥ���ϵ� ��Ÿ���� �ʴ�
--      �ڸ��� '0'���� ǥ���Ͻð�
select ename, to_char(sal,'0000000') sal from emp;
/*
to_date(): ���� ==> ��¥.
 �Է��� ��¥���� ���ڸ� �Է��� ��, ��¥ �����͸� ��ȸ ó��..
 �˻��� �ҷ��� ���ڸ� ��¥�� ��ȯ�Ͽ� ó��..
 ���ڴ� ��¥���·� ��� �ν��ϴ°�?
 1980/12/12 --> to_date()���� � �������� �Է��� ������ ����.!!!
 to_date(�Էµ�����, '������ ����')
 ex) to_date('19811020', 'YYYYMMDD')
*/
-- select * from emp
-- where hiredate='12/17/1980'; (x)
select * from emp;
--ex)  �Ի����� 1980/12/17 �� �����͸� �˻�
select * from emp
where hiredate=to_date('1980/12/17','YYYY/MM/DD');
--
-- ���ڿ� ==> �Է����� ���� ==> to_date() ó��..
/*
Ȯ�ο���) �Է°��� '1981-02-20'�̸�, �� �����ͷ� �˻��Ǵ� �Ի��Ͽ� �ش��ϴ�
		�����  �Ի���(1981��02��20��) �� ����Ϸ��� �Ѵ�. 
*/
select ename, to_char(hiredate,'YYYY"��"MM"��"DD"��"') "�Ի���" 
from emp
where hiredate=to_date('1981-02-20','YYYY-MM-DD');
select * from emp;
/*
����
��ȸ���� '1981��01��01��' ���� '1982��12��12��' ������ ������ ��,
	�μ��� 30�� �����͸� ��ȸ�Ͽ�,
list���� 
	�����(10�ڸ�-�տ� #��ȣó��)
	��å(10�ڸ�-�������ڿ� '-'ó��)
	�Ի���(@@�� @@�� @@�� @���� 24�� @@�� @@�� )
	����( ####1,600.0 ǥ��)  �� ��Ÿ������..
*/
select lpad(ename,10,'#') "�����",
	   rpad(job,10,'-') "��å",
	   to_char(hiredate,'YY"��" MM"��" DD"��" DAY HH24"��" MI"��" SS"��"') "�Ի���",
	   lpad(ltrim(to_char(sal,'9,999.9')),12,'#') "����", deptno
from emp
where hiredate between 
		to_date('1981��01��01��','YYYY"��"MM"��"DD"��"') AND
		to_date('1982��12��12��','YYYY"��"MM"��"DD"��"')
	AND DEPTNO = 30;
/*
������ ���ڿ��� �ԷµǾ��� ��, ó���� to_number() �Լ�
�ԷµǴ� ���ڿ��� ������ ����, to_number�� ������ �Է� ó��..
to_number(�Է��� ������, '��������')
*/
-- select '20,000' - '30,000' from dual;
select to_number('20,000','99,999') -to_number('30,000','99,999') calcu 
from dual;
select * from emp;
-- Ȯ��)������ �˻��ҷ��� �Ѵ�.   '3,000'�̶�� �Է°��� ���� 3000������ ������
-- ���� ����� �̸��� ������ W(��) 3,000�� ����ϼ���
select ename, to_char(sal,'L99,999') money
from emp
where sal < to_number('3,000','9,999');
select * from emp;
/*
������ ���ʽ��� �ջ��� �ݾ���  �̸��� �Ѿ����� ǥ���ҷ��� �Ѵ�.
nvl : �ش� �����Ͱ� null�϶�, ǥ���� default �����͸� �����Ͽ�,
     ���� ���� ������ ���������� �����͸� ó���ϱ� ���� ���̴�.
	 ���� nvl(������,0)    ������ ���� 0
	 ���� nvl(������,' ')  ������ ���� ' '�������� ó��..
*/
select ename, sal, comm,  sal+nvl(comm,0) tot
from emp;
select * from emp;
-- ����
--  �̸�  �����ڹ�ȣ    ���ʽ�
-- ==> �����Ͱ� ���� ����  �����ڹ�ȣ��� '�ְ���',
--  ���ʽ��� '0'ǥ��
select ename, nvl(to_char(mgr),'�ְ���') mgr,
 nvl(comm,'0') comm from emp;


/* 5������ �� */

/*
DECODE () :���� ó���� ���� �Լ�
	DECODE(������, ������1, ����1������,
	                  ������2, ����2������,
				  �׿ܿ�������)
ex)gender�̶�� �÷��� 0�̸� ����, 1�̸� ����, �׿� �߼�				  
*/
select decode(0,0,'����',1,'����','�߼�') gender01,
		decode(1,0,'����',1,'����','�߼�') gender02,
		decode(2,0,'����',1,'����','�߼�') gender03,
		decode(3,0,'����',1,'����','�߼�') gender04
from dual;		
-- �μ���ȣ�� 10 ȸ��, 20 ����, 30 ����, 40 �, �׿ܴ� '����'
select ename, 
		decode(deptno,  10, 'ȸ��',
						20, '����',
						30, '����',
						40, '�',
						'����') selDept
 from emp;
 /*
��å�� �ѱ۷� Ǯ���ؼ� ���ó��
 CLERK :����, SALESMAN : ������, MANAGER :������.....
 �����ȣ, ��å(�ѱ�), �޿�
 */
select ename, 
DECODE(JOB, 'CLERK','����',
			'SALESMAN','������',
			'MANAGER','������',
			'ANALYST','�м���',
			'PRESIDENT','��ǥ',
			'��Ÿ') "��å(�ѱ�)"
 from emp;
/* ���� 
������ ���� ���ü�踦 �������� �Ѵ�.
decode�� Ȱ���ؼ�,
	 1000 �̸� F���         ������ 3%
	 1000 ~ 2000�̸� E���   ������ 5%
	 2000 ~ 3000 �̸� D���  ������ 7%
	 3000 ~ 4000 �̸� C���  ������ 4%
	 4000 ~ 5000 �̸� B���  ������ 3%
	 5000 ~ 6000 �̸� A���  ������ 2%
�̸�  �μ�  ����  �������  ������  �Ѿ�(����+������)
*/
SELECT ename, deptno, sal, 
	decode(trunc(sal/1000),0,'F���',
	                       1,'E���',
						   2,'D���',
						   3,'C���',
						   4,'B���',
						   5,'A���',
						   '��Ÿ���') "�������",
	decode(trunc(sal/1000),0,round(sal*0.03)||'(3%)',
	                       1,round(sal*0.05)||'(5%)',
						   2,round(sal*0.07)||'(7%)',
						   3,round(sal*0.04)||'(4%)',
						   4,round(sal*0.03)||'(3%)',
						   5,round(sal*0.02)||'(2%)',
						   '��Ÿ���') "������"	,
	decode(trunc(sal/1000),0,sal+round(sal*0.03),
	                       1,sal+round(sal*0.05),
						   2,sal+round(sal*0.07),
						   3,sal+round(sal*0.04),
						   4,sal+round(sal*0.03),
						   5,sal+round(sal*0.02),
						   '��Ÿ���') "�Ѿ�(����+������)"							   					    
from emp;
/*
case �Լ� :���ǿ� ���� ���� �ٸ� ó���� ����
CASE WHEN ����1(�񱳿�����) THEN ó���ҵ�����
     WHEN ����2(�񱳿�����) THEN ó���ҵ�����
	 WHEN ����3(�񱳿�����) THEN ó���ҵ�����
     ELSE �����ǿ� �ش����� ���� �� ó���� ������..
END
EX) ������ ���� ������� ��� ó��.. 	 
*/
SELECT CASE WHEN 80>=90 THEN 'A'
			WHEN 80>=80 THEN 'B'
			WHEN 80>=70 THEN 'C'
			WHEN 80>=60 THEN 'D'
		ELSE 'F'
	  END GRADE
FROM DUAL;	
SELECT * FROM EMP;
-- 	�μ���ȣ�� �������� �űԺμ� ���ġó�� �Ѵ�.
SELECT empno, ename,
	case when deptno=10 then '�μ��̵�'
		 when deptno=20 then '�ο�����'
		 when deptno=30 then '��������'
	     else '���μ�����'
	end  result
FROM EMP;	
/*
����) �Ի� �б� ���� ǥ��(1/4,2/4,3/4,4/4) �Ի� �б⸦ ǥ��
 �����ȣ, �̸�, �Ի�(��/��), �Ի�б�

*/		
SELECT empno, ename, to_char(hiredate,'YY/MM') "�Ի�", 
	trunc(to_number(to_char(hiredate,'MM'))/4)+1||'/4' "�Ի�б�"
  FROM EMP;
select * from emp;

/* 6������ �� */

select * from emp;
/*
�׷��Լ�: �����͸� �׷캰�� ���ġ�� ó���� �� Ȱ��ȴ�.
sum() : ���ջ�.
avg() : ���
count() : ����
max() :�ִ밪
min() :�ּҰ�

*/
select sum(sal) tot, avg(sal) avg01, count(sal) cnt,
       max(sal) max01, avg(sal) min01
from emp;	   

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
commit; -- Ȯ��ó��, �������ϰų� �ٸ� ����ڵ� ����� �����͸� �� �� �ְ�.
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
/* ����
emp03 �������̺� ����
1. �Է�  empno�� ���� ���������� -1, mgr:cleark�� mgr�Է�, sal:��տ���, 
   comm:��ücomm�� �հ�
2. ���� ename:'�ű浿', job�� SUPERMAN, hirdate�� �ֱٿ� �Ի���+1
*/
select * from  emp;
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
rollback;   -- �����Ͱ� �ԷµǱ� ������ ���ư��� ���� Ȯ���� �� �ִ�.
 insert into dept01 values(50,'�λ�1','����1');
-- db������ ���´�.
-- �ܺο��� comit�ϱ� ������ �����Ͱ� ���� ������ �ȴ�.
-- tool�� ���� autocommit�� �߻��ϴ� ��찡 �ִ�..
select * from emp01;

/*
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


/*
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

/*
������ ����(������ dictionary)
�����ڿ��� �����ͺ��̽��� ���õ� ������ �����ϴ� ���� ���Ѵ�.

DBA_XXX : �����ڸ� ���ٰ����� ��ü(���̺� ��)�� ���� ��ȸ.
ALL_XXX : �ڽ� ���� ���� �Ǵ� ������ �ο� ���� ��ü(���̺�)�� ������ȸ
USER_XXX : �ڽ��� ������ ������ ��ü � ���� ���� ��ȸ.
*/
select * from user_tables
where table_name like '%EMP%'; -- ����� ���̺� ���� ����..
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
