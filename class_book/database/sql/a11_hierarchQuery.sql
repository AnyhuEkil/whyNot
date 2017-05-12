/*
	������ ����
	����Ŭ���� ������ ������ ���̺��� ȿ�������� �����ϱ� ���� ������ ���Ѵ�.
	(self join�� ȿ���� ó��)
	
	������ ����: ������ ���迡 ���̺� ������ ������ ���� ���Ѵ�.
	ex) �Ҿƹ���(id, parentId, role : 1, 0, '�Ҿƹ���)
	�ƹ���(2,1,'�ƹ���')		����(3,1,'����')
	�Ƶ�(4,2,'�Ƶ�')			���̵���(5,3,'����')
	
	������ sql����
	SELECT .. �÷�
	FROM ���̺��
	WHERE ����
	START WITH ���� (�񱳿����� EX)�÷�=������;
		 ����SQL�� �������� ó��-�ֻ��� ������ ����ó��.
			EX) ���������� �ֻ��� ������ parentId=0
			�츮������ ���� ������ ó���ϰ��� �� ��,
				parentId=2(�ƹ��� �������ķ� ��Ÿ��)
	CONNECT BY [NOCYCLE] ���� and ����
		���� ���踦 ��������ִ� ���ǿ� ���� ����.
		nocycle : �ݺ����ο� ���� ó��
			ex) CONNECT BY ID = parentId
			���� id���� Ȯ���ؼ� ������ �ִ� id���� �ִ��� ���� �����Ϳ� Ȯ���ؼ�
			���� ������ ��Ÿ���� �ϴ� ���� ���Ѵ�.
			prior:����-������ ���迡 ���� ó���ϰԵ�
*/

select * from emp;
SELECT EMPNO, MGR
FROM EMP
START WITH MGR IS NULL   --�ֻ��� ������ ������ mgr�� null�϶�
CONNECT BY PRIOR EMPNO = MGR;  -- �ֻ��÷��� ���� �÷��� ����ó��.

/*
Ȯ�ο��� family�� ���������� ����ϼ���
	������� : lever role(�������� ����ó��), �̸�
*/

SELECT LEVEL, LPAD(' ',4*(LEVEL-1)) || role01 role, name
FROM FAMILY
START WITH parentnumid=0
CONNECT BY PRIOR numid=parentnumid order by level;

INSERT INTO FAMILY VALUES(5,1,'ū�Ҿƹ���','ȫ����');
INSERT INTO FAMILY VALUES(6,0,'�����Ҿƹ���','ȫ���');

SELECT * FROM FAMILY;


/*BORD������ �Խ��� ���̺� ���� LIST�ϱ�
	����ID(�۹�ȣ), Ÿ��Ʋ, ����, �������, ��������, �ۼ���, ��ȸ��
	No,			Title,	Content, Credte, Uptdte, Writer, Readcnt

*/
CREATE TABLE BOARD(
No NUMBER PRIMARY KEY,
PARENTNO NUMBER,
Title VARCHAR2(50),
Content VARCHAR2(1000),
Credte DATE,
Uptdte DATE,
Writer VARCHAR2(50)
);
SELECT * FROM BOARD;
INSERT INTO BOARD VALUES(1, 0, '�� ��Ͻ���', '�ù�',SYSDATE,SYSDATE,'�۰�01');
INSERT INTO BOARD VALUES(2,0,'2��°�׿�^^','�ù�',SYSDATE,SYSDATE,'�۰�02');
-- ù��° �ۿ� ���� ���ó��
INSERT INTO BOARD VALUES(3,1,'1���ħ','�ù�',SYSDATE,SYSDATE,'ȫ����');
INSERT INTO BOARD VALUES(4,3,'��Ϥ�������','�ù�',SYSDATE,SYSDATE,'�۰�01');

 













