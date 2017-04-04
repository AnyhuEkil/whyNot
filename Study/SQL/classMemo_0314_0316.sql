-- 0314~0316 SQL Class Memo

-- 	01. �⺻
		SELECT * FROM EMP;
-- 	02. ���̺��, �÷���, ???
-- 	03. �⺻����: +, -, *, /
-- 	04. ���ڿ� ����ó�� : || (javascript +�� ����)
-- 	05. nvl() : nulló�� ������?
		select nvl(comm,0) from emp;
-- 	06. �÷��� ��Ī: as �Ǵ� ����(' ')Ȱ��,
--		��Ī�� �ѱ��̳� ������ �������� ""(ū����ǥ)�� Ȱ��
-- 	07. �񱳿����� : = , >, <, >=, <=, <>,!=(�ٸ���)
-- 	08. �÷����� ��ҹ��� �������� ������, �����ʹ� ��ҹ��� �����Ѵ�.
--  00. + distinct : �ߺ��� ó�� 
		select distinct job, deptno from emp;
	-- 	09. OR������ : �����ϳ� ������ ����� ���
-- 	10. IN������ : IN(A, B, C) == A OR B OR C
--	11. NOT������ : �ƴҶ�,��� �ؼ��ϸ�ɵ�.
-- 	12. BETEWEEN AND ������: Ư�� ���� ������ ������ ���
		SELECT * FROM EMP WHERE SAL BETWEEN 3000 AND 4000;
-- 	13. like������ : ?
--	14. ���ϵ�ī��(%,_) :
		SELECT ENAME "13,14�� ��" FROM EMP WHERE ENAME LIKE '_A%';
-- 	15. ��������, �������� : OREDER BY �÷� ASC/DESC
--	 	�������� A~, 1~, �ð���~
		SELECT DEPTNO, SAL, ENAME FROM EMP ORDER BY DEPTNO ASC, SAL DESC;
-- 	16. DUAL : ������ �׽�Ʈ�� ���� ����Ŭ ���尴ü �������� ���
-- 	17. �����Լ�
/*		17-1: ABS	: ���밪
		17-2: CEIL	: �ø�
		17-3: ROUND	: �ݿø�,
			ROUND('������',-2) ==> 100���ڸ����� ǥ����
		17-4: TRUNC	: ����,
			TRUNC('������',-2) ==> 100���ڸ����� ǥ����
		17-5: FLOOR	: ����, �Ҽ��� �Ʒ� ����
		17-6: MOD('������',������)	: ������ �Լ�
*/
		SELECT 175.278, ROUND(175.278,-1) FROM DUAL;
		SELECT 175.278, TRUNC(175.278,-1) FROM DUAL;
-- 	18. ����ó�� �Լ�
/*		18-1:UPPER	: �빮��ó��
		18-2:LOWER	: �ҹ���ó��
		18-3:INITCAP: ù���� �빮�� ������ �ҹ��� ó��(���� ����)
		18-4:LENGTH	: �ѱۿ��� ������� ���ڿ� ����(�ѱ�1�ڷ��ν�)
		18-5:LENGTHB: Byteũ�� ���(�ѱ�2Byte)
		18-6:SUBSTR	: ������, 1����count�Ͽ� ������ ��ġ����, ������ ���ڿ��� ����
		18-7:SUBSTRB: ??? �ѱ۰� ���� ����..
*/
		SELECT LENGTH('a����Ŭ WhyNot?') "LENGTH",  			--'12'
				LENGTHB('a����Ŭ WhyNot?') "LENGTHB",			--'18'
				SUBSTR('a����Ŭ WhyNot?!',3,4) "SUBSTR",		--'��Ŭ W'
				SUBSTR('a����Ŭ WhyNot?!',4,4) "SUBSTR2",		--'Ŭ Wh'
				SUBSTRB('a��A��Ŭ WhyNot?!',1,9) "SUBSTRB",	--'a��A��'
				SUBSTRB('a��A��bcŬ WhyNot?!',4,6) "SUBSTRB",	--'A��b'
				SUBSTRB('a��A��bcŬ WhyNot?!',4,7) "SUBSTRB2"	--'A��bc'
		FROM DUAL;
-- 	19. INSTR(������,'�˻��ҹ���',������ġ,�˻���Ƚ��) : �˻��� ��ġ ��Ÿ��(���ڴ���)
		SELECT INSTR('W��w��WWŬ WhyNot:var1!','W',1,4) FROM DUAL;		
-- 	20. Ư�� �Լ�?�� ����Ҷ� ���� �ʾƵ� �ڵ����� �Ǵ� ����Ʈ���� �ִ�!!
--	21. LPAD(), RPAD() : ���ڿ��� ������� ä��
-- 			LPAD(������, ����ũ���, '�ݺ��ҹ��ڿ�')
		SELECT LPAD('Why Not',12,'Hi^^') FROM EMP; -- : Hi^^HWhy Not 
-- 	22.	MAX(������) : �ִ밪
-- 	23.	LTRIM(), RTRIM() : ������ ���ڸ� ������
-- 		LTRIM(������)
		SELECT LTRIM('     Why  Not!!      ') "DEL"FROM EMP;
-- 	24. TRIM() : ������ Ư�� ���ڿ��� ����
-- 		TRIM('�����ҹ��ڿ�' FROM '������')
		SELECT TRIM('W' FROM 'WWWhy  Not!WW') FROM EMP;
-- 	25.	SYSDATE : ����Ŭ ����� ���� ��¥�� �ð��� ����ϴ� ��ü.
-- 	26.	MONTHS_BETWEEN() : �� ��¥������ ������ ���
-- 		MONTHS_BETWEEN('������1','������2')
		SELECT MONTHS_BETWEEN('1988/03/27','1989/06/18') FROM DUAL;	
		-- '-14.71'
-- 	27.	ADD_MONTHS() : ������ �߰�
-- 		ADD_MONTHS('��¥������',�����߰�������)
-- 	28.	NEXT_DAY() : ���� ����� ��¥ ���
-- 		NEXT_DAY('��¥������', '����')
		SELECT SYSDATE, NEXT_DAY(SYSDATE,'ȭ����') FROM DUAL;
-- 	29.	LAST_DAY('��¥������') : �ش���� ������ ��¥�� ���
--  ����ȯ �Լ�
-- 	30.	TO_CHAR(������, '����') :��¥�� �������� ���������� ��ȯ
/*		30-1: ��¥,�ð���
			��¥ YYYY, YY, MM, DD, DAY(DY)
			����,���� AM(AM.), PM(PM.)
			�ð� HH(HH12), HH24, MI, SS
		30-2: ������
			0 : ���ڸ��� 0���� ä��
			9 : ���ڸ��� ��������� ä��
			L : ������ ���� ���� ǥ��($,����..)
			. : �Ҽ��� ǥ��(�������ڸ��� �ݿø�ó��)
			, : ,ǥ��
*/
-- 	31. TO_DATE(������, '����') : ���ڸ� ��¥�������ͷ� ��ȯ
--  32. TO_NUMBER(������, '����')
--  33. NVL(������,'��������')


select to_number('12345.1','9,999.9') calcu 
from dual;

SELECT substr(hiredate,1,length(hiredate)) FROM EMP;

