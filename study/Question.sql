/*
	Question

00. �� �κ� ��Ī ex)�÷� ���̺� ��..
01. ���� = ���� (*)�� �ǹ� �ϴ°���?
02. �÷����� ��ҹ��� ����X, �����ʹ� ��ҹ��� ����. �׷� ������??����?
03. sql�� �빮�ڷ� �ۼ��ϴ°��� ������??(������ ���Ŀ� ���� ����)
04. select * from EMP
	where EMP.HIREDATE
	between '1981/12/01' and '1981/12/31';
	�� ����� �Դ� ������?? ��¥�� ���� 81/12/01 �̷������� �Ǿ����� �ʾҳ�? Q10����.
05. LIKE�����ڸ� �ܵ����� ���� �ִ°�?
06. DUAL�� ���ٷθ� ��µǳ�?
07. INITCAP�� ����Ҷ�, �����;ȿ� ���⸦ �����ϸ� ��� �Ǵ°�?
	ex) 'hello? my name is whyNOT' ��ü�� ������ �� ĭ�϶�.
08. '����Ŭ WhyNot'�� ���ڿ� ������?
09. �Ʒ����� 'a��A��B'���?==> ,1,9?? // 'A��B'�� ���?==> ,4,6??
	SELECT SUBSTRB('a��A��BCŬ WhyNot?!',1,1) "SUBSTRB" FROM DUAL;
10. substr(hiredate,1,length(hiredate)) �� �̿��ϸ� �÷���ü�� �ҷ������ִ�?!
11. SUBSTR(ENAME, -2, 3) ������ ��ġ�� ������ ���� �ڿ������Ͷ�� ���̵ȴ�!
12. TRIM�� �� �ѱ��ڸ� �Ǵ°�?
13. NEXT_DAY�� ���ϸ���� �ȵǴ°�?
14. HIREDATE�� � ������ �������ΰ�?? 
15. LENGTH(to_char(8080,'99000000')) ���ΰ�??
16. �� �̰Ƕ� 19##/##/##�������� ����ϴ°�??
	select * from emp
	where hiredate=to_date('1980/12/17','YYYY/MM/DD');
17. demo�� emp�� ���̴�??
18. TO_NUMBER�� �꿡����..
		ex) ���������� ,�� ������ �ʾƵ� �˾Ƽ� ����.
			�������� ,�� ������, �������� ,ǥ���ϸ� ��� �ȵ�. ���
		���� ���غ��ߵ�!!
19. TO_NUMBER�� ������ �� �Ҽ��� 2��° �ڸ������� �Ǵ°�?
	
	
	
*/


SELECT * FROM EMP;





/*
����
	�ٹ��������� ���� ���� ���ʽ� ����
	���� ������ ����~���� �ֱٿ� �Ի��� ������
	1/3 = 30%, 1/3 = 20%, 1/3 = 10% (��������)
	���, �Ի���, ���糯¥(@@/@@/@@ AM @@�� @@�� @@ ��), �ٹ�������, ���ʽ�
*/	

SELECT MONTHS_BETWEEN(SYSDATE, HIREDATE) 
FROM EMP ORDER BY MONTHS_BETWEEN(SYSDATE, HIREDATE) DESC;

SELECT MOD(MONTHS_BETWEEN(HIREDATE, ),��ü�����ͼ�/3)+1)*0.1||'%' FROM EMP;
	SELECT substr(hiredate,1,length(hiredate)) FROM EMP;
	SELECT mod((HIREDATE ORDER by asc),()/3)*3 FROM EMP;
	


	 
	
	
	
	
	