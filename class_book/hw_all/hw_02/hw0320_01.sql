/*
	hw0320
*/

/* Ȯ�ο���1
	emp01�̶�� �������̺� �����
	1) empno�� ���� ���� ��ȣ���� +1�ؼ�, ename�� job, sal�� �Է��ϼ���.
	2) �׿ܿ� �÷� mrg, hiredate(sysdate-���糯¥�� ����), daptno�� 40���� ����ó���ϼ���.
*/
select * from emp;

create table emp01 as select * from emp;
select * from emp01;

select max(empno)+1 from emp01;
-- 7935
insert into emp01(empno, ename, job, sal) values (7935,'�������','û�Һ�',44444); 
select * from emp01;

/* ����1
	emp03���� ����
	1. �Է� empno�� ���� ���� ������ -1, mgr:cleark�� mgr�Է�, sal:��տ���, comm:��ücomm�� �հ�
	2. ���� ename:'�ű浿', job�� SUPERMAN, hiredate�� �ֱٿ� �Ի��� +1
*/



/* Ȯ�ο���
	dept01���̺� deptno�� 50�̻��� �����͸� ��� �����ϼ���..
	emp01���̺� comm�� null�̰�, deptno�� 20�� �����͸� �����ϼ���.


*/

/* Ȯ�ο���
	dept01�� dept10Exp��� ���̺������ �����ϰ�, �÷��� loc�� location���� �����Ͻÿ�. ũ��� 13-25��
*/


select*from emp;


/* ����2
����Ű ������ �ִ� ���̺� �����ϱ�
�������̺� student_main(id, pass, name) : ���̵�, �н�����, �̸�
�������̺� student_point(id, subject); ���̵�, ����, ����
	student_main�� student_point id�� foreign key ���踦 �����ϰ�,
	student_main�� �����Ͱ� �־�߸� student_point�� �Է��� �� �ְԲ� ó��

*/



















