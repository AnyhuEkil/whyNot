/*
�������� ��� DML query!!
	1. �������̺� ������ �Է��ϱ�..
		insert ������ ������ �Ἥ �����͸� �Է��ϴ� ��찡 ���� �����͸� �Է��Ҷ� ���ŷ��� ��찡 �յ�.
		�ѹ��� suberquery�� ���ؼ� ���� ������ ������ ���̺� �Է��Ҷ�, insert all ������ Ȱ���ϸ� �ս��� ó���� �� �ִ�.
	1) ����
	INSERT ALL
	INTO ���̺�1�� VALUES (�÷�1, �÷�2, �÷�3)
	INTO ���̺�2�� VALUES (�÷�1, �÷�2, �÷�4)
	SELECT �÷�1, �÷�2, �÷�3, �÷�4
	FROM ���̺��
	WHEWE ����
	
	EX) EMP���̺��� ���� �������̺� 
			EMP_HIR(EMPNO, ENAME, HIREDATE)
			EMP_MGR(EMPNO, ENAME, MGR)
		���� EMP���̺��� �μ���ȣ�� 20�� �����͸� �ش� ���̺�
		������ �Է�ó��...
				
*/

CREATE TABLE EMP_HIR
AS SELECT EMPNO, ENAME, HIREDATE
FROM EMP WHERE 1=0;
SELECT * FROM EMP_HIR;