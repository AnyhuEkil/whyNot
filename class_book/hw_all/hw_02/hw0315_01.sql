select * from emp;

/*
	����1)
	sal�� �����̶�� �Ҷ�, �̴� �޿���(1/13)�� ó���Ͻÿ�. �� �̴��� ���ʽ��� �ִ� ���Դϴ�.
	��³��� : ���, ����, �̴ޱ޿�, ���ʽ�, �ѱ޿���(�޿���, �ѱ޿����� 10������ �ݿø� ó���Ѵ�.)
*/
select 
	empno "���",
	sal "����",
	round(sal/13,-1) "�̴ޱ޿�",
	nvl(comm,0)"���ʽ�",
	round(sal/13+nvl(comm,0),-1) "�ѱ޿���"
from EMP;


/*
	����2)
	sal�� �������� 
	1000�̸�		: 10% ���ʽ�
	~2000		: 20% 
	~3000		: 30%
	~4000		: 40%
	~5000		: 50%
	5000�̻�		: 60%
	�����ϱ�� �ߴ�. �Լ��� Ȱ���ؼ� �Ʒ������� ó���Ͻÿ�. 
	���, �̸�, ����, ���ʽ�(%), ���ʽ�
*/
select
	empno "���",
	ename "�̸�",
	sal "����",
	floor(sal/1000)*10+10 "���ʽ�(����1)",
	trunc(sal,-3)/100+10 "���ʽ�(����2)",
	ceil((sal+1)/1000)*10 "���ʽ�(�����ִ´�)"
from emp;


/*
	����3) ����� �μ��������� 1���� 2������ ����� ü����ȸ�� �ϱ�� �޴�.
	�μ���ȣ�� 10, 30 ==> 1��
			20, 40 ==> 2��
	���� ������ ������ ���� ����ϼ���.
	�μ���ȣ ��� �̸� ����
*/
select
	deptno "�μ���ȣ",
	ename "�����ȣ",
	ename "�̸�",
	(mod(deptno+10,20)/10)+1||'��' "����"
from emp;


/*
	���� 4)
	�Լ��� �̿��Ͽ� ���� ������ ����ϼ���..
	@@@�� �Ի��� @@�� @@�� @@�� �̸�, ���� ������ @@@���� �ް� �ֽ��ϴ�.
	column empinfo
*/
select
	ename||
	'�� �Ի��� 19'||
	substr(hiredate,1,2)||
	'�� '||
	substr(hiredate,4,2)||
	'�� '||
	substr(hiredate,7,2)||
	'�� �̸�, ���� ������ '||
	sal||
	'���� �ް� �ֽ��ϴ�.'
	"column",
	hiredate "empinfo"
from emp;



-- ���� �������� 1900��� �������� �� ���� �����ϱ� ���ؼ��� ���� �������� ��ȯ�̳�
-- �߰����� ������ �ʿ��غ���. �Է������� �����Ƿ�, �Ƹ� �Ұ��� �Ұ����� ����!!


/*
���� 5)
	substr�� Ȱ���Ͽ� JOB�� MAN���� ������ �����͸� ����ϼ���!!
	�߰�)%�� Ȱ���غ���~~
*/
select * from emp where substr(job,-3)='MAN';
SELECT * FROM EMP WHERE SUBSTR(JOB,LENGTH(JOB)-2)='MAN';
SELECT * FROM EMP WHERE SUBSTR('##'||JOB,LENGTH(JOB))='MAN';

/*
	���� 6)
	�Ի����� 12���� �����͸� �̸��� �Ի����� ����ϼ��� instr()�� Ȱ��
*/

select ename, hiredate
from emp
where instr(substr(hiredate,4,2),'12')=1;
select
	ename "�̸�",hiredate "�Ի���"
from emp
where instr(TO_CHAR(hiredate,'MM'),'12',1, 1)=1;

/*
	����7)
	�Ի����� 10���� �����͸� �̸��� �Ի����� ����ϼ��� instr()�� Ȱ��
*/
SELECT ENAME "�̸�", HIREDATE "�Ի���"
FROM HIREDATE
WHERE instr(TO_CHAR(hiredate,'MM'),'12',1, 1)
