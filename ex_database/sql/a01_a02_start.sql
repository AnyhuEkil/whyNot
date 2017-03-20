select * from emp order by empno;
-- �ּ�����Ű
-- �ȳ��ϼ���
-- �ּ����Դϴ�.
-- select : Ư�� ���̺��� �÷����� �����ϴ� ��ɾ�.
-- 1) * : ��ü �÷��� ������ ������ list �Ҷ�.
-- 2) �÷��� : �ش� �����͸� ���� ���� ��ɾ�
-- 3) from ���̺�� : ���̺��� list �ϱ� ���Ͽ�.
select * from emp; -- emp�� ���̺��� ��ü �÷� ������ list �ϼ���.
select empno, job from emp; -- emp���̺��� �÷� �߿� empno, job�� list
select deptno, ename, sal from emp;
-- empno: emp number, ename: emp name, job: job title, mgr: manager's number, etc.
-- P1 print data of (empno, job and deptno)
select empno, job, deptno from emp; 

-- ��� ������.
-- �����ͺ��̽��� �÷������� ������ ó�� �� �� �ִ�.
-- ��Ģ������ �����ϸ� %������ �������� �ʴ´�.
select ename, sal, sal+100, sal-10, sal*10, sal/10 from emp;
-- �÷����� ����ó�� : �÷���1 + �÷���2
select empno, sal, deptno, sal + deptno from emp;

-- P1 ������ ���� �������� ������� 10% �ö���.
-- �����, ��������, �λ��, ����� ���������� ����ϼ���/
select ename, sal, sal/10 as inc  , sal+sal/10 as total from emp;

select * from emp;
-- P2 �μ����� �����λ���� �ٸ��� å��.
-- �μ���ȣ 10 ==> 10%, 20 ==> 20%, 30 ==> 30%
-- �̸�, �μ���ȣ, ����, �λ�� ����
select ename, deptno, sal, sal*(deptno*0.01)+sal as sal_after from emp;

-- ���ڿ��� ǥ��+?
-- database ���ڿ� ����ó���� '||'�� Ȱ���Ѵ�.
select '����� �̸���'||ename||'�̰�, �μ���ȣ�� '||deptno||' �Դϴ�..' from emp;
select * from emp;
-- Ȯ�� ���� �����ȣ�� @@@�� @@@@�� ���� ������ @@@@ �Դϴ�.!! -- ��� listó��
select '�����ȣ�� ' ||empno|| '�� ' ||ename||'��(��) ���� ������ '||sal||'���� �Դϴ�.' from emp;

-- nvl()
-- null : �����ͺ��̽����� �����Ͱ� ���� ���� null���̶�� �Ѵ�. ����('')�� �ƴϸ� 0�� �ƴ�
-- ���״�� �����Ͱ� �ԷµǾ� ���� �ʴ� ���� ���Ѵ�.
-- ���α׷����� ���̴� �ʱⰪ�� �����ؼ� �˰� �־�� �Ѵ�.
-- ����: ȭ��� ������ ���� null�� ǥ�õǰų�, nullpointerException�̶�� ������ �߻��Ѵ�.
-- ����, ������ Į������ ���굵 ���������� ���� �ʴ´�.

select sal, sal+null from emp;
-- �׷��� �����ͺ��̽������� null�� ���� ������ �������� ó���� ���� �Լ��� ���� Ȱ���Ѵ�.
-- nvl�� Ȱ���ϸ� null ���� ��, �ʱⰪ�� ���� ���Ǹ� �ؼ� ���� ó���� �����ϰ� �Ѵ�.
select ename, sal, nvl(comm, 0) from emp;

/*
����
�Ʒ��� �������� �����͸� ��Ÿ������..
1. ename�� ���� ������ @@@���� �ε�, �ֱٵ� 5%�λ�� �ݾ��̸�, �۳� ������ @@�����̾����ϴ�.
2. ename�� �Ի����� hiredate �Դϴ�.
3. ��å�� @@@�� @@@�� �μ���ȣ�� @@@�Դϴ�.
4. @@@���� ���� ������ ���ʽ�(comm)�� �ջ���� @@@�Դϴ�.
*/
-- 0. �⺻ select ��
select * from emp;
-- 1. ename�� ���� ������ @@@���� �ε�, �ֱٵ� 5%�λ�� �ݾ��̸�, �۳� ������ @@�����̾����ϴ�.
select ename||'�� ���� ������'||(sal+sal*0.05)||'���� �ε�, �ֱٿ� 5% �λ�� �ݾ��̸�, �۳� ������ '||sal||'�����̾����ϴ�.' from emp;
-- 2. ename�� �Ի����� hiredate �Դϴ�.
select ename||'�� �Ի����� '||hiredate||' �Դϴ�.' from emp;
-- 3. ��å�� @@@�� @@@�� �μ���ȣ�� @@@�Դϴ�.
select '��å�� '||job||'�� '||ename||'��(��) �μ���ȣ�� '||empno||'�Դϴ�.' from emp;
-- 4. @@@���� ���� ������ ���ʽ�(comm)�� �ջ���� @@@�Դϴ�.
select ename||'���� ���� ����('||sal||')�� ���ʽ�('||nvl(comm,0)||')�� �ջ���� '||(sal+nvl(comm,0))||'�Դϴ�.' from emp; 

-- �̱����� a01�����Դϴ� ���������������������������������������������������������������������������������������������������� 
-- �̱����� a01�����Դϴ� ���������������������������������������������������������������������������������������������������� 
-- �̱����� a01�����Դϴ� ���������������������������������������������������������������������������������������������������� 



-- empno�� ��Ī���� companyNo�� ����� �ߴ�. ����ϼ���.
select empno as companyNo from emp;
-- ��Ī�� ���α׷� �������� �߿��� �ǹ̸� ������.
-- ��ټ� ���α׷��� ��Ī���� �����ϰ� ����ϴ� ��찡 ����.
-- ex) rs.getString("��Ī/�÷���")
-- as ��ſ� ����(' ')���� ó���Ѵ�.
select '�����'||empno||' �Դϴ�.' show from emp;
-- ������ ������ ����� �÷����� ��Ÿ������.
-- �÷���		depandname	upgradeRatio 	enterCompany
-- ��µ����� 	(�μ���ȣ)�̸�	������ 10%			�Ի�����
select '('||deptno||')'||ename depandname, sal*0.1 upgradeRatio,
 hiredate enterCompany from emp;
-- ���鰪�� ��Ī���� ó���ϱ�..: " "���̿� ��Ī���� �����ش�.
select ename "name intro" from emp;
-- �ѱ��� ��Ī���� ó���� ����,
select deptno "�μ���ȣ" from emp;
----
select * from emp;
-- �ߺ��� ó�� : �����ͺ��̽������� ������ ���� �Է��ϴ� ���� ���̺� ������
-- �Է��ϴ� ���� �����Ѵ�.
-- �÷��� �ִ� ��� �����Ͱ� �����ؼ��� �ȵȴٴ� ���̴�.
-- �׷���, �Ѱ� �÷����� ��ȸ�� ���� ������ �����Ͱ� ��Ÿ�� �� �ִ�.
select deptno from emp;
-- �϶�, �ϳ� �Ǵ� �ټ��� �÷��� �����Ͱ� ������ ���� filtering ���ִ� ó����
-- �ִµ� �̸� distinct��� �Ѵ�.
-- Ȱ������ select distinct �÷�1, �÷�2.. from���̺�
select distinct deptno from emp;
select*from emp;
/* Ȯ�ο���
 1) -mgr�� ���ϰ� ���� ����ϼ���.
 2) job�� mgr �÷��� ���ϰ� ���� ����ϼ���.
 */
select distinct mgr from emp;
select distinct job from emp;
select distinct job, mgr from emp;
select mgr, job from emp;
select mgr from emp;
select job from emp;
/*
����ó��..
Ư���� ������ list���뿡�� �ʿ��� �������� ������� filtering�ϴ� ���� ���Ѵ�.
1. ����ó��
*/

/* ������ 3000�̻��� �������͸� list ó��
where �÷���> ���� ������ */
select * from emp
 where sal >= 3000;
-- �����ͺ��̽����� ���̴� �񱳿�����
-- = (*), >, <, >=, <=,     <>,!(�ٸ���)
select*from emp;
-- 1) �μ���ȣ 30�� �����͸� list�ϼ���..
-- 2) ������ 1000�̸��� ������
-- 3) ename�� SMITH�� ������
-- 4) COMM�� NULL�� ������(*) - ���ݱ��� ��� �Լ�Ȱ��
select*from emp where nvl(comm,0)=0;
select*from emp where comm is null;
select*from emp where comm is not null;
-- 5) MGR�� 7698�� �ƴ� ������
select * from emp where mgr != 7698;
-- ���� ���� �ΰ��� ������ ���� ������ list�ϱ�..
-- ���� multi ���ǿ� ���� ó��..
select*from emp;
-- ������ 3000�̻��� ����� �̸��� ������ list
select ename, sal
from emp
where sal>=3000;
select * from emp;
-- ������ 2000 �����̰� ��å�� SALESMAN�� ����� �̸� ��å ������ ���
select ename "�̸�", job "��å",sal "����"
from emp
where sal<=2000
and job='SALESMAN';

/*
 1 EMP�߿� �޿��� 2000�̸��� �Ǵ� ��� �����߿� ����� �޿��� ����϶�.
 ������ ���ʽ��� �ջ� �ݾ��� 1500�̸��� ����� �̸�, ���� ���ʽ� �ջ���� ����ϼ���.
 MGR�� NULL�� ����� JOB�� �̸� ������ ����ϼ���.
 JOB�� CLERK�� ����߿� DEPTNO�� 30�� ����� �̸�, ��å �μ���ȣ�� ����ϼ���.
*/


























