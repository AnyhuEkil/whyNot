select * from emp;
-- �ּ� ����Ű ctrl+/
-- �ȳ��ϼ���
-- �ּ����Դϴ�.
-- select : Ư�����̺��� �÷����� �����ϴ� ��ɾ�.
-- 1) * : ��ü �÷��� ������ ������ list �Ҷ�.
-- 2) �÷��� : �ش� �����͸� ���� ���� ��ɾ�..
-- 3) from ���̺�� : ���̺��� list�ϱ� ���Ͽ�..
select * from emp;
-- emp���̺��� ��ü �÷� ������ list�ϼ���..
select empno, job from emp;
-- emp���̺��� �÷� �߿� empno�� job ������ list
select deptno, ename, sal from emp;
-- �μ���ȣ, �̸�, �޿�
--  ���� ���α׷��� �ε� �κ��� �÷����� �߿���.
-- empno : �����ȣ, ename:����̸�, job : ��å, mgr:�������ǻ��,
-- hiredate : �Ի���, sal : ����, comm : ���ʽ�, deptno:�μ���ȣ.
-- ����)  ����̸��� ��å, �μ���ȣ ������ �����͸� list �ϼ���..
select ename, job, deptno from emp;
-- ��� ������..
-- 	�����ͺ��̽��� �÷������� ������ ó���� �� �ִ�.. �⺻���� +,-,*,/
--  %(����)-�Լ��� Ȱ���ؾ���.
select * from emp;
-- ���� ������ +100�� ���� ���� ����ϼ���. (�̸�, �޿�)
select ename, sal, sal+100, sal-10, sal*10, sal/10 from emp;
-- �÷����� ����ó�� : �÷���1+�÷���2
select * from emp;
-- ex) �μ���ȣ�� ������ �ջ��� ������ ����ϼ���..
select ename, sal, deptno, sal + deptno from emp;
-- ����1) ������ ���� �������� ������� 10%�ö���. sal * 10%(X)
--  �����, ��������, �λ��, ����ȿ��������� ����ϼ���..
select ename, sal, sal*0.1, sal+(sal*0.1) from emp;
select * from emp;
-- ����2) �μ����� �����λ���� �ٸ��� å��.
-- �μ���ȣ 10==> 10%, 20 ==> 20%, 30 ==> 30%�� �λ�
--  �̸�, �μ���ȣ, ����, �λ�ȿ���
select ename, deptno, sal, (sal*(deptno*0.01)), sal+(sal*(deptno*0.01)) from emp;
-- ���ڿ��� ǥ�� +?
-- database ���ڿ� ����ó���� '||'�� Ȱ���Ѵ�.
select '����� �̸��� '||ename ||'�̰�, �μ���ȣ�� '||deptno||' �Դϴ�..' from emp;
select * from emp;
-- Ȯ�� ����)  �����ȣ�� @@@ ��  @@@@(�̸�)�� ���� ������ @@@@ ���� �Դϴ�!! --���listó��..
select '�����ȣ�� ' || empno ||'�� ' || ename ||'�� ���� ������ '|| sal ||' �����Դϴ�!!' from emp;
/*
����
�Ʒ��� �������� �����͸� ��Ÿ������..  
1. ename�� ���� ������ @@@���� �ε�, �ֱٿ� 5%�λ�� �ݾ��̸�, �۳� ������ @@@�����̾����ϴ�.
2. ename�� �Ի����� hiredate �Դϴ�.
3. ��å�� @@@�� @@@�� �μ���ȣ�� @@@ �Դϴ�.
4. @@@���� ���� ������  ���ʽ�(comm)�� �ջ���� @@@ �Դϴ�.  
*/
-- nvl()
-- null : ������ ���̽����� �����Ͱ� ���� ���� null���̶�� �Ѵ�. ����('')�� �ƴϸ� 0�ƴ�
-- ���״�� �����Ͱ� �ԷµǾ� �ִ� �ʴ� ���� ���Ѵ�.
-- ���α׷����� ���̴� �ʱⰪ�� �����ؼ� �˰� �־�� �Ѵ�.
-- ���� :ȭ��� ������ ���� null�� ǥ�õǾ�ų�, nullpointerException�̶�� ������ �߻��Ѵ�.
-- ���� ������ �÷����� ���굵 ���������� ���� �ʴ´�..
select sal, sal+1,sal+0,sal+null from emp;
-- �׷��� �����ͺ��̽������� null�� ���� ������ �������� ó���� ���� �Լ��� ���� Ȱ���Ѵ�.
-- nvl�� Ȱ���ϸ� null���� ��, �ʱⰪ�� ���� ���Ǹ� �ؼ� ���� ó���� �����ϰ� �Ѵ�.
-- nvl(�÷���, �����Ͱ� null�� �� ó���� ������)
select * from emp;
select comm, comm+10, nvl(comm,0), nvl(comm,0)+10 from emp;

/*1��������*/

-- �÷��� �̸�(����) ���̱�!!

select * from emp;
-- empno�� ��Ī���� companyNo�� ����� �ߴ�. ����ϼ���..
-- �÷��� as ��Ÿ�� ��Ī�÷��� alias
select empno as companyNo from emp;
-- ��Ī�� ���α׷� �������� �߿��� �ǹ̸� ������..
-- ��ټ� ���α׷��� ��Ī���� �����ϰ� ����ϴ� ��찡 ����.
-- ex) rs.getString("��Ī/�÷���")
--  as ��ſ� ����(' ')���� ó���Ѵ�.
select '�����'||empno || ' �Դϴ�!' show from emp;
-- ���� application������ rs.getString("show")�� ó���ȴ�.
select * from emp;
-- ������ ������ ����� �÷����� ��Ÿ������..
-- �÷���        depandname   upgradeRatio   enterCompany  
-- ��µ�����  (�μ���ȣ)�̸�    ������ 10%     �Ի�����
select '( '||deptno||' ) '|| ename depandname, sal*0.1 upgradeRatio, 
		hiredate enterCompany from emp;
-- 	���鰪�� ��Ī���� ó���ϱ�..: " "���� ��Ī���� �����ش�.
select ename "name intro" from emp;
-- �ѱ��� ��Ī���� ó���� ����, " "���̿� ó��
select deptno "�μ���ȣ" from emp;

select * from emp;
-- �ߺ��� ó�� : �����ͺ��̽������� ������ ���� �Է��ϴ� ���� ���̺������
-- �Է��ϴ� ���� �����Ѵ�. 
-- �÷��� �ִ� ��� �����Ͱ� �����ؼ��� �ȵȴٴ� ���̴�.
-- �׷���, �Ѱ� �÷����� ��ȸ�� ���� ������ �����Ͱ� ��Ÿ�� �� �ִ�.
select deptno from emp;
-- �϶�, �ϳ� �Ǵ� �ټ��� �÷��� �����Ͱ� ������ ���� filtering ���ִ� ó����
-- �ִµ� �̸� distinct��� �Ѵ�.
-- Ȱ������ select distinct �÷�1, �÷�2.. from ���̺�
select distinct deptno from emp;
select * from emp;
-- Ȯ�ο���1) -mgr�� ���ϰ� ���� ����ϼ���..
-- Ȯ�ο���2) job�� mgr �÷��� ���ϰ� ���� ����ϼ���.
select distinct mgr from emp;
select distinct job, mgr from emp;
/*
����ó��..
Ư���� ������ list���뿡�� �ʿ��� �������� ������� filtering�ϴ� ����
���Ѵ�.
1. ���� ó��..
*/
select * from emp;
-- ������ 3000�̻��� �����͸� list ó��..
-- where �÷��� > ���ǵ�����
select * from emp
where sal>=3000;
-- �����ͺ��̽��� ���̴� �񱳿�����
-- = (*), >, <, >=, <=,   <>,!=(�ٸ���)
select * from emp;
-- 1) �μ���ȣ 30�� �����͸� list �ϼ���..
select * from emp
where deptno=30;
-- 2) ������ 1000�̸��� ������
select * from emp
where sal<1000;
-- 3) ename�� SMITH�� ������
select * from emp where ename='SMITH';
-- 4) COMM�� NULL�� ������(*) - ���ݱ��� ��� �Լ�Ȱ��
select * from emp where nvl(comm,0)=0;
-- 	null���� ��Ÿ���� keyword is null
select * from emp where comm is null; 
--null�� �ƴ� ��, is not null
select * from emp where comm is not null;
-- 5) MGR�� 7698�� �ƴ� ������
select * from emp where mgr != 7698;
-- ���� ���� �ΰ��� ������ ���� ������ list�ϱ�..
-- ���� multi ���ǿ� ���� ó��..
select * from emp;
-- ������ 3000�̻��� ����� �̸��� ������ list
select ename, sal 
from emp
where sal>=3000;
select * from emp;
-- ������ 2000�����̰� ��å�� SALESMAN�� �����
-- �̸�, ��å, ������ ���..
select ename "�̸�", job "��å", sal "����"
from emp
where sal<=2000
and job='SALESMAN';
-- �÷����� ��ҹ��� �������� ������, �����ʹ� ��ҹ��� �����Ѵ�.
-- ��������
-- 1. EMP�߿� �޿��� 2000�̸��� �Ǵ� ��� ���� �߿� ����� �޿��� ����϶�.
select ename, sal from emp where sal<2000;
-- 2. ������ ���ʽ��� �ջ� �ݾ��� 1500�̸��� ����� �̸�, ����, ���ʽ�, 
--    �ջ���� ����ϼ���.
select ename, sal, comm from emp where sal+nvl(comm,0)<1500;
-- 3. MGR�� NULL�� ��� JOB, �̸�, ������ ����ϼ���.
select job, ename, sal from emp where mgr is null;
-- 4. JOB�� CLERK�� ����� DEPTNO�� 30�� ����� �̸�, ��å, 
--    �μ���ȣ�� ����ϼ���
select ename, job, deptno from emp where job = 'CLERK';
-- 5. ������ 2000���� 3000 ���̿� �ִ� ����� �μ���ȣ, 
--    �̸�, ������ ����ϼ���.
select deptno, ename, sal
from emp where sal>=2000 and sal<=3000;
select * from emp;


/*2������ ��*/

select * from emp;
--
/*
or ������ : ��ȸ ���ǿ� �־, �ϳ��� ���Ǹ� �����ϴ���,
�ش� �����Ͱ� ��� ó���Ǵ� ���� ���Ѵ�.
select �÷�
from ���̺��
where �÷�1 = ����1 or �÷�2 = ����2
�������� ���� �÷�1=����1�� �����ϰų�, �÷�2=����2�� ������ �� 
�����Ͱ� ��Ÿ���� ������ �ش� �����͸� ���� list�Ѵ�.
ex) �μ���ȣ�� 30�̰ų� ������� 'SMITH'�� �����͸� list�ϼ���.
*/
select * from EMP 
where deptno=30 or ename='SMITH';
-- Ȯ�ο���) ���ʽ��� �ְų� ��å�� 'SALESMAN'�� ���� ����ϼ���.
select * from emp
where comm is not null or job = 'SALESMAN';
/*
NOT ������
�ش� �������� ���̸� ����, �����̸� ������ ó���Ǿ� ��Ÿ�� �ʿ䰡 ���� ��,
Ȱ���Ѵ�.
�Ϲ�������, ���� �̿ܿ� �����͸� ����Ʈ�ϰ��� �� �� Ȱ��ȴ�.

�μ���ȣ�� 10�� �ƴ� �����͸� ����Ʈ�ϼ��� 
*/
SELECT * FROM EMP 
WHERE not deptno = 10;
-- deptno <> 10, deptno !=10 (������ ȿ��)
select * from emp;
--  Ȯ�ο���) ������ 2000~3000�� �ƴ�(2000�̸� �̰ų� 3000�ʰ�)�� ���� not
-- keyword�� Ȱ���ؼ� list �ϼ���.
select * from emp
where not (sal>=2000 and sal<=3000);
-- Ȯ�ο���) ��å�� SALESMAN�� �ƴϰ�, ������ 2000�̻��� ����� LIST�ϼ���
select * from emp
where not job ='SALESMAN'
and sal>=2000;
/*
between and������ 
�������� ������ Ư�� ���� ���̿� ���� ��, Ȱ��Ǵ� Ű�����̴�.
where �÷��� between A and B
�ش� �������� �÷��� ������ A�� B���̿� �ִ� ���� ���Ѵ�.
ex) ������ 2000���� 3000���̿� �ִ� �����͸� list�ϼ���..
*/
select * from emp
where sal between 2000 and 3000;
-- Ȯ�ο��� ����� 7400~7500 ���̿� ������ ������ 2000�̸��̰ų� 3000�ʰ��ϴ�
--         �����͸� list �ϼ���..
select * from emp
where empno between 7400 and 7500
and not (sal between 2000 and 3000);
/*
��¥�� ���� ó��..
�Ի����� 1981/01/01 ���� 1981/12/31 ���̿� �ִ� �����͸� list�ϼ���..
*/
--Ȯ�ο���) �Ի����� 1981�� 12���� �Ի��� ����� �̸��� �μ���ȣ�� ����ϼ���.
select * from EMP 
where EMP.HIREDATE between '1981/12/01' and '1981/12/31';
-- sysdate : ���� ��¥�� ����ִ� ����
select ename, hiredate, sysdate
from emp;
/*
IN ������
	�ش� �����Ϳ� ���� ������ ó���� ��, ���� �����Ϳ� ���� ��ȸ�� �ϰ��� �Ҷ� Ȱ��ȴ�.
	or�����ڿ� ������ ����
	����) �÷��� IN (�ش絥����1, �ش絥����2, �ش絥����3)
*/
select * from EMP;
-- �����ڹ�ȣ�� 7902, 7566, 7839�ΰ��� LIST�ϼ���..
SELECT * FROM emp
where mgr in (7902,7566,7839);
-- Ȯ�ο���) ����̸��� 'SMITH', 'WARD', 'JONES' �� ��� ��, ������ 1000�̸��� �����͸�
--         �̸��� ������ ����ϼ���.
select * from emp
where ename in('SMITH', 'WARD', 'JONES') AND SAL<1000;
/*
like�����ڿ� ���ϵ�ī��(%,_)Ȱ���ϱ�.
Ư�������Ϳ� ���� ���ڿ� ��ü ������ ��Ȯ�ϰ� ���� ���� ��, �˻������� ���� like�����ڿ�
���ϵ�ī�带 Ȱ���ϴ� ����̴�..
����) �˻��÷��� like '%�˻��ҵ�����%';

ex) ������� K�� ������ �����͸� list�ϼ���
*/
select * from emp
where ename like '%K%';
-- ���� K�� �����ϴ� �����͸� list�ҷ���?
select * from emp
where ename like 'K%';
select * from emp;
-- ��å��, MAN���� ������ �����͸� list�ϼ���..
select * from emp
where job like '%MAN';
SELECT * FROM EMP;
-- Ȯ�ο���) ��å��, S�� �����ϴ� �����Ϳ��� ���ʽ��� 300�̰ų� 400�̰ų�, 700�� �����͸�
--       ��å, �����, ���ʽ��� list�ϼ���..
select job, ename, comm
from emp
where job like 'S%'
and comm in(300,400,700);
select * from emp;
/*
���ϵ�ī��(_) ����ϱ�
_���ڼ��� �����ؼ� �ش系���� �˻��ϰ��� �Ҷ�, Ȱ���Ѵ�..

ex) �ι�° ���ڰ� 'A'�� ����� list 
*/
select * from emp
where ename like '_A%';
--�ι�° ���ڰ� A�ε� ���� ��ü ���
-- Ȯ�ο���) ������� 3��° ���ڰ� A�� �������߿�  �޿��� 2000�̻��� ���� list�ϼ���.
select * from emp
where ename like '__A%' and sal > 2000;
/*
NOT LIKE '���̵�ī��(%,_)'�ش� ������ �ƴ� ���� ���
ex) �̸��� 'A'���ڰ� ���Ե��� �ʴ� ����� �˻�.
*/
select * from emp
where ename not like '%A%';
select * from emp;
-- Ȯ�ο���) ��å�� ER�� ������ �ʴ� ������ ��, 1981�⵵�� �Ի��� ����� list�ϼ���..
select * from emp
where job not like '%ER'
AND hiredate between '1981/01/01' and '1981/12/31';
/*
����ó��..
�����ʹ� ������ ���������� ��������, ������������ ����ó���� �� �ִ�.
�׷�, �̿� ���� ���صǴ� �÷��� ���ؾ� �ϸ�, ���� �������� �������������� ǥ���ؾ� �Ѵ�.
����) order by �����÷�1 asc/desc
asc : ���������� ���ϸ� �Ϲ������� �������� ������ ������������ ��µȴ�. default
desc : ���������� ���Ѵ�.
ex) �޿��������� ��������/�������� ���� ����ϼ���..
*/
select * from emp
order by sal asc;
select * from emp
order by sal desc;
-- ex) ��å�� MANAGER�� �����͸� �Ի��� �������� ������������ LIST
SELECT * FROM EMP
WHERE JOB = 'MANAGER'
ORDER BY HIREDATE;
SELECT * FROM EMP;
-- Ȯ�ο���) ���ʽ��� �ִ� �����͸� �������� ������������ �����, �޿�, ���ʽ��� ����ϼ���
SELECT ename, sal, comm FROM EMP
WHERE COMM IS NOT NULL
order by comm desc;
-- ���ı����� ���� ���� 3������ �Ǿ� �ִٸ� ��� �ұ�?
SELECT ename, sal, comm FROM EMP
order by comm desc;
--  comm�� ������ ���� sal�������� �������� ó���Ѵ�.
SELECT ename, sal, comm FROM EMP
order by comm desc, sal desc;
-- Ȯ�ο���
-- 1) �Ի����� ������������ �����ϵ�, �����ȣ, �����, ����, �Ի����� ���
select empno, ename, job, hiredate
from emp
order by hiredate;
-- 2) �����ȣ�� �������� ������������ �����Ͽ� �����ȣ�� ����� ���
select empno, ename
from emp
order by empno desc;
-- 3) �μ� ��ȣ�� ���� ������� ����ϵ� ���� �μ��� ����� �ֱ� �Ի��� ������� ���
-- 	�����ȣ, �Ի���, �����, �޿������� ���
select deptno, hiredate, ename, sal
from emp
order by deptno asc, hiredate desc;
select * from dual;
/*
dual : �����͸� �׽�Ʈ�ϱ� ���� �뵵�� oracle ���� ��ü, �� ������ ��µȴ�. 
�ַ�, ����, �Լ����볻�� Ȯ���ϴµ� Ȱ��
*/
select 10+10 plus, sysdate, 10||'+'||10||'='||(10+10) calcu from dual;
select * from emp;


/*3������ ��*/

select * from emp;
/*
�����Լ� : ���ڸ� ó���ϴ� �Լ�. ���밪, �����Լ�(sin, cos, tan...)
		 �ø�(ceil),�ݿø�(round),����(trunc, floor), ������(mod)�� ó����.

1. abs :���밪-��ȣ�� ���� ����, ����� ó���ϴ� �Լ��� ���Ѵ�.		 
*/
select 25, -25, abs(25), abs(-25) from dual;
/*
2. floor() : �Ҽ��� �Ʒ��� ������ �Լ�.
*/
select 25.75, floor(25.75) from dual;
/*
3. round() : �ݿø� ó�� �Լ�
	round(������, �ݿø��� �ڸ���)
		�ݿø��� �ڸ��� : ��� - �Ҽ��� ������ �ڸ��� ó��
					   ���� - �ʴ���(1), �����(2) ������ �ش� ���� ��ŭ �ݿø�ó��.
					   
*/
select 25.278888, round(25.278888,2) from dual;
select 625.2999, round(625.2999,-2) from dual; -- ���ڸ��� �ݿø�ó�� ��.
select * from emp;
-- ����)
-- sal�� �����̶�� �� ��, �̴� �޿���(1/13)�� ó���Ͻÿ�, �� �̴��� ���ʽ��� �ִ� ���Դϴ�.
-- ��³��� : ���, ����, �̴ޱ޿�, ���ʽ�, �ѱ޿���(�޿���, 
--   �ѱ޿�����  10������ �ݿø� ó���Ѵ�.)
select empno, sal, round(sal/13,-1) monthpay, nvl(comm,0) bonus,
       round((sal/13)+nvl(comm,0),-1) totMonthpay
from emp;	   
/*
4. trunc�Լ� : Ư�� �ڸ��� ���Ϸ� ����ó��..
	trunc(������, �ڸ���ó��)
*/
select trunc(24.2433, 2), trunc(24.243, -1) from dual;
select * from emp;
select trunc(29.9949,1) from dual;
/*
���� sal�� �������� 
1000�̸�        - 10% ���ʽ�
1000~2000�̸� - 20% ���ʽ�
2000~3000�̸� - 30% ���ʽ�
3000~4000�̸� - 40% ���ʽ�
4000~5000�̸� - 50% ���ʽ�
5000~�̻�      - 60% ���ʽ���
�����ϱ�� �ߴ�.. �Լ��� Ȱ���ؼ�. �Ʒ� ������ ó���Ͻÿ�.
��� �̸� ���� ���ʽ�(%)  ���ʽ�
*/
select deptno, ename, sal, (floor(sal/1000)+1)*10||'%' per,
sal*(floor(sal/1000)+1)*0.1 bonus
from emp;
/*
5. mod�Լ� : ������ �Լ�ó��..
���� : mod(������, ������) :�ش絥���͸� ���� ���� ���� ��, ������ ���뿡 ���� ó��.
*/
select mod(27,2), mod(27,3), mod(27,4) from dual;
select * from emp;
-- �����ȣ�� Ȧ���� ����� �˻��ϼ���..
select * from EMP 
where mod(empno,2)=1;
select * from emp;
/*
����
����� �μ��������� 1���� 2������ ����� ü����ȸ�� �ϱ�� �ߴ�.
�μ���ȣ�� 10, 30 ==> 1��
�μ���ȣ�� 20, 40 ==> 2��
���� ������ ������ ���� ����ϼ���.
�μ���ȣ  �����ȣ �̸�     ����
*/
select deptno, empno, ename, mod((deptno/10)+1,2)+1||'��' teamName
from emp;
/*
���� ó�� �Լ�.
1. upper ��� �����͸� �빮�ڷ� ��ȯó��
	upper(������)
	�Ϲ������� ������Ͱ� �ҹ��ڳ� �빮�ڰ� ���� �ԷµǾ� �ִ� ���,
	�ش� �����͸� �Է¹���(��ҹ��� ���о���)�� �ش� �����͸� �˻��� ��� ���� ���δ�.
*/
select upper('hi! Good days!!') from dual;
select * from emp;
-- ��å�� ��ҹ��� ���� ���� ��ȸ�ҷ��� �Ѵ�. �Ʒ� salesman �̶�� �ԷµǾ �˻��Ϸ���..
select * from emp
where job = upper('salesman');
/*
2. �ҹ��ڸ� ��ȯ�ϴ� lower�Լ�..
	lower(������)
*/
select lower('Good night!!! This is the Best day!!') from dual;
select empno, lower(ename), lower(job) from emp;
/*
3. initcap�Լ� : ù���ڸ� �빮��, �������� �ҹ��� ó��..
	initcap(������)
*/
select initcap(ename), initcap(job) from emp;
/* Smith is a Clerk!!  ���� ���..*/
select initcap(ename) ||' is a '||initcap(job)||'!!!' introJob from emp;
select * from emp;
/*
4. ���ڱ��̸� ó���ϴ� length
���� length(������) : �ѱ۰� ����������� ���ڿ��� ������ ��Ÿ���� ��.
*/
select length('himan'), length('����Ŭ') from dual;

select * from emp;
-- ��å�� 5�� ������ �����͸� ����ϼ���..
select * from emp where length(job) <=5;
/*
5. lengthb(): byte�� ũ�⸦ ��� - ����(1�ڴ� 1byte), �ѱ�(1�ڴ� 2bytes)
*/
select lengthb('himan'), lengthb('ȫ�浿') from dual;
/*
6. substr(), substrb(): Ư�� ���ڿ��� �Ϻθ� �����ϴ� �Լ�.
	substr(������, 1����count�Ͽ� ������ ��ġ����, ������ ���ڿ��� ����)
*/
select substr('Welcome to Oracle world!!', 4,5) from dual;
select * from emp;
/* ex) job�� �������� 5���� ���ڿ��� �����Ͽ�, �̸��� ��å�� ���*/
select ename, substr(job,1,5) from emp;
/* Ȯ�ο��� 
	�Ʒ��� ������ �����͸� ȭ�鿡 list�ϼ���..
	���   �̸�   ��å(�̸��� ���ڿ��� ��ŭ��ǥ��)
	7499 ALLEN SALES
*/
SELECT empno, ename, substr(job, 1, length(ename)) from emp;
-- hiredate ���, ������ type�� ��¥����������, �ڵ� ����ȯ��  �Ǿ�
--   ���ڿ� ó�� �Լ��� ���ڿ��� �����Ͽ� ó���� �� �ִ�.
select * from emp;
select substr(hiredate,1,length(hiredate))  from emp;
-- 1980�� �����͸� ��Ÿ������..
select * from emp
where substr(hiredate,1,2) = '80';
select * from emp;
-- 1982�⵵ 12��01�� ~ 1982�� 12��31�� �Ի����� �����  �̸��� �Ի��Ϸ� ����ϼ���.
select ename, hiredate  from emp
where substr(hiredate,1,5)='82/12';
-- ����) �Լ��� �̿��Ͽ� ���� ������ ����ϼ���..
-- @@@��  �Ի���  @@�� @@�� @@�� �̸�, ���� ������ @@@ ���� �ް� �ֽ��ϴ�. 
-- column��  empinfo
select ename||'�� �Ի��� 19'|| substr(hiredate,1,2)||'�� '|| 
	substr(hiredate,4,2)||'�� '|| substr(hiredate,7,2)||'�� �̸�, '||
	'���� ������ '||sal ||'���� �ް� �ֽ��ϴ�' empinfo
from emp;
-- ����)substr�� Ȱ�� �Ͽ� JOB�� MAN���� ������ �����͸� ����ϼ���!!
select *
from emp
where substr(job, length(job)-2, length(job) )='MAN';
select *
from emp
where substr(job, -3 ) ='MAN';

/*
7. Ư�� ������ ��ġ�� ���� instr
	instr(������, '�˻��� ����') :ó������ �����ؼ� 1��° �˻��� �����Ͱ� ��Ÿ�� ��ġ
*/
select instr('hi!! good man', 'man') from dual;
/*
	instr(������,'�˻��� ����', ������ġ, �˻��� Ƚ��) 
	instr('oh! hi!! my girl!! hi!! feel so good!', 'o',3,2);
*/
select instr('oh! hi!! my girl!! hi!! feel so good!', 'o',3,2) from dual;
select * from emp;
/* �Ի����� 12���� �����͸� �̸��� �Ի����� ����ϼ��� instr()�� Ȱ�� */

select ename, hiredate
from emp
where instr(substr(hiredate,4,2),'12')>0;


/* 4�������� */

/*
LPAD/RPAD �Լ�.
Ư�� ���ڿ��� �ش��Ѵ� ���ڿ��� ä��� ó���� �ϴ� ���� ���Ѵ�.
LPAD : ���ʿ� ���ڷ� ä�켼��  
	LPAD(������, ����ũ���,'�ݺ��� ���ڿ�')

*/
-- # himan�̶�� ���ڿ� ���ʿ� '#'�� 20ũ�⸸ŭ ä���� ���..
--  ��üũ�⸦ �����, �ش� ũ�Ⱑ ���� ������ ���ڷ� ä��..\
-- �ǹ� migration varchar :����������, char:����������
-- ������������ �����͸� �������������� ��ȯ�Ͽ� �̵���ų�� Ȱ��
select lpad('himan', 7, '#') from dual;
/*
RPAD : �����ʿ� �ش� ũ�Ⱑ �� ������ Ư�����ڷ� ä��..
ex) good job���� ���ڰ� 20���� �� ������ @�� �����ʿ� ä��.
*/
select rpad('good job', 20, '@') from dual;
select * from emp;
-- Ȯ�ο��� ename�� job�� ũ��� ������ ���ڿ���ŭ �����ʰ� ���ʿ� �ش� ���ڿ��� �Ʒ� ��������
-- ��������..
-- 1. ENAME�� JOB���� ������ ũ�⸦ Ȯ���Ѵ�.
-- 2. ������ �߿� ���� ū �������� ũ�⸦ Ȯ���ؼ�.
-- 3. ENAME���� �����ʿ� @, JOB���� ���ʿ� ^�� �߰��ؼ� ��Ÿ���� �Ѵ�.
-- 4. ������ ���� ������ ���
--    �����ȣ  �̸�(@) ��å(^)  �Ի���
SELECT MAX(LENGTH(ENAME)), MAX(LENGTH(JOB)) FROM EMP;
SELECT RPAD(ENAME,6,'@') ENAME, LPAD(JOB,9,'^') JOB, HIREDATE FROM EMP;
SELECT * FROM EMP;
/*
LTRIM(), RTRIM() 
������ ���ڸ� �����ϴ� �Լ�.
LTRIM : ���ʿ� ���鹮�ڸ� �����ϴ� ó��
RTRIM : �����ʿ� ���鹮�ڸ� �����ϴ� ó��
ex) [����]This is your best day!!  ���ʿ� ���鹮�ڸ� ���� ó��..!!
*/
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
