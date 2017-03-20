

/* 3월 16일 */

/* 
	확인1)
		ename과 job을 크기와 지정된 문자열만큼 오른쪽과 왼쪽에 해당 문자열을 아래형식으로 넣으세요..
		1. ename과 job에서 데이터 크기를 확인한다.
		2. 데이터중에 가장큰 데이터의 크기를 확인해서.
		3. ename에는 오른쪽에 @, job에는 왼쪽에 ^을 추가해서 나타나게 한다.
		4. 출력 : 사원번호, 이름(r@), 직책(l^) 입사일
*/

select
	empno "사원번호",
	ename "이름(r@)",
	job "직책(l^)",
	hiredate "입사일"
from emp;




/*
	확인2) END
		JOB에 'MAN'이나 'ER' 'ST가 있으면 삭제된 내용으로 다음과 같이 출력하세요.
		이름 직책
변경	>>	JOB에 N,T,R 가 있으면 삭제된 내용으로 출력!!
*/

SELECT
	TRIM('N' FROM (TRIM('T' FROM TRIM('R' FROM JOB)))) "직책"
FROM EMP;

select job,
	trim('st' from job)
from emp;


/*
	숙제1)
		6개월의 인턴기간에는 급여의 70%만 지급하기로 했다.
		사원의 인턴기간 만료시점을 출력하고, 6개월간의 급여의 총합을 계산하세요.
		
		사원번호, 사원명, 입사일, 인턴기간만료시점, 인턴기간총급여(10단위 절삭)
*/
SELECT
		EMPNO "사원번호",
		ENAME "사원명",
		HIREDATE "입사일",
		ADD_MONTHS(HIREDATE, 6) "인턴만료",
		SAL/13*0.7*6 "인턴총급여"
FROM EMP;


/*	숙제2)
	급여계산,, 3단계 급여일을 나누어서 출력하세요.
		1단계 당월 20일
		2단계 당월 마지막날
		3단계 다음달 10일
		사원 입사일 첫 월급1 첫월급2 첫월급3

		
*/
SELECT
	ENAME "사원",
	HIREDATE "입사일",
	LAST_DAY(ADD_MONTHS(HIREDATE-20, 0))+20 "첫월급1",
	LAST_DAY(HIREDATE) "첫월급2",
	LAST_DAY(HIREDATE)+10 "첫월급3"	
FROM EMP;




/*	
	확인3)
	[사원이름]은 @@년 @@월 @@일에 급여를 @@@만원 받기로 하고 입사하였습니다.
*/
SELECT
	'['||
	ENAME||
	']은 '||
	TO_CHAR(HIREDATE, 'YY"년 "MM"월 "DY"일"')||
	'에 급여를 '||
	SAL||
	'만원 받기로 하고 입사하였습니다.'
FROM EMP;


/*
	숙제3)
	근무개월수에 따른 차등 보너스 지급
	가장 오래된 개월~가장최근에 입사한 개월수
	1/3 = 30%, 1/3 =20%, 1/3= 10% (연봉기준)
	사원, 입사일, 현재날짜(@@/@@/@@/ AM @@시 @@QNS @@초), 근무개월수,
*/
/*
(절삭처리:버림(
	입사순서/((총인원)/3)
)*0.3*SAL 절삭처리

근무개월수,(입사일-현재날짜)개월수 처리
*/

/*
	숙제4)
	조회값이 1981년 1월 1일부터 1982년 12월 12일 사이의 데이터중, 부서가 30인 데이터를 조회하여,
list형식
	사원명(10자리-앞에 #기호처리)
	직책(10자리-나머지뒤에 '-'처리)
	입사일(@@년 @@월 @@일 @요일 24시 @@분 @@초)
	연봉( ####1,600.0 표시)로 나타내세요..
*/


/*
	숙제5)
	이름 관리자 번호 보너스
	==> 데이터가 없을때는 관리자번호경우 '최고레벨' 보너스는 0표시
*/

/*
	숙제6)
	연봉에 따른 등급체계를 나눌려고 한다.
	DECODE를 활용해서
		1000미만			F등급	성과급 3%
		1000 ~ 2000미만 	E등급	성과급 5%
		2000 ~ 3000미만 	D등급	성과급 7%
		3000 ~ 4000미만 	C등급	성과급 4%
		4000 ~ 5000미만 	B등급	성과급 3%
		5000 ~ 6000미만 	A등급	성과급 2%
	이름 부서 연봉 연봉등급 성과급  성과급 총액(연봉+성과급)
*/
/*
	숙제7)
	입사 분기 기준 표시(1/4, 2/4, 3/4, 4/4) 입사 분기를 표기
	사원번호, 이름, 입사(년/월), 입사분기
	
















-- ANS:확1
select max(length(ename)), max(length(job)) from emp;
select rpad(ename,6,'@') ename, lpad(job,9,'^') job, hiredate from emp;
select * from emp;


-- ANS:확2
SELECT
	TRIM('N' FROM (TRIM('T' FROM TRIM('R' FROM JOB)))) "직책"
FROM EMP;


-- ANS:3
SELECT
	'['||
	ENAME||
	']은 '||
	TO_CHAR(HIREDATE, 'YY"년 "MM"월 "DY"일"')||
	'에 급여를 '||
	SAL||
	'만원 받기로 하고 입사하였습니다.'
FROM EMP;
