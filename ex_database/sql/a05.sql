
select lpad('himan', 7, '#') from dual;

-- �ǹ� migration varchar: ����������, char:����������
-- ������������ �����͸� ���� ���������� ��ȯ�Ͽ� �̵���ų�� Ȱ��

select rpad('good job', 20, '@') from dual;

select
	ltrim('      GOOD JOB!!!     GOOD!! JOB!    ') showData,
	length('      GOOD JOB!!!     GOOD!! JOB!    ') beforeLen,
	length(ltrim('      GOOD JOB!!!     GOOD!! JOB!    ')) afterLen
from dual;


select
	rtrim('      GOOD JOB!!!     GOOD!! JOB!    ') showData,
	length('      GOOD JOB!!!     GOOD!! JOB!    ') beforeLen,
	length(rtrim('      GOOD JOB!!!     GOOD!! JOB!    ')) afterLen
from dual;
select * from emp;

select trim('a' from 'aaaaaaase    GOOD JOB!!!     GOOD!! JOB!'   ) "����" from dual;

SELECT ENAME, HIREDATE, SYSDATE, (SYSDATE - HIREDATE) FROM EMP;

SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) "DLFEKS" FROM EMP;

SELECT HIREDATE, ADD_MONTHS(HIREDATE, 1) FROM EMP;
/*
NEXT_DAY : �ְ������� ���� ����� ��¥�� ������ ��, Ȱ��..
*/
	SELECT LAST_DAY(SYSDATE) FROM DUAL;
	SELECT LAST_DAY(SYSDATE)+1 FROM DUAL;
	
	
/* �޿����,, 3�ܰ� �޿����� ����� ����ϼ���.
1�ܰ� ��� 20��
2�ܰ� ��� ��������
3�ܰ� ������ 10��
��� �Ի��� ù ����1 ù����2 ù����3
*/

SELECT ADD_MONTHS(LAST_DAY(HIREDATE),-1)+20 FROM EMP;
/*
SELECT 
	ENAME "���",
	HIREDATE "�Ի���",
	SUBSTR(ADD_MONTHS(LAST_DAY(HIREDATE, -1))||'��'
	||�� �̾Ƴ��� �Լ�(LAST_DAY(SYSDATE)+20)'��',
	LAST_DAY(SYSDATE) "2",
	LAST_DAY(SYSDATE)+10 "3",
FROM EMP;
*/

SELECT
	ENAME,
	TO_CHAR(HIREDATE, 'YYYY-MM.DD') "a",
	TO_CHAR(HIREDATE, 'YY/MM-DD') "b",
	TO_CHAR(HIREDATE, 'YY"�� "MM"�� "DD"��"') "c"
FROM EMP;
	
		SELECT 
	TO_DATE(
		TO_CHAR(ADD_MONTHS(SYSDATE,-1), 'MM"/"')
		TO_CHAR(LAST_DAY(SYSDATE)+20
	)


