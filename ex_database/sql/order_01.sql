

-- 	0316 ORDER
	
-- ���� ä���
	select lpad('himan', 7, '#') from dual;
	select rpad('good job', 20, '@') from dual;
-- ����� �����
	select ltrim('      GOOD JOB!!!     GOOD!! JOB!'   ) from dual;
	select rtrim('      GOOD JOB!!!     GOOD!! JOB!'   ) from dual;
--Ư�� ���� �����
	SELECT TRIM('A' FROM ENAME) FROM EMP;
-- 	����Ŭ ����� ���� ��¥�� �ð�
	SELECT SYSDATE FROM DUAL; 
-- �ΰ��� ��¥ ������ ������ ���� ���� ���ϴ� ����..
	SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))	FROM EMP; --???
	SELECT MONTHS_BETWEEN(SYSDATE, HIREDATE) FROM EMP;
-- Ư�� �Ⱓ�� ���� ���ϴ� �Լ�
	SELECT HIREDATE, ADD_MONTHS(HIREDATE, 6) FROM EMP;
--���� ���������� ��¥ Ȯ��
	SELECT SYSDATE, NEXT_DAY(SYSDATE, '������') FROM DUAL;
--�ش���� ������ ��¥
	SELECT LAST_DAY(SYSDATE) FROM DUAL;
	SELECT LAST_DAY(SYSDATE)+1 FROM DUAL;
/*	����ȯ�Լ�
	TO_CHAR(��¥������, 'ǥ���� ��������') : 
	TO_DATE() : �������� ��¥������ ��ȯ
	TO_NUMBER() : �������� ���ڷ� ��ȯ
	
	�� ���¿� ���� ���� ���ǳ��� Ȯ��
*/


/* DECODE
	���ǿ� ���� ����� ����,
	�Լ� ���� :
*/
SELECT DECODE(job, 'CLERK','����',
	'SALESMAN','������',
	'���') FROM EMP;
 /*
 
	
	