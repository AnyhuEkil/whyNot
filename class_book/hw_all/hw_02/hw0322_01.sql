-- Ȯ�ο���
-- 1. JOB(��å��)�� ���� ���� ������ �޴� ����� �̸�, ��å, ������ ����ϼ���..
-- ����(��������)
-- 1. �Ի��� �б⺰�� ���� ���� ������ �޴� ����� ����ϼ���.
	 SELECT TRUNC(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4) SESONHI , ENAME, SAL
	 FROM EMP
	 WHERE (SELECT MAX(SAL) FROM EMP)
	 GROUP BY SESONHI ;
	
	 
-- 2. ������ 3000�� ��� �߿�, ���(���̺�Ȱ�뵵 ����)�� �����
-- 	�ش� ��޺�  V�ְ� ������ �޴� ����� �̸�, ���, ������ ����ϼ���.

  
  
    SELECT TRUNC(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4,)+1 SESONHI , ENAME, SAL
    FROM EMP
    WHERE SAL = (SELECT MAX(SAL) FROM EMP)
    GROUP BY TRUNC(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4,)+1;
	
	SELECT TRUNC(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4)+1 FROM EMP;
	
	
-- 	Ȯ�ο���
-- 	1. ������ 3000�̸��� ����߿�, �ֱٿ� �Ի��� ����� �����ȣ�� ���� �Ի����� ����ϼ���.
	SELECT EMPNO, SAL, HIREDATE
	FROM EMP
	WHERE HIREDATE >=
	ALL(SELECT HIREDATE FROM EMP WHERE SAL <3000);
	
	
-- 	����3.
--  1. �μ���ȣ�� 30�� ����߿�, ���� ���߿� �Ի��� ������� ������ ������ ����ϼ���.
--  2. ������ SALESMAN�� ����� �޴� �޿����� �ּ� �޿����� ���� �޴� ������� �̸��� �޿��� ����ϵ� �μ���ȣ 20����
-- 		����� �����Ѵ�.(ANY������ �̿�)


select ename, sal from emp
      where (sal,floor(to_number(to_char(hiredate,'mm'))/4 + 1)) in (select max(sal), floor(to_number(to_char(hiredate,'mm'))/4 + 1) 
                  from emp
                  group by floor(to_number(to_char(hiredate,'mm'))/4 + 1)
   );













