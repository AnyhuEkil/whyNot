select * from emp;




/*
select �÷�
from ���̺��
where �÷�1 = ����1 or �÷� 2 = ����2
�������� ���� �÷�1=����1�� �����ϰų�, �÷�2=����2�� ������ ��
�����Ͱ� ��Ÿ���� ������ �ش� �����͸� ���� list�Ѵ�.
ex)�μ� ��ȣ�� 30�̰ų� ������� 'SMITH'�� �����͸� list�ϼ���
*/
select * from emp where deptno=30 or ename='SMITH';

SELECT * from emp;
-- Ȯ�ο���) ������ 2000~3000�� �ƴ� (2000�̸��̰ų� 3000�ʰ�)�� ���� notŰ���带 Ȱ���ؼ� list�ϼ���.
-- Ȯ�ο���) ��å�� SALESMAN�� �ƴϰ�, ������ 2000�̻��� ����� LIST�ϼ���
select * from emp where not sal between 2000 and 3000;
select ename "����̸�" from emp where job !='SALESMAN';

/*
between and ������
������ ������ Ư�� ���� ���̿� ������, Ȱ��Ǵ� Ű���� �̴�.,
where �÷��� between A and B
�ش� ������ �� �÷��� ������ A�� B���̿� �ִ� ���� ���Ѵ�. 
ex)������ 2000���� 3000���̿� �ִ� �����͸� list�ϼ���
*/
select * from emp where sal between 2000 and 3000;

-- Ȯ�ο��� ����� 7400~7500���̿� ������ ������ 2000�̸��̰ų� 3000�ʰ��ϴ� �����͸� list�ϼ���
/*
��¥�� ���� ó��
�Ի����� 1987/01/01���� 1987/12/31 ���̿� �ִ� �����͸� list�ϼ���.
*/
select * from EMP
where emp.hiredate between '1981/01/01' and '1981/12/31';

--Ȯ�ο���) �Ի����� 1981�� 12���� �Ի��� ����� �̸��� �μ���ȣ�� ����ϼ���
select * from emp
where emp.hiredate between '1981/12/01' and '1981/12/31';

-- sysdate : ���� ��¥�� ��� �ִ� ����
select ename, hiredate, sysdate
from emp;

/* in ������
 �ش� �����Ϳ� ���� ������ ó�� �� ��, ���� �����Ϳ� ���� ��ȸ�� �ϰ��� �� �� Ȱ��ȴ�.
 or�����ڿ� ������ ����
 ����) �÷��� in (�ش絥����1, �ش絥����2, �ش絥����3)
 */
 
 select * from emp;
 --������ ��ȣ�� 7902, 7566�ΰ��� list�ϼ���
 SELECT * FROM emp
 WHERE mgr IN (7902, 7566, 7839);
--  Ȯ�ο��� ��� �̸��� SMITH, WARD, JONES�� �����,
--  ������ 1000�̸��� �����͸� �̸��� ������ ����ϼ���
SELECT ename, sal from emp where ename IN ('SMITH','WARD','JONES') AND SAL<1000;

/*LIKE�����ڿ� ���ϵ� ī�� (%_)Ȱ���ϱ�.
Ư�������Ϳ� ���� ���ڿ� ��ü ������ ��Ȯ�ϰ� ���� ���Ҷ�,
 �˻������� ���� like�����ڿ� ���ϵ�ī�� Ȱ���ϴ� ����̴�..
 ����) �˻��÷��� like '%�˻��ҵ�����%'
 
 ex)����� K�� ���Ե� �����͸� list�ϼ���.
 */
 
 select*from EMP
 where ename like '%K%';
  select*from EMP
 where ename like 'K%';
 
 select job, ename, comm from emp where job like 'S%' and comm in(300,400,700);
 select * from em;
 
