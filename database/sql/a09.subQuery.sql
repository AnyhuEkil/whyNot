/* subquery?
	�ϳ��� select������ �� �ȿ� ���Ե� �� �ϳ��� select ������ ���Ѵ�.
	���������� �����ϰ� �ִ� �������� ��������, ���Ե� �� �ϳ��� ������ ����������� �Ѵ�.
	ex) ��� ���̺��� ������ �ְ�� ���� ����� �̸��� ������ list�ϼ���.
*/
 /* �������� */	SELECT ENAME, SAL       
				FROM EMP
 /* ��������*/	WHERE SAL = (SELECT MAX(SAL) FROM EMP );

/* �ۼ��� ������ 
1. ���������� �񱳿�����(=,>,<...)�� �����ʿ� ����ؾ� �ϰ� ��ȣ�� �ѷ��� �ִ� ���� �Ϲ����̴�.
2. ���������� ���� ������ ����Ǳ� ������ ����ȴ�.

	���� ������ ����
1. ������ ������ ó���Ǵ� ���.
	SELECT *
	FROM ���̺� 
	WHERE �÷��� = (SELECT �÷� FROM ���̺� WHERE ����);
	## ���ϰ� ����: =,>,<,(�񱳿����� Ȱ��)
		���߰� ����: IN, EXIST, ANY, ALL
2. ���̺� ���ɷ� SUBQUERY ó���ϴ� ���..
	SELECT �÷���1+�÷���2...
	FROM ( SELECT �÷���1, �÷���2, �Լ�(�÷���3) FROM (���̺��) WHERE ����)
	WHERE ����..
3. SELECT (SELECT �÷�1 FROM ���̺�� WHERE ���� = ��������1),
	�÷�2, �÷�3
*/
	select max(comm)
	FROM EMP;
-- 	EX ���ʽ��� �ִ� ������� ��� ���ʽ� ���� ���� ��� �ϼ���.
	SELECT AVG(COMM)
	FROM EMP
	WHERE COMM IS NOT NULL;
-- 	EX �������, ��� ���ʽ� ���� ���� ��� �ϼ���..
	SELECT AVG(NVL(COMM,0))
	FROM EMP;
--  Ȯ�ο���
-- 	1. �μ���ȣ�� ���� ���� ����� �̸��� �μ��� ��� �ϼ���.
	SELECT ENAME, DEPTNO
	FROM EMP
	WHERE DEPTNO = (SELECT MAX(DEPTNO) FROM EMP);
-- 	2. ���� �ֱٿ� �Ի��� ����� �̸��� ��å, �Ի����� ����ϼ���.
	SELECT ENAME, JOB, HIREDATE
	FROM EMP
	WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
--  SUBQUERY�� ������� 2�� �̻��� ���..
--	 EX) �μ����� �Ի����� �ְ��� ������� �̸��� �Ի����� ����ϼ���.
	SELECT DEPTNO, MAX(HIREDATE)
	FROM EMP
	GROUP BY DEPTNO;
-- 	1)�������ǿ� ���� ó��..
	SELECT*
	FROM EMP
	WHERE DEPTNO IN (10,20);
	
-- 	WHERE EXISTS(SUBQUERY)
-- 	�ش� SUBQUERY�� �����Ͱ� �ִ��� ���θ� üũ�ؼ� ���� sql�� ó���ϰ��� �Ҷ� Ȱ��
-- 	EX)�μ���ȣ�� 30�� �����Ͱ� ������ ��ü ��� ���̺��� LIST�ϼ���..
	
	SELECT * FROM EMP
	WHERE EXISTS(SELECT * FROM EMP WHERE DEPTNO=30);	
	
	CREATE TABLE EMP001
	AS
	SELECT EMPNO NO, ENAME NAME, SAL SALART, DNAME
	FROM EMP A, DEPT B
	WHERE A.DEPTNO=B.DEPTNO
	AND SAL>=2000;
	
	SELECT EMPNO NO, ENAME NAME, SAL SALART, DNAME
	FROM EMP A, DEPT B
	WHERE A.DEPTNO=B.DEPTNO
	AND SAL>=2000;
	
	SELECT * FROM EMP001;
	
	/*Ȯ�ο���
	������ ���� �ű� ���̺��� �����ϼ���..
	������ 1000�̻�Ǵ� �����͸� �����(NAME) �μ���ȣ(PARTNO), ����(SALARY), �޿����(GRADE)
	�ε�, EMPGRADE���̺��� �����ϼ���*/
	SELECT ENAME NAME, DEPTNO PARTNO, SAL SALARY, GRADE FROM EMP, SALGRADE
	WHERE SAL BETWEEN H
	AND SAL >= 1000;
	
	SELECT * FROM SALGRADE;
	
	
	
	/*
	��������
	������ ���� ������ ���̺��� �����ϼ���.
	�̸�(NAME) ��ȣ(NO) �Ի���(CREADATE)-���ڿ�      ���ر��رٹ�����(WORKYEARS)
					  @@@@�� @@@�� @@@��		 @@@@
	NEW_EMP�� �����ϼ���.
	*/
	
	
