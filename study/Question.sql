/*
	Question

00. 각 부분 명칭 ex)컬럼 테이블 등..
01. 같다 = 에서 (*)이 의미 하는것은?
02. 컬럼명은 대소문자 구분X, 데이터는 대소문자 구분. 그럼 연산자??등은?
03. sql은 대문자로 작성하는것이 좋은가??(경험적 지식에 대한 질문)
04. select * from EMP
	where EMP.HIREDATE
	between '1981/12/01' and '1981/12/31';
	위 명령이 먹는 이유는?? 날짜는 전에 81/12/01 이런식으로 되어있지 않았나? Q10참고.
05. LIKE연산자만 단독으로 쓸수 있는가?
06. DUAL은 한줄로만 출력되나?
07. INITCAP을 사용할때, 데이터안에 띄어쓰기를 포함하면 어떻게 되는가?
	ex) 'hello? my name is whyNOT' 자체가 데이터 한 칸일때.
08. '오라클 WhyNot'의 문자열 갯수는?
09. 아래에서 'a오A라B'출력?==> ,1,9?? // 'A라B'를 출력?==> ,4,6??
	SELECT SUBSTRB('a오A라BC클 WhyNot?!',1,1) "SUBSTRB" FROM DUAL;
10. substr(hiredate,1,length(hiredate)) 을 이용하면 컬럼자체를 불러낼수있다?!
11. SUBSTR(ENAME, -2, 3) 시작할 위치를 음수로 쓰면 뒤에서부터라는 뜻이된다!
12. TRIM은 왜 한글자만 되는가?
13. NEXT_DAY는 요일말고는 안되는가?
14. HIREDATE는 어떤 형태의 데이터인가?? 
15. LENGTH(to_char(8080,'99000000')) 몇인가??
16. 왜 이건또 19##/##/##형식으로 써야하는가??
	select * from emp
	where hiredate=to_date('1980/12/17','YYYY/MM/DD');
17. demo와 emp의 차이는??
18. TO_NUMBER의 룰에대해..
		ex) 숫자형에는 ,를 붙이지 않아도 알아서 붙음.
			문자형에 ,가 없을땐, 숫자형에 ,표시하면 출력 안됨. 등등
		공부 더해봐야됨!!
19. TO_NUMBER로 했을때 왜 소수점 2번째 자리까지만 되는가?
	
	
	
*/


SELECT * FROM EMP;





/*
숙제
	근무개월수에 따른 차등 보너스 지급
	가장 오래된 개월~가장 최근에 입사한 개월수
	1/3 = 30%, 1/3 = 20%, 1/3 = 10% (연봉기준)
	사원, 입사일, 현재날짜(@@/@@/@@ AM @@시 @@분 @@ 초), 근무개월수, 보너스
*/	

SELECT MONTHS_BETWEEN(SYSDATE, HIREDATE) 
FROM EMP ORDER BY MONTHS_BETWEEN(SYSDATE, HIREDATE) DESC;

SELECT MOD(MONTHS_BETWEEN(HIREDATE, ),전체데이터수/3)+1)*0.1||'%' FROM EMP;
	SELECT substr(hiredate,1,length(hiredate)) FROM EMP;
	SELECT mod((HIREDATE ORDER by asc),()/3)*3 FROM EMP;
	


	 
	
	
	
	
	