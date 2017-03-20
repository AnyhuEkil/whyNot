select * from emp order by empno;
-- 爽汐舘逐徹
-- 照括馬室推
-- 爽汐庚脊艦陥.
-- select : 働舛 砺戚鷺税 鎮軍誤聖 識澱馬澗 誤敬嬢.
-- 1) * : 穿端 鎮軍聖 持失吉 授辞稽 list 拝凶.
-- 2) 鎮軍誤 : 背雁 汽戚斗研 左奄 是廃 誤敬嬢
-- 3) from 砺戚鷺誤 : 砺戚鷺聖 list 馬奄 是馬食.
select * from emp; -- emp税 砺戚鷺税 穿端 鎮軍 鎧遂聖 list 馬室推.
select empno, job from emp; -- emp砺戚鷺税 鎮軍 掻拭 empno, job聖 list
select deptno, ename, sal from emp;
-- empno: emp number, ename: emp name, job: job title, mgr: manager's number, etc.
-- P1 print data of (empno, job and deptno)
select empno, job, deptno from emp; 

-- 至綬 尻至切.
-- 汽戚斗今戚什税 鎮軍舘是稽 尻至聖 坦軒 拝 呪 赤陥.
-- 紫帳尻至聖 走据馬悟 %尻至精 匂敗馬走 省澗陥.
select ename, sal, sal+100, sal-10, sal*10, sal/10 from emp;
-- 鎮軍娃税 尻至坦軒 : 鎮軍誤1 + 鎮軍誤2
select empno, sal, deptno, sal + deptno from emp;

-- P1 尻裟戚 臣背 穿送据聖 企雌生稽 10% 臣串陥.
-- 紫据誤, 奄糎尻裟, 昔雌歳, 尻雌吉 尻裟恥杯聖 窒径馬室推/
select ename, sal, sal/10 as inc  , sal+sal/10 as total from emp;

select * from emp;
-- P2 採辞紺稽 尻裟昔雌歳聖 陥牽惟 奪舛.
-- 採辞腰硲 10 ==> 10%, 20 ==> 20%, 30 ==> 30%
-- 戚硯, 採辞腰硲, 尻裟, 昔雌吉 尻裟
select ename, deptno, sal, sal*(deptno*0.01)+sal as sal_after from emp;

-- 庚切伸聖 妊薄+?
-- database 庚切伸 尻衣坦軒澗 '||'研 醗遂廃陥.
select '紫据税 戚硯精'||ename||'戚壱, 採辞腰硲澗 '||deptno||' 脊艦陥..' from emp;
select * from emp;
-- 溌昔 森薦 紫据腰硲亜 @@@昔 @@@@澗 臣背 尻裟昔 @@@@ 脊艦陥.!! -- 窒径 list坦虞
select '紫据腰硲亜 ' ||empno|| '昔 ' ||ename||'精(澗) 臣背 尻裟戚 '||sal||'幻据 脊艦陥.' from emp;

-- nvl()
-- null : 汽戚斗今戚什拭澗 汽戚斗亜 蒸澗 葵聖 null葵戚虞壱 廃陥. 因拷('')亀 焼艦悟 0亀 焼観
-- 源益企稽 汽戚斗亜 脊径鞠嬢 赤走 省澗 依聖 源廃陥.
-- 覗稽益轡拭辞 床戚澗 段奄葵引 姥歳背辞 硝壱 赤嬢醤 廃陥.
-- 爽税: 鉢檎引 尻疑吃 凶澗 null戚 妊獣鞠暗蟹, nullpointerException戚虞澗 拭君亜 降持廃陥.
-- 暁廃, 汽戚斗 町軍娃税 尻至亀 舛雌旋生稽 鞠走 省澗陥.

select sal, sal+null from emp;
-- 益掘辞 汽戚斗今戚什拭辞澗 null拭 企廃 尻至税 舛雌旋昔 坦軒研 是背 敗呪研 幻級嬢辞 醗遂廃陥.
-- nvl聖 醗遂馬檎 null 葵析 凶, 段奄葵拭 企廃 舛税研 背辞 舛雌 坦軒亜 亜管馬惟 廃陥.
select ename, sal, nvl(comm, 0) from emp;

/*
引薦
焼掘税 莫縦生稽 汽戚斗研 蟹展鎧室推..
1. ename精 薄仙 尻裟戚 @@@幻据 昔汽, 置悦汽 5%昔雌吉 榎衝戚悟, 拙鰍 尻裟精 @@幻据戚醸柔艦陥.
2. ename税 脊紫析精 hiredate 脊艦陥.
3. 送奪昔 @@@昔 @@@澗 採辞腰硲亜 @@@脊艦陥.
4. @@@還精 薄仙 尻裟引 左格什(comm)税 杯至衝精 @@@脊艦陥.
*/
-- 0. 奄沙 select 庚
select * from emp;
-- 1. ename精 薄仙 尻裟戚 @@@幻据 昔汽, 置悦汽 5%昔雌吉 榎衝戚悟, 拙鰍 尻裟精 @@幻据戚醸柔艦陥.
select ename||'精 薄仙 尻裟戚'||(sal+sal*0.05)||'幻据 昔汽, 置悦拭 5% 昔雌吉 榎衝戚悟, 拙鰍 尻裟精 '||sal||'幻据戚醸柔艦陥.' from emp;
-- 2. ename税 脊紫析精 hiredate 脊艦陥.
select ename||'税 脊紫析精 '||hiredate||' 脊艦陥.' from emp;
-- 3. 送奪昔 @@@昔 @@@澗 採辞腰硲亜 @@@脊艦陥.
select '送奪戚 '||job||'昔 '||ename||'精(澗) 採辞腰硲亜 '||empno||'脊艦陥.' from emp;
-- 4. @@@還精 薄仙 尻裟引 左格什(comm)税 杯至衝精 @@@脊艦陥.
select ename||'還精 薄仙 尻裟('||sal||')引 左格什('||nvl(comm,0)||')税 杯至衝精 '||(sal+nvl(comm,0))||'脊艦陥.' from emp; 

-- 戚猿走亜 a01鎧遂脊艦陥 けけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけ 
-- 戚猿走亜 a01鎧遂脊艦陥 けけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけ 
-- 戚猿走亜 a01鎧遂脊艦陥 けけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけけ 



-- empno研 紺暢生稽 companyNo稽 床奄稽 梅陥. 窒径馬室推.
select empno as companyNo from emp;
-- 紺暢精 覗稽益轡 慎蝕拭辞 掻推廃 税耕研 亜遭陥.
-- 企陥呪 覗稽益轡精 紺暢生稽 娃畷馬惟 紫遂馬澗 井酔亜 弦陥.
-- ex) rs.getString("紺暢/鎮軍誤")
-- as 企重拭 因拷(' ')生稽 坦軒廃陥.
select '紫腰精'||empno||' 脊艦陥.' show from emp;
-- 陥製税 鎧遂聖 痕井吉 鎮軍生稽 蟹展鎧室推.
-- 鎮軍誤		depandname	upgradeRatio 	enterCompany
-- 窒径汽戚斗 	(採辞腰硲)戚硯	尻裟税 10%			脊紫鰍杉析
select '('||deptno||')'||ename depandname, sal*0.1 upgradeRatio,
 hiredate enterCompany from emp;
-- 因拷葵聖 紺暢生稽 坦軒馬奄..: " "紫戚拭 紺暢誤聖 旋嬢層陥.
select ename "name intro" from emp;
-- 廃越聖 紺暢生稽 坦軒拝 凶亀,
select deptno "採辞腰硲" from emp;
----
select * from emp;
-- 掻差葵 坦軒 : 汽戚斗今戚什拭辞澗 疑析廃 葵聖 脊径馬澗 依聖 砺戚鷺 舘是稽
-- 脊径馬澗 依聖 襖形廃陥.
-- 鎮軍拭 赤澗 乞窮 汽戚斗亜 疑析背辞澗 照吉陥澗 源戚陥.
-- 益訓汽, 廃鯵 鎮軍生稽 繕噺拝 凶澗 疑析廃 汽戚斗亜 蟹展劾 呪 赤陥.
select deptno from emp;
-- 析凶, 馬蟹 暁澗 陥呪税 鎮軍税 汽戚斗亜 疑析廃 依聖 filtering 背爽澗 坦軒亜
-- 赤澗汽 戚研 distinct虞壱 廃陥.
-- 醗遂莫縦 select distinct 鎮軍1, 鎮軍2.. from砺戚鷺
select distinct deptno from emp;
select*from emp;
/* 溌昔森薦
 1) -mgr聖 疑析葵 蒸戚 窒径馬室推.
 2) job引 mgr 鎮軍戚 疑析葵 蒸戚 窒径馬室推.
 */
select distinct mgr from emp;
select distinct job from emp;
select distinct job, mgr from emp;
select mgr, job from emp;
select mgr from emp;
select job from emp;
/*
繕闇坦軒..
働舛廃 汽戚斗 list鎧遂拭辞 琶推廃 汽戚斗廃 楳舘是稽 filtering馬澗 依聖 源廃陥.
1. 骨是坦軒
*/

/* 尻裟戚 3000戚雌戚 い汽戚斗研 list 坦軒
where 鎮軍誤> 繕闇 汽戚斗 */
select * from emp
 where sal >= 3000;
-- 汽戚斗今戚什拭辞 床戚澗 搾嘘尻至切
-- = (*), >, <, >=, <=,     <>,!(陥研凶)
select*from emp;
-- 1) 採辞腰硲 30昔 汽戚斗研 list馬室推..
-- 2) 尻裟戚 1000耕幻昔 汽戚斗
-- 3) ename戚 SMITH昔 汽戚斗
-- 4) COMM戚 NULL昔 汽戚斗(*) - 走榎猿走 壕錘 敗呪醗遂
select*from emp where nvl(comm,0)=0;
select*from emp where comm is null;
select*from emp where comm is not null;
-- 5) MGR戚 7698戚 焼観 汽戚斗
select * from emp where mgr != 7698;
-- 伸引 楳税 砧亜走 繕闇聖 握秩 汽戚斗 list馬奄..
-- 楳税 multi 繕闇拭 企廃 坦軒..
select*from emp;
-- 尻裟戚 3000戚雌昔 紫寓税 戚硯引 尻裟聖 list
select ename, sal
from emp
where sal>=3000;
select * from emp;
-- 尻裟戚 2000 戚馬戚壱 送奪戚 SALESMAN昔 紫寓税 戚硯 送奪 尻裟聖 窒径
select ename "戚硯", job "送奪",sal "尻裟"
from emp
where sal<=2000
and job='SALESMAN';

/*
 1 EMP掻拭 厭食亜 2000耕幻戚 鞠澗 紫据 舛左掻拭 紫腰引 厭食研 窒径馬虞.
 尻裟引 左格什税 杯至 榎衝戚 1500耕幻昔 紫寓税 戚硯, 尻裟 左格什 杯至衝聖 窒径馬室推.
 MGR戚 NULL昔 紫寓税 JOB引 戚硯 尻裟聖 窒径馬室推.
 JOB戚 CLERK昔 紫寓掻拭 DEPTNO亜 30昔 紫寓税 戚硯, 送奪 採辞腰硲研 窒径馬室推.
*/


























