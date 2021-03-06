
CREATE SEQUENCE EMP_SEQ10
	START WITH 1000
	INCREMENT BY 1
	MAXVALUE 99999;

SELECT * FROM USER_SEQUENCES;

CREATE SEQUENCE TEST_01
	START WITH 1000
	INCREMENT BY 10
	MAXVALUE 1100
	MINVALUE 900
	CYCLE
	CACHE 10;

SELECT TEST_01.NEXTVAL FROM DUAL;

DROP SEQUENCE TEST_01;
SELECT TEST_01 FROM DUAL;

