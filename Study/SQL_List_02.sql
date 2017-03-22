-- 	06 start. a06_function
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
-- 	07 start. a07_group_function
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
       max(sal) max01, min(sal) min01
from emp;
/*
�׷캰�� �������� ���ġ ó���ϱ�..
select ó���ұ׷��÷�, �׷��Լ�
from ���̺��
where ����..  (�׷��� ó���ϱ� �� ����)
group by ó���ұ׷�Ŀ��
having �׷쿡 ���� ����ó��(�׷��� �� �Ŀ� ����)
�μ���ȣ���� ���ջ� �������� ����ϼ���..
*/
select deptno, sum(sal),avg(sal) avg01, count(sal) cnt,
       max(sal) max01, min(sal) min01
from emp
group by deptno;
-- ��ü ������ �Ǽ��� Ȯ���ϼ���.
-- COUNT(�÷�,��ü(*))
-- Ư���÷��� �����Ͱ� �ִ� �Ǽ��� ��� ó��
SELECT COUNT(*) CNT, COUNT(COMM) BONUS_CNT-- 
FROM EMP;
SELECT COUNT(COMM) FROM EMP;
-- �ߺ��Ǵ� �����Ϳ� ���� ���� Ȯ�� ó��..
SELECT DISTINCT JOB FROM EMP;
SELECT COUNT(JOB) FROM EMP;
-- �ߺ��� �����͸� ������ �Ǽ� ó�� COUNT(DISTINCT �÷���)
SELECT COUNT(DISTINCT JOB) FROM EMP;
SELECT * FROM EMP;
-- �׷��Լ��� ���ǹ� ó��..
-- ������ 3000�̻��� ����߿� ��å��(JOB)�� �ο����� ���ϼ���.
SELECT JOB, COUNT(JOB)
FROM EMP
WHERE SAL>=3000
GROUP BY JOB;
SELECT * FROM EMP;
-- Ȯ�ο���
-- �Ի����� 1~3�� �λ���� �μ����� �ο����� üũ�ϼ���..
SELECT DEPTNO, COUNT(DEPTNO), TO_CHAR(HIREDATE,'MM')
FROM EMP;
SELECT DEPTNO, COUNT(DEPTNO) CNT
FROM EMP
WHERE TO_NUMBER(TO_CHAR(HIREDATE,'MM')) BETWEEN 1 AND 3
GROUP BY DEPTNO;
-- �Ի��� �б⺰�� �����͸� �Ǽ��� ó���ϴ� ����.
SELECT FLOOR(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4)+1, COUNT(*) 
FROM EMP
GROUP BY FLOOR(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4)+1;
--  TO_CHAR(HIREDATE,'MM') : HIREDATE��¥�� �����͸� ������ ���ڷ� ���.
SELECT HIREDATE, TO_CHAR(HIREDATE,'MM') FROM EMP;
-- TO_NUMBER() : ������ ���ؼ� ���ڸ� ���������� ��ȯó��..
SELECT HIREDATE, TO_NUMBER(TO_CHAR(HIREDATE,'MM')) FROM EMP;
-- /4���ϸ� 1~3, 4~6....
SELECT HIREDATE, TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4 FROM EMP;
-- FLOOR() �Ҽ������� ���� ����ó��..
SELECT HIREDATE, FLOOR(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4) 
FROM EMP;
-- Ư�� �Լ��� ó���� �����͸� �׷캰�� ���ġ�� ������ ��, Ȱ��ȴ�.
SELECT FLOOR(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4)+1 PART, 
       COUNT(*)
FROM EMP
GROUP BY FLOOR(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4);
/*
����  
������������ �ο����� üũ�ϼ���..
 ����               �����(�ְ�ġ,����ġ,���ġ)
1000�̸�       @@      
~2000�̸�     @@@
~3000�̸�     @@
~4000�̸�    
~5000�̸�
~6000�̸�
*/
SELECT * FROM EMP;
/*
HAVING ����
group by�ȿ� �־��� �׷��� �����Ϳ� ���� ������ ó���ϰ��� �� ��, Ȱ��ȴ�.

ex) �μ����� ��տ����� ó���ϰ�,
	�� �׷캰 ��տ������� 2000 �̻� �� �����͸� �ε��ϼ���..
*/
select deptno, avg(sal)
from emp
where sal>=2000 -- ����� �׷캰�� �������� ����ó��..
group by deptno
having avg(sal)>=2000;
-- �׷쳻���� ����ó��..
/*
ex) �μ��� �ִ밪�� �ּҰ��� ���ϵ� �ִ� �޿��� 2900�̻��� �μ��� ��� ó��..
*/
select deptno, max(sal), min(sal)
from emp
group by deptno
having max(sal)>=2900;
-- 	08 start. a08_join
/*a08_join.sql*/
select count(*)
from emp, dept;
-- (emp���̺�)  X  (dept���̺�)
-- ũ�ν� ����
select count(*)
from emp;
/
select count(*) from dept;
select * from emp;
select * from dept;
/*
equal join : �ΰ��̻� ���̺��� �����̺� �ҼӵǾ� �ִ� �÷��� �����Ͱ� ���� ���� ���� ��,
�����Ͽ� ó���� �� �ִ� join�� ���Ѵ�.
����  
	select ǥ�����÷�
	from ���̺�1, ���̺�2
	where ���̺�1.�����÷� = ���̺�2.�����÷�
	�����÷� : ���� �����Ͱ� �ִ� �÷�..
*/
select * 
from emp, dept
where emp.deptno = dept.deptno;
-- ����� �̸��� ��å, �ҼӺμ����� ����ϼ���..
select ename, job, dname
from emp, dept
where emp.DEPTNO = dept.DEPTNO;
select * from emp;
-- ex) dept�� �����Ͽ� �����, �μ���ġ(loc)�� ���
select * from dept;
select ename, loc
from emp, dept
where emp.DEPTNO = dept.DEPTNO;
-- Ȯ�ο���) ���ʽ��� �ִ� ����� �̸��� �μ����� ����ϼ���!!
select * from emp;
select ename, dname
from emp a, dept b
where a.DEPTNO = b.DEPTNO
and a.comm is not null;
/*����
	�μ���ġ�� ����� ���� �Ʒ� �������� ����ϼ���..
	�μ���ġ   ��� ��..
*/
select loc, count(*)
from emp e, dept d
where e.deptno = d.deptno
group by loc;
select * from emp;
/*
non-equi join
���̺� ���̿� �÷��� ���� ���������� ��ġ���� ���� �� ����ϴ� �������� '='�� ������ �����ڸ� ����Ѵ�.
*/
select * from salgrade;
-- �޿� ����� 5���� ������ �� ����� ǥ���Ͻÿ�..
--  where sal between [losal] and [hisal]
-- �̸��� ���� ��������� ����ϼ���..
--  ���̺� alias ����ϱ� :���̺��� �÷��� ���� �̸��� ������ �ǹ̰� ������
-- 	   ���� �̸��� ������ �����ϱ����� ���̺��[����]alias�� Ȱ���Ѵ�.
--    ���̺�alias.�÷���
--    ����, ������ �÷��� ���� ����, �������� ���� ����ϴ� ��쵵 �ִ�.
select e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal BETWEEN s.LOSAL and s.HISAL;
/* ����
student10  ���̵�, �̸� 
studentPoint ���̵�, ����, ����
gradeCheck ��������lopoint, �ְ�����hipoint, �������(A~F)
1) ���̵� �����ؼ�(equal join)
	�̸� ���� ����  ���
2) 	������ �����ؼ�(not equal join)
    ����  ���� �������
3) 	student10 studentPoint gradeCheck ������ �Ͽ�..
   �̸�  ����  �������
*/
CREATE TABLE student_main
(
   ID VARCHAR2(20) PRIMARY KEY,
   PASS VARCHAR2(20),
   NAME  VARCHAR2 (50)
);
CREATE TABLE STUDENT_POINT(
	ID VARCHAR2(20) REFERENCES STUDENT_MAIN(ID),
	subject VARCHAR2(50),
	POINT NUMBER
);
drop table gradecheck;
create table gradecheck(
   ptGRADE   varchar2(10),
   lopt   NUMBER,
   hipt   NUMBER	
);
insert into gradecheck values('A����',90,100);
insert into gradecheck values('B����',80,89);
insert into gradecheck values('C����',70,79);
insert into gradecheck values('D����',60,69);
insert into gradecheck values('F����',0,59);
SELECT * FROM STUDENT_MAIN;
SELECT * FROM STUDENT_POINT;
INSERT INTO STUDENT_MAIN VALUES('C001001','7777','ȫ�浿');
INSERT INTO STUDENT_MAIN VALUES('C001002','7777','�ű浿');
INSERT INTO STUDENT_MAIN VALUES('C001003','7777','���浿');
/*
outer join
�ΰ��� ���� ���迡 �ִ� ���̺� �ּ�, ���� �Ǵ� ���ʴ� 
������ �������� �ʾƵ� ������ ����� ����ؾ� �ϴ� ��쿡 Ȱ��Ǵ� �����̴�.
where �����Ͱ� ���� ���̺�.�÷���(+) = �����Ͱ� �ִ� ���̺�.�÷���
*/
select * from dept;
select distinct deptno from emp;
-- �μ���ȣ���� ��Ī�Ǵ� ����̸��� ����ϵ�,
--    �̸��� ������ ���ٴ� ǥ�ð� �ʿ�
--
--�μ���ȣ, �μ���,  �̸�
select d.deptno, d.dname, nvl(e.ename,'�ο�����') ename
from emp e, dept d
where e.deptno(+) = d.deptno
order by e.deptno;
/*
����) outer join, group�� Ȱ���Ͽ� 
	  �μ���  �ο��� Ȯ���ҷ��� �Ѵ�.
	  �Ʒ��� �������� ����ϼ���  �ο��� ���� ���� 0���� ǥ��
	  �μ���  �ο�
*/
/*
self join : �� �״�� �ڱ� �ڽŰ� ������ �δ� ���� ���Ѵ�.
from���� ���� �̸��� ���̺��� �����Ͽ�, �ٸ� ���̺��� ��ó�� �ν��ؼ�
�����Ͽ� �� ������� ����ϴ� ���� ���Ѵ�.
select *
from ���̺�� alias01, �������̺�� alias02
where alias01.�����÷� = alias2.�����÷�
ex) ������̺�(emp)����  �����  �����ڸ��� ����ϼ���..
*/
select work.ename, work.mgr,manager.ename 
from emp work, emp manager
where work.mgr = manager.empno;
/*
������ join���� ���� ���̺� �����(self join)
1. ������ �����Ѵ�..
	id�� ����id�� �Է��ϴ� key�� �����.
	numid, parentnumid, role01, name
	���̵�, �������̵�, ����, �̸�
2. ���̺��� �����Ѵ�.
	create table family(
		numid number,
		parentnumid number,
		role01 varchar2(100),
		name varcahr2(500)
	);	
3. �����͸� �Է��Ѵ�.(���� �������� ������ ������ ���� ������ �Է�ó��)
	insert into family values(1,0,'�Ҿƹ���','ȫ�浿');
	insert into family values(2,1,'�ƹ���','ȫ����');
	insert into family values(3,2,'�Ƶ�','ȫ��ȣ');
	insert into family values(4,1,'����','ȫ��ȣ');
	
	
4. �Էµ� ������ ������ ���������� �Ǿ� �ִ��� Ȯ���Ѵ�.
	- ��ȸ ó��..
*/
create table family(
		numid number,
		parentnumid number,
		role01 varchar2(100),
		name varchar2(500)
	);
insert into family values(1,0,'�Ҿƹ���','ȫ�浿');
insert into family values(2,1,'�ƹ���','ȫ����');
insert into family values(3,2,'�Ƶ�','ȫ��ȣ');
insert into family values(4,1,'����','ȫ��ȣ');
select * from family;
/* �̸�  role �����̸�
*/
select cur.name, cur.role01, par.name pname
from family cur, family par
where cur.parentnumid=par.numid;
-- 	09 start. a09_subQuery
/*
subquery?
�ϳ��� select������ �� �ȿ� ���Ե� �� �ϳ��� select ������ ���Ѵ�.
���������� �����ϰ� �ִ� �������� ��������(main query), ���Ե� �� �ϳ���
������ ���� ����(subquery)��� �Ѵ�.
ex) ������̺��� ������ �ְ�� ���� ����� �̸��� ������ list�ϼ���..
SELECT ENAME, SAL   --> MAIN QUERY
FROM EMP
WHERE SAL = ( SELECT MAX(SAL)
              FROM EMP )  --> SUBQUERY
SELECT MAX(@@), ENAM, JOB			   
�ۼ��� ������
1. ���������� �� ������(=,>,<...)�� �����ʿ� ����ؾ� �ϰ�  ��ȣ��
   �ѷ��� �ִ� ���� �Ϲ����̴�.
2. ���������� ���� ������ ����Ǳ� ������ ����ȴ�.

���������� ����
1. ������ ������ ó���Ǵ� ���.
   SELECT *
   FROM ���̺�
   WHERE �÷��� = (SELECT �÷� FROM ���̺� WHERE ����);
   ## ���ϰ� ����: =,>,< (�񱳿����� Ȱ��)
      ���߰� ����: IN, EXIST, ANY, ALL

2. ���̺�� ��ü�� SUBQUERY ó���ϴ� ���..
   SELECT �÷���1+�÷���2, ....
   FROM ( SELECT �÷���1, �÷���2, �Լ�(�÷���3)
            FROM ���̺��
			WHER ����  )
   WHERE ����..			

3. SELECT (SELECT �÷�1 FROM ���̺�� WHERE ����=�������̺� ����1 ),
          �÷�2, �÷�3
    FROM ���̺�
	WHERE ����...		     
			  
*/
-- 1. ���ǰ����� SUBQUERY�� ���Ǵ� ���.
--   EX) ��տ������� ���� ������� �̸��� ������ ����ϼ���.
SELECT ENAME, SAL
FROM EMP
WHERE SAL>( SELECT AVG(SAL)
             FROM EMP );
--   EX) ���ʽ��� �ִ� ������� ��, �ְ��� ����� �̸��� ������ ���ʽ���
--        ����ϼ���..
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM =(
SELECT MAX(COMM)
FROM EMP);
--   EX) ���ʽ��� �ִ� ������� ��, ��� ���ʽ����� ����  ����ϼ���..
SELECT AVG(COMM)
FROM EMP
WHERE COMM IS NOT NULL;
--   EX) ������� ��, ��� ���ʽ����� ����  ����ϼ���..
SELECT AVG(NVL(COMM,0))
FROM EMP;
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM >(SELECT AVG(COMM)
				FROM EMP
			WHERE COMM IS NOT NULL);
SELECT * FROM EMP;
-- Ȯ�ο���
-- 1. �μ���ȣ�� ���� ���� ����� �̸��� �μ��� ����ϼ���..
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = (SELECT MAX(DEPTNO) FROM EMP);
-- 2. ���� �ֱٿ� �Ի��� ����� �̸��� ��å, �Ի����� ����ϼ���.
-- ==> MAX(HIREDATE):�ֱٿ� �Ի���
-- ==> MIN(HIREDATE):���� ���� �Ի��� �Ի���
SELECT ENAME, JOB, HIREDATE
FROM EMP
WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
SELECT * FROM EMP;
-- SUBQUERY�� ������� 2�� �̻��� ���..
-- EX) �μ����� �Ի����� �ְ��� ������� �̸��� �Ի����� ����ϼ���.
SELECT DEPTNO, MAX(HIREDATE)
FROM EMP
GROUP BY DEPTNO;
-- 1) ���� ���ǿ� ���� ó��..
SELECT *
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE DEPTNO<30);
-- IN ���п� QUERY�� �־ �ش��ϴ� ������ ������ ������ ó���� �� �ִ�.
-- SAL�� 3000, DEPTNO 20
-- DEPTNO, HIREDATE�� ������ �Ѵ� QUERY�� ���ؼ� ó���� ��..
SELECT ENAME, HIREDATE, DEPTNO
FROM EMP
WHERE (DEPTNO, HIREDATE) IN ( SELECT DEPTNO, MAX(HIREDATE)
	                        FROM EMP
							 GROUP BY DEPTNO);
-- SUBQUERY�� �������	�ΰ� �̻� ���� ����, �ش� �÷��� ������ �´� �÷��� �������־
--  ��� ó���� �����ϰ� �Ѵ�.  (�÷�1, �÷�2 ) IN (SELECT �÷�1, �Լ�(�÷�2) FROM...
SELECT * FROM EMP;
-- Ȯ�ο���
-- 1. JOB(��å��)�� ���� ���� ������ �޴� ����� �̸�, ��å, ������ ����ϼ���..
SELECT ENAME, JOB, SAL
FROM EMP
WHERE (SAL, JOB) IN(
					SELECT MIN(SAL), JOB
				FROM EMP
				GROUP BY JOB);
-- ����(��������)
-- 1. �Ի��� �б⺰�� ���� ���� ������ �޴� ����� ����ϼ���.
-- 2. ������ 3000 �̻��� ��� �߿�, ���(���̺�Ȱ�뵵 ����)�� �����
-- 	�ش� ��޺� �ְ� ������ �޴� �����  �̸�, ���, ������ ����ϼ���.
/*
��� ���̺��� 30�� �Ҽ� ����� �߿��� �޿��� ���� ���� �޴� ��� ����
���� �޿��� ���� ����� �̸��� �޿��� ����ϼ���.
##
30�� �Ҽ� ����� �߿��� �޿��� ���� ���� �޴� ��� 
==> 1) GROUP �Լ��̿�.
    2) ��ü�����͸� SUBQUERY�� �ε��ؼ�..
		== ALL, ANY ..(SUBQUERY)
		ALL : subquery�� ��� ���� ��ġ�� ��.
		<==> ANY, SOME : SUBQUERY�� ������� �ϳ� �̻� ��ġ�ϸ� 
*/
SELECT ENAME, SAL
FROM EMP
WHERE SAL >= ALL(SELECT SAL FROM EMP WHERE DEPTNO=30);
/**/
SELECT SAL FROM EMP WHERE DEPTNO=30;
SELECT ENAME, SAL
FROM EMP
WHERE SAL >= ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);
SELECT * FROM EMP;
-- Ȯ�ο���
-- 1. ������ 3000�̸��� ��� �߿�, �ֱٿ� �Ի��� ����� �����ȣ�� ���� �Ի�����
-- 	����ϼ���
SELECT EMPNO, SAL, HIREDATE
FROM EMP
WHERE HIREDATE >=ALL(
SELECT HIREDATE
FROM EMP
WHERE SAL<3000);
-- ����.
-- 1. �μ���ȣ�� 30�� ��� �߿�, ���� ���߿� �Ի��� ������� ������ ������ ����ϼ���.
-- 2. ������ 'SALESMAN'�� ����� �޴� �޿����� �ּ� �޿����� ���� �޴� ������� �̸���
-- �޿��� ����ϵ� �μ���ȣ 20���� ����� �����Ѵ�. (ANY������ �̿�)
/*
WHERE EXISTS(SUBQUERY)
:�ش� SUBQUERY�� �����Ͱ� �ִ��� ���θ� üũ�ؼ� ���� SQL�� ó���ϰ��� �Ҷ�
Ȱ��ȴ�.
EX) �μ���ȣ�� 30�� �����Ͱ� ������ ��ü ������̺��� LIST �ϼ���..
    ���࿡ �μ���ȣ�� 30���� ������ ��ü ������̺� LIST�� ���� ó���ϰڴ�.
*/
SELECT * 
FROM EMP
WHERE EXISTS(SELECT * FROM EMP WHERE DEPTNO=30);
--  Ư�� ���ǿ� ���ؼ� ��ü ������ �ε� ���θ� ó���ϰ��� �� ��, Ȱ��ȴ�.
-- Ȯ�ο���
-- �����ڹ�ȣ(MGR)�� �������߿� NULL���� ������, �̸��� �����ڹ�ȣ, ��å
--  �� ����ϰ��� �Ѵ�. SQL�� �ۼ��ϼ���..
SELECT ENAME, MGR, JOB
FROM EMP
WHERE EXISTS(SELECT * FROM EMP WHERE MGR IS NULL);
/*
���������� Ȱ���� ���̺� ����, ������ �Է�, ����, ����..

1. ���̺� �����ϱ�..
	1) ������ + ����
		CREATE TABLE �������̺��
		AS SELECT �÷�1, �÷�2 FROM ���̺�  WHERE ����..
	EX) ������ 2000�̻��� ������ �߿�  �����ȣ(no) �����(name), ����(salary), 
	                         �μ��̸�(dname) ��
	    ���̺��� emp001�� ������� �Ѵ�.	
*/
create table emp001
as
SELECT empno no, ename name, sal salary, dname
 FROM EMP A, DEPT B
 where A.DEPTNO=B.DEPTNO
 AND sal>=2000;
SELECT empno no, ename name, sal salary, dname
 FROM EMP A, DEPT B
 where A.DEPTNO=B.DEPTNO
 AND sal>=2000;
/*
 
 */
select * from emp;
drop table emp001;
-- Ȯ�ο��� - emp, salgrade ���̺��� Ȱ���Ͽ�
-- ������ ���� �ű����̺��� �����ϼ���..
-- ������ 1000 �̻� �Ǵ� ������ ��,
-- �����(name), �μ���ȣ(partno), ����(salary), �޿����(grade)
-- �� ��, empgrade ���̺��� �����ϼ���.
create table empgrade
 as
 select ename name, deptno partno, sal salary, grade
 from  emp, salgrade
 where sal between losal and hisal
 and sal>=1000;
select * from empgrade;
-- ��������
-- ������ ���� ������ ���̺��� �����ϼ���.
-- �̸�(name) ��ȣ(no) �Ի���(credate)-���ڿ�   ���ر��رٹ�����(workyears)
-- 					@@@@ �� @@@ �� @@@ ��      @@@@
-- new_emp �� �����ϼ���.
/*
�������� ������ �����ϰ��� �� ��..
where 1=0�� ó�� �ؼ� ���̺��� ����
*/
create table emp_structor
as
select * 
from emp
where 1=0;
select * from emp_structor;
-- 	10 start. a10_subQuery
/*
���� ������ �̿��� ������ �߰�.
insert ������ select�� ȥ���ؼ�, �����͸� �Է� ó���� ����.
���� : INSERT INTO ���̺��
       SELECT * FROM �Է������̺�; �ش� SQL�� ���� ������ ������
	   �� �ѹ��� �Է��� �� �ִ�..
	   ������ ��) �Է��� ���̺��� �÷��� SELECT [�����÷���]��
	   �÷� ������ TYPE�� �����Ͽ��� �Ѵ�.
	   
*/
select * from emp_structor;
-- EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
INSERT INTO emp_structor
SELECT * FROM EMP
WHERE SAL>=3000;
SELECT * FROM emp_structor;
-- �÷� ���� �� ����
/*
	insert into ���̺��(�÷�1, �÷�2, �÷�3)
				select �÷�1, �÷�1+�÷�2, �Լ�(�÷�3)
				from ���̺��
				where ����..
*/
INSERT INTO emp_structor(empno, sal, ename)
	select empno, sal+comm, rpad(ename,7,'^^') from emp;
select * from emp_structor;
select * from emp;
select * from dept;
create table dept_sub
as select deptno, dname, loc, '     ' kname, 0 membercnt 
   from dept
   where 1=0;
select * from dept_sub;
select deptno, dname, loc, 
	      decode(deptno, 10,'ȸ��',20,'����',30,'����', 40, '�','����') kname, 
	    0 membercnt 
	   from dept;
insert into dept_sub
	select deptno, dname, loc, 
	      decode(deptno, 10,'ȸ��',20,'����',30,'����', 
		  			40, '�','����') kname, 
	      (select count(*) from emp where deptno=a.deptno ) membercnt 
	   from dept a;
select count(*) from emp where deptno=30;
select a.*,
      decode(deptno, 10,'ȸ��',
                     20,'����',
		     30,'����', 
	  	     40,'�',
		     '����') kname 
from dept a;
select deptno, dname, loc, 
	      decode(deptno, 10,'ȸ��',20,'����',30,'����', 
		  			40, '�','����') kname, 
	      (select count(*) from emp 
		  where deptno=a.deptno ) membercnt 
	   from dept a;
select count(*) 
         from emp 
	 where deptno=20;
/*
���� ��������:
	�����ϴ� main sql������ subquery�� �ش� ������ �����
	ó���ϴ� ���� ���Ѵ�..
update ���̺��
  set �÷��� = ������(�����ͺκ��� subquery�� ó�� 
                    select �÷���
                    from ���̺� where ����
					)
 where ����
 ex) empno�� 7369�� ����� ���ʽ�(comm), 
        ��ü ���ʽ��� ����� �Ҵ� �ҷ��� �Ѵ�. 
*/
-- 1. subquery
select avg(comm)
 from emp;
-- 2. mainquery
update emp
   set comm=( select avg(comm)
 			 from emp  )
 where empno=7369;
select * from emp;
--  Ȯ�ο���.
-- 1. emp_sub77 �̶�� emp�� �������̺��� ����.
-- 2. emp_sub77���� comm�� null���� �����Ϳ� sal�� ���������� �����ϼ���.
create table emp_sub77
as select * from emp;
update emp_sub77
  set comm=(select min(sal) from emp_sub77)
  where comm is null;
select * from emp_sub77;
