
/*
0316
1. �ð������Լ� SYSDATE �ڿ� �ð� ������ �ڸ��� ���?
2. ����ȯ�� �ϰ� ����, �� ����ȯ ���� ���´� ������� ���ϴ°�?
	EX) SYSDATE���� YY,MM,DY�����͸� ���� �������� YY/MM/DY��� ǥ���� �� �ٽ� ��¥�����ͷ� ��ȯ�� �����Ѱ�?
3. ADD_MONTHS�� ����Ҷ�, 1�� 31�Ͽ� +1�ϸ� ��� �ǳ�??
4. trim�� ��Ȯ�� ����? �� 1�ܾ�� �Ǵµ� 2���̻�ȵǴ°�??
5. 



*/
SELECT HIREDATE, LAST_DAY(ADD_MONTHS(HIREDATE-20, 0))+20 ,ADD_MONTHS(LAST_DAY(HIREDATE-20), 0)+20 FROM EMP;
SELECT HIREDATE-2 FROM EMP;
