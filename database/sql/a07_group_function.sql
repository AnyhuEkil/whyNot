select * from emp;
/*
�׷��Լ�: �����͸� �׷캰�� ���ġ�� ó���� �� Ȱ��ȴ�.
sum() : ���ջ�.
/*
       ����
         ������������ �ο��� üũ
         ����            ����� (�ְ�ġ, ����ġ, ���ġ)
         1000�̸�:       @@
         ~2000�̸�:      @@
         ~3000�̸�:      @@
         ~4000�̸�:      @@
         ~5000�̸�:      @@
         ~6000�̸�:      @@
	*/	 

SELECT TRUNC(SAL,-3)+1000||'�̸�: ', COUNT(TRUNC(SAL,-3)) FROM EMP
GROUP BY TRUNC(SAL,-3)
ORDER BY TRUNC(SAL,-3) DESC;	

SELECT TRUNC(SAL,-3), COUNT(SAL), MAX(SAL), AVG(SAL), MIN(SAL) FROM EMP
GROUP BY TRUNC(SAL,-3)
ORDER BY TRUNC(SAL,-3) DESC;


-- ���� �ϵ�..
SELECT TRUNC(SAL,-3)+1000||'�̸�:' "����", COUNT(SAL), MAX(SAL), AVG(SAL), MIN(SAL) FROM EMP
GROUP BY TRUNC(SAL,-3)
ORDER BY TRUNC(SAL,-3) ASC;



SELECT * FROM EMP
WHERE SAL <3000 AND SAL >=2000;


	




SELECT ENAME, LOC 
FROM EMP, DEPT
WHERE EMP.DEPTNO = EMP.DEPTNO;



SELECT * FROM DEPT;
SELECT DISTINCT DEPTNO FROM EMP;



SELECT D.DEPTNO, D.DNAME, NVL(E.ENAME,'�ο�����') ENAME
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY E.DEPTNO;




SELECT * FROM EMP;
SELECT * FROM EMP WHERE JOB='MANAGER';


SELECT WORK.ENAME, WORK.MGR, MANAGER.ENAME
FROM EMP WORK, EMP MANAGER
WHERE WORK.MGR=MANAGER.EMPNO
ORDER BY MANAGER.EMPNO;



