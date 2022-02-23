-- ex1) 주석 -- /**/
-- ex2) 실행 단축키 Ctrl + Enter(한줄), Ctrl+Shift+Enter(여러줄)
-- ex3) 데이터 베이스 생성
create database db01;
-- ex4) 데이터 베이스 목록 확인
show databases;
-- ex5) 데이터 베이스 목록 확인
drop database db01;

-- ex6) 테이블 생성 암기!
-- db먼저 선택하기
-- 더블클릭해서 디비 선택할 수 있음
use db01;

CREATE TABLE table01 (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45),
  age INT,
  salary INT,
  PRIMARY KEY (id));
  
-- ex7) 테이블 목록 보기
show tables;

-- ex8) 컬럼 목록 보기
desc table01;

-- ex9) 테이블 삭제
drop table table01;

-- ex10) DB를 사용하는 근본 목적 : CRUD
-- Create(로우 생성)
-- insert into 테이블명 values(값,); 암기!
insert into table01 values(null,'현지영',20,300);
insert into table01 values(null,'조영우',21,200);
insert into table01 values(null,'남궁윤호',22,300);
insert into table01 values(null,'호랑이',23,400);
insert into table01 values(null,'코기리',null,null);
-- ex11) Read:조회
select * from table01;

-- ex12) update
-- 옵션체크 :  >>>
-- 조건이 안걸리면 모든 age 99로 변경
update table01 set age = 99;
update table01 set age = 99 where name = '안중근';
update table01 set name = '소나무' where id = 4;
update table01 set name = '대나무', age =  888 where id = 4;

-- ex13) delete
delete from table01 where name = '홍길동';

-- ex14)
-- 모두채울때 (묵시적 방법)
insert into table01 values(null,'유니콘',20,300);
-- 선택적으로 채울 때 (명시적 방법)
insert into table01(id, name, age, salary) values (null,'유니콘',20,300);
insert into table01(id, age) values (null,20);
insert into table01(age, id) values (120, null);

-- ex15) workBench에서 n개의 로우를 삭제할 때
-- 우클릭을 이용하여 n개 삭제 가능 이지만 apply 안누르면 다시 보면 삭제 안되어있음

-- ex16) 로우의 개수를 출력
select count(*) from table01;

-- ex17) sakila db에서 검색 및 개수 출력
select * from actor;
select * from city;
select count(*) from city;
-- 검색 로우의 개수가 다른것을 검색으로 같이 사용할 수 없다
select count(*), city_id from city;

-- ex18) 출력개수 제한 - 0번부터 6개
select * from city limit 0,6;
select * from city limit 6;
-- index 2번부터 3개
select * from city limit 2,3;

-- ex19) 선택적으로 로우 검색
select name from table01;
select id, name from table01;
select id, name, name from table01;

-- ex20) 선택컬럼에 산술식을 사용할 수 있다.
select name, salary from table01;
select name, salary, salary*0.1 from table01;

-- ex21) 컬럼명에 별칭 사용
select name as 이름, salary as 급여 from table01;
select name, salary * 0.1 as 보너스, salary+salary*0.1 as 실수령액 from table01;

-- as 생략가능
select name 이름, salary 급여 from table01;

-- 별칭 사이에 공백이 들어가는 경우 백쿼터이용
select name `이 름`, salary `급 여` from table01;

-- 단순 쿼리 정리
select name `이 름`, salary * 12 `연    봉` from table01;

-- ex22) 컬럼연결이 필요한 경우(컬럼+컬럼 >> 컬럼컬럼)
select concat(name, salary) 이름급여 from table01;
select concat(name, '님의 급여는', salary,'원입니다') 이름급여 from table01;
select concat('님의 급여는', concat (salary,'원입니다')) 이름급여 from table01;

-- ex23) 단순 산술식이나 날짜를 얻고 싶을때 - 가상테이블
select 3*5 from dual;
select sysdate(), 3*7 from dual;
-- 몫값은 실제 연산 결과 값이다. 소숫점까지
select 9+2, 9-2, 9*2, 9/2, 9%2 from dual;

-- ex24) null 검색
select * from table01;
select * from table01 where salary = null; -- 아주 조심 해야하는 문장
select * from table01 where salary is null;
select name from table01 where salary is not null;
select name `급여를 받는 사람` from table01 where salary is not null;

-- ex25) 직원들의 연간 총소득을 모두 검색하여 출력
CREATE TABLE table02 (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45),
  salary INT,
  bonus INT,
  PRIMARY KEY (id));

insert into table02 values(null, '호랑이1', 100, 10);
insert into table02 values(null, '호랑이2', 200, null);
insert into table02 values(null, '호랑이3', 300, 40);
insert into table02 values(null, '호랑이4', 400, 30);
insert into table02 values(null, '호랑이5', 500, null);
-- 원하는 결과가 나오지 않는 쿼리
select salary * 12 + bonus from table02; -- 보너스가 null인 컬럼 계산 안되고 있음
-- 테이블 업데이트 하지 말고
select salary * 12 + ifnull(bonus, 0) from table02;

-- ex26) table02의 bonus가 null인 컬럼을 0으로 수정(갱신)하세요.
update table02 set bonus=0 where bonus is null;
select * from table02;

-- ex27) 4.5만점의 학점을 100점기준으로 환산한 값은
CREATE TABLE table03 (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(16),
  result float,
  PRIMARY KEY (id));
  
insert into table03 values(null, '호랑이1', 4.5);
insert into table03 values(null, '호랑이2', 4.0);
insert into table03 values(null, '호랑이3', 3.2);
insert into table03 values(null, '호랑이4', 3.6);
insert into table03 values(null, '호랑이5', 2.8);
select * from table03;
select result, result *100/4.5 '100점대 환산' from table03;

-- ex28) 중복제거
CREATE TABLE table04 (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(16),
  country VARCHAR(16),
  PRIMARY KEY (id));
  
insert into table04 values(null, '호랑이1', '한국');
insert into table04 values(null, '호랑이2', '한국');
insert into table04 values(null, '호랑이1', '중국');
insert into table04 values(null, '호랑이2', '미국');
insert into table04 values(null, '호랑이3', '한국');
insert into table04 values(null, '호랑이4', '중국');
insert into table04 values(null, '호랑이2', '한국');
-- 값이 null인 경우는 집계에 포함되지 않는다.
insert into table04 values(null, '호랑이5', null);
select * from table04;
select distinct name from table04;
-- 중복제거된 목록
select distinct(country) from table04;
-- 중복제거된 목록의 개수
select count(distinct(country))from table04;

-- ex29) 정렬 결과
CREATE TABLE table05 (
  id INT NOT NULL AUTO_INCREMENT, -- 컬럼1
  name VARCHAR(16),				  -- 컬럼2
  gold_num int,					  -- 컬럼3
  silver_num int,
  PRIMARY KEY (id));
  
insert into table05 values(null, '일본', 1, 2);
insert into table05 values(null, '미국', 2, 3);
insert into table05 values(null, '한국', 10, 10);
insert into table05 values(null, '중국', 2, 4);
insert into table05 values(null, '독일', 4, 8);

-- 금메달 기준
-- asc는 생략 가능: 오름차순, 순차정렬
select * from table05 order by gold_num asc;
-- 테이블이 수정되는 것은 아님
select * from table05 order by gold_num desc;
select * from table05 order by 3 desc; -- 컬럼인덱스로 정렬가능
select * from table05 order by gold_num desc, silver_num desc; -- 1차 정렬에서 동일한 값에서 2차 정렬 

-- ex30) 정렬
CREATE TABLE table06 (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45),
  dept VARCHAR(16),
  salary INT,
  PRIMARY KEY (id));
  
insert into table06 values(null,'이순신','경영',500);
insert into table06 values(null,'홍길동','인사',200);
insert into table06 values(null,'안중근','회계',300);
insert into table06 values(null,'호랑이','인사',400);
insert into table06 values(null,'코기리','개발',100);
insert into table06 values(null,'안중근','회계',700);
insert into table06 values(null,'호랑이','인사',50);
insert into table06 values(null,'코기리','개발',550);

-- 부서별로 순차 정렬을 하고 급여를 역순 정렬해서 나타내세요.
select * from table06 order by dept asc, salary desc;
-- ~~별로(나라별로, 부서별로, 성별로, 학과별로)
-- 1. order by(단순검색)       2. group by 거의 대부분, 통계자료를 뽑고 싶을 때

-- ex31) 성적 합에 대한 역순 정렬 (키포인트는 별칭 사용)
CREATE TABLE table07 (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45),
  kor int,
  eng int,
  mat int,
  PRIMARY KEY (id));
  
insert into table07 values(null,'호랑이',66, 78, 80);
insert into table07 values(null,'코기리',80, 79, 92);
insert into table07 values(null,'안중근',98, 94, 100);
insert into table07 values(null,'호랑이',77, 67, 90);
insert into table07 values(null,'코기리',75, 86, 98);

select * from table07;
select name, kor+eng+mat total from table07 order by total desc;

-- ex32) 대소비교(=, !=, >, >=, <=)
select * from table07 where kor > 80;
select name, (kor+eng+mat)/3 result from table07 where (kor+eng+mat)/3 >= 80;
-- 될것 같은데 안된다. select에서 정의된 별칭은 where에서 사용할 수 없음.
-- 테이블 이름을 별칭으로 만들 수가 있는데, 이때 만든 별칭은 where에서 사용할 수 있음
select name, (kor+eng+mat)/3 result from table07 where result >= 80; -- err

-- ex33) and, or 사용
CREATE TABLE table08 (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45),
  dept VARCHAR(16),
  salary INT,
  PRIMARY KEY (id));
  
insert into table08 values(null,'이순신','경영',500);
insert into table08 values(null,'홍길동','인사',200);
insert into table08 values(null,'안중근','회계',300);
insert into table08 values(null,'호랑이','인사',400);
insert into table08 values(null,'코기리','개발',100);
select id, name, dept, salary -- *대신에 컬럼명을 명시하는것을 추천한다.
from table08
where dept ='인사' and salary > 350;

select id, name, dept, salary
from table08
where dept = '개발' and salary < 350;

select id, name, dept, salary
from table08
where salary>=160 and salary < 350;

select id, name, dept, salary
from table08
where salary < 160 or salary > 600;

-- ex34) Like 글자 찾고 싶을 때
CREATE TABLE table09 (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45),
  salary INT,
  PRIMARY KEY (id));
  
insert into table09 values(null,'스타벅스',500);
insert into table09 values(null,'풀스타노래방',200);
insert into table09 values(null,'강남만두',300);
insert into table09 values(null,'스타일미용실',400);
insert into table09 values(null,'닭다리스타',100);
insert into table09 values(null,'짬뽕천국',400);
-- 스타로 시작하는
select * from table09
where name like '스타%';
-- 스타로 끝나는
select * from table09
where name like '%스타';
-- 스타가 들어있는
select * from table09
where name like '%스타%';
-- 스타가 들어있는 이름의 갯수
select count(name) from table09
where name like '%스타%';

CREATE TABLE table10 (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45),
  grade INT,
  PRIMARY KEY (id));
  
insert into table10 values(null,'김유신',1);
insert into table10 values(null,'이순신',2);
insert into table10 values(null,'김서',3);
insert into table10 values(null,'김김김',4);
insert into table10 values(null,'홍길동',1);
insert into table10 values(null,'김장',1);
-- 1학년 중에서 김씨는 몇명인가?
select * from table10
where name like '김%' and grade = 1;

-- ex37) 이름이 2글자인 사람 검색
select * from table10
where name like '__';

-- ex38) 성과이름이 3글자가 아닌 사람 검색
select * from table10
where name not like '___';

-- ex39) between A and B
-- 반드시 A<B 이어야함
CREATE TABLE table11 (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45),
  dept VARCHAR(16),
  salary INT,
  PRIMARY KEY (id));
  
insert into table11 values(null,'이순신','경영',500);
insert into table11 values(null,'홍길동','인사',200);
insert into table11 values(null,'안중근','회계',300);
insert into table11 values(null,'호랑이','인사',400);
insert into table11 values(null,'코기리','개발',100);

-- 가독성이 높아서 사용한다.
select * 
from table11
where salary between 200 and 600;
-- where 학점 between 4.0 and 4.5; 

-- ex40) in - 여러개 넣을 수 있음
select * 
from table11
where dept = '개발' or dept='경영';
select * 
from table11
where dept in ('개발','경영');

-- ex41) 
select * 
from table11
where salary > ANY(300, 200, 250);
-- 번역 결과 : where salary > 200; 최소값보다 크면

-- where salary > All(300, 200, 250);
-- 번역 결과 : where salary > 300; 최댓값보다 크면

-- where salary < ANY(300, 200, 250);
-- 번역 결과 : where salary < 300; 최댓값보다 작으면

-- where salary < All(300, 200, 250);
-- 번역 결과 : where salary < 200; 최소값 보다 작으면

-- 문제) 20번 부서의 최고 월급보다 적은 연봉을 받는 직원을 검색하세요
CREATE TABLE table12 (
  id INT NOT NULL AUTO_INCREMENT,
  eno int, -- 부서번호
  name VARCHAR(16),
  salary INT,
  PRIMARY KEY (id));
  
insert into table12 values(null,10,'tiger1',100);
insert into table12 values(null,20,'tiger2',200);
insert into table12 values(null,30,'tiger3',300);
insert into table12 values(null,40,'tiger4',400);
insert into table12 values(null,10,'tiger5',500);
insert into table12 values(null,20,'tiger6',600);
insert into table12 values(null,30,'tiger7',700);
insert into table12 values(null,40,'tiger8',800);
insert into table12 values(null,10,'tiger9',350);
insert into table12 values(null,20,'tiger10',450);

-- 20번 부서의 급여를 모두 검색한다.
select salary from table12
where eno=20;
-- 20번 부서의 최고 급여는 얼마인가?
select max(salary) from table12
where eno = 20;
-- 20번 부서의 최고 급여를 받는 직원의 이름은 무엇입니까?
select name from table12
where salary = 600;
-- sub query
select name from table12
where salary = (select max(salary) from table12
where eno = 20);

select name from table12
where salary < (select max(salary) from table12
where eno = 20);

-- where salary < ANY(300, 200, 250);
select eno, name from table12
where salary < ANY(select salary from table12
where eno = 20);

-- 이 중 20번인 사람은 제외
select eno, name from table12
where salary < ANY(select salary from table12
where eno = 20) and eno!=20;

-- 유사 예제
-- 문제 컴공과에서 제일 낮은 점수를 받은 학생보다 성적이 낮은 학생들은?
select name from univ
where score < all(select score from univ where dept='컴공');

-- ex42) 통계함수
select min(salary) from table12;
select max(salary) from table12;
select avg(salary) from table12;
select sum(salary) from table12;

-- 실제 이름을 얻을 때
select name from table12
where salary = (select max(salary) from table12);

-- ex43) join : 오라클 join문법, ansi join문법(표준)
-- 두개이상의 테이블을 합병
-- 1. 8개의 다양한 조인 유형

drop table tableA;
-- ex44) 교차조인(cross join): 데카르트 곱, 카데시안 곱
-- A table의 로우가 3개, b table의 로우가 4개일 때
CREATE TABLE tableA (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(16),
  eno int, -- 직업번호
  salary INT,
  PRIMARY KEY (id));
  
insert into tableA values(null,'홍길동',10,1000);
insert into tableA values(null,'이순신',20,2000);
insert into tableA values(null,'안중근',30,3000);
insert into tableA values(null,'임꺽정',40,4000);
select * from tableA;

drop table tableB;
-- ex44) 교차조인(cross join): 데카르트 곱, 카데시안 곱
-- A table의 로우가 3개, b table의 로우가 4개일 때
CREATE TABLE tableB (
  id INT NOT NULL AUTO_INCREMENT,
  eno int, 			-- 부서번호
  job VARCHAR(16),  -- 직업
  PRIMARY KEY (id));

insert into tableB values(null,10,'장군');
insert into tableB values(null,20,'의적');
insert into tableB values(null,30,'의사');
select * from tableB;

-- 교차 조인 (일반적인 조인 방식) 
-- 조인을 시키기 전에 조건을 따져봄
select count(*) from tableA, tableB;

-- 교차 조인(명시적인 안시 방식)
select * from tableA
cross join table02;

-- ex45) 내부 조인(외부 조인이 아닌것)
-- 내부 조인은 반드시 조건을 함께 써야하는데 안썼을 시 일단은 cross join처럼 보임
select * from tableA
inner join tableB;

-- 정상적인 내부 조인 쿼리
-- 조건에 만족하면 병합, 안하면 병합 x
-- 내부적으로 교차조인 만큼의 비교는 함
-- on -> 조인 조건!!
-- where -> 필터 조건
select * from tableA
	inner join tableB
	on tableA.eno = tableB.eno; -- 조인조건

-- 등가조인이라고 한다( = )
-- 같으냐고 안물으면 전부다 비등가 조인
select * from tableA
	inner join tableB
	on tableA.eno = tableB.eno
where salary >= 3000; -- 필터조건(검색 조건)

-- ex46) 일반조인, 위에꺼랑 구분
select * from tableA, tableB
where tableA.eno = tableB.eno -- 조인 조건 
and salary>=3000; -- 필터 조건, 검색조건

-- ex47) 테이블 이름에 별칭(별명)을 사용할 수 있다.
-- 정확하게는 별칭이라기보다는 리네임이다.
select * from tableA t1, tableB t2
where t1.eno = t2.eno -- 조인 조건 
and salary>=3000; -- 필터 조건, 검색조건 (중복되는 이름이 없는 경우 t1.salary이렇게 써야할것을 t1. 생략해도됨)

-- id는 컬럼명이 중복되므로 명시를 해주어야함
select t1.eno, name, t1.id from tableA t1, tableB t2
where t1.eno = t2.eno  
and salary>=3000; 

--  ex48) 잘못사용하고 있다. 조건을 왜줌
select * from tableA
	cross join tableB
	on tableA.eno = tableB.eno; 
    
-- ex49) 잘못된 쿼리문 - 조인조건이 없으니까 교차조인이 일어난다. -> 교차조인이 일어난 것 가지고 필터링을 하는 것이기 때문
select * from tableA
	inner join tableB
where tableA.eno = tableB.eno;

-- ex50) 이순신의 직업은? - 두가지 방법!
-- 등가 조인 사용 방법 - 서브쿼리보다 조인을 사용하는 것이 훨씬 낫다
select name, job from tableA t1, tableB t2
where t1.eno = t2.eno
and t1.name = '이순신';

-- 서브쿼리 이용하는 방법
select job from tableB
where eno = (select eno from tableA where name='이순신');

-- ex51) 모대학에서 2학점인 과목을 검색하고, 이 과목을 강의하는 교수를 검색하세요.
-- 교수 테이블
CREATE TABLE tableA (
  id INT NOT NULL AUTO_INCREMENT,
  pno int,			-- 교수번호
  name VARCHAR(10), -- 교수이름
  PRIMARY KEY (id));
  
insert into tableA values(null, 100, '홍길동1');
insert into tableA values(null, 101, '홍길동2');
insert into tableA values(null, 102, '홍길동3');
insert into tableA values(null, 104, '홍길동4');
insert into tableA values(null, 105, '홍길동5');

-- 과목 테이블
CREATE TABLE tableB (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(16), -- 과목명
  num int, 			-- 학점
  pno int, 			-- 담당교수번호
  PRIMARY KEY (id));

insert into tableB values(null,'국어', 4, 103);
insert into tableB values(null,'영어', 3, 104);
insert into tableB values(null,'수학', 2, 102);
insert into tableB values(null,'사회', 1, 101);
insert into tableB values(null,'체육', 2, 103);
insert into tableB values(null,'과학', 2, 102);

select * from tableA t1
	inner join tableB t2
    on t1.pno = t2.pno
where num = 2;

-- ex52)
CREATE TABLE tableA (
  id INT NOT NULL AUTO_INCREMENT,
  eno int,			-- 교수번호
  name VARCHAR(10), -- 교수이름
  major VARCHAR(10), -- 교수이름
  year int,			-- 교수번호
  PRIMARY KEY (id));
insert into tableA values(null, 1000, '홍길동1','국어',1);
insert into tableA values(null, 1001, '홍길동2','화학',1);
insert into tableA values(null, 1002, '홍길동3','화학',2);
insert into tableA values(null, 1003, '홍길동4','국어',2);
insert into tableA values(null, 1004, '홍길동5','화학',1);
CREATE TABLE tableB (
  b_id INT NOT NULL AUTO_INCREMENT,
  eno int,			
  cno int, 
  result int, 
  PRIMARY KEY (b_id));
  
insert into tableB values(null,1000, 10, 59);
insert into tableB values(null,1000, 20, 34);
insert into tableB values(null,1001, 10, 80);
insert into tableB values(null,1001, 20, 79);
insert into tableB values(null,1001, 30, 33);
insert into tableB values(null,1002, 20, 48);
insert into tableB values(null,1003, 30, 55);
insert into tableB values(null,1004, 10, 99);

select t2.result from tableA t1
	inner join tableb t2
    on t1.eno = t2.eno
where t1.major = '화학' and t1.year = 1;

-- 다른 답안
select *
from tableA t1, tableB t2
where t1.eno = t2.eno
and major = '화학' and year = 1;

-- ex53) 자연조건 - 너가 컬럼명을 양쪽 테이블에서 보고 똑같은게 있으면 조인해라 
-- 양쪽 테이블에서 컬럼명이 동일한 것이 1개이상있다는 전제하에 
-- eno가 같은 컬럼명이므로 자동으로 eno기준으로 조인
select * from tableA
	natural join tableB;
    
select * from tableA
	natural join tableB
where year = 1;

-- ex53) using 조인: 컬럼명이 어쩔 수 없이 2개 이상 중복된 경우의 조인 
-- 컬럼을 꼭 찍어서 조인을 시킬 수 있다.

select * from tableA
	join tableB using(eno)
where year = 1;

-- ex54) 비등가조인:  (=) 을 제외한 비교연산
CREATE TABLE tableA (
  id_a INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(10), -- 이름
  eno int,			-- 부서번호, 직급번호
  salary int,
  PRIMARY KEY (id_a));
  
insert into tableA values(null, '홍길동1',20,50);
insert into tableA values(null, '홍길동2',10,150);
insert into tableA values(null, '홍길동3',30,250);
insert into tableA values(null, '홍길동4',20,350);
insert into tableA values(null, '홍길동5',20,170);
insert into tableA values(null, '홍길동5',20,370);

-- 등급 테이블
CREATE TABLE tableB (
  id_b INT NOT NULL AUTO_INCREMENT,
  grade VARCHAR(10), -- 이름
  losalary int,		 -- 최소값 설정
  hisalary int,		 -- 최대값 설정
  PRIMARY KEY (id_b));

insert into tableB values(null,'A', 300, 9999);
insert into tableB values(null,'B', 200, 299);
insert into tableB values(null,'C', 100, 199);
insert into tableB values(null,'D', 0, 99);

select name, grade from tableA t1
	inner join tableB t2
    on t1.salary >= t2.losalary 
		and t1.salary <= t2.hisalary;
        
select name, grade from tableA t1
	inner join tableB t2
    on salary between t2.losalary and t2.hisalary;
    
-- 일반 조인
select name, grade 
from tableA t1, tableB t2
where salary between t2.losalary and t2.hisalary;

select name, grade 
from tableA t1, tableB t2
where salary between t2.losalary and t2.hisalary
and grade='A';

-- ex55) 셀프조인: 동일 테이블끼리 조인
-- 홍길동 사원번호(1000) 사수번호(1005)
-- 이순신 사원번호(1000) 
-- 홍길동의 사수는 누구입니까?
CREATE TABLE tableA (
  id_a INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(10), -- 이름
  eno int,			-- 부서번호, 직급번호
  mgr int,			-- 사수번호, 멘토번호
  salaty int,
  PRIMARY KEY (id_a));
insert into tableA values(null,'홍길동1',1000,null,100); -- 사수가 없다
insert into tableA values(null,'홍길동2',1001,1000,100); 
insert into tableA values(null,'홍길동3',1002,1001,100); 
insert into tableA values(null,'홍길동4',1003,1002,100); 
select * from tableA;

-- 셀프조인: 반드시 별칭이 있어야한다
select * from tableA t1, tableA t2;

select * from tableA t1, tableA t2
where t1.eno = t2.mgr;

select * from tableA t1, tableA t2
where t2.mgr =  t1.eno;

-- ex56) 동명이인 검색
CREATE TABLE tableA (
  id_a INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(10), -- 이름
  PRIMARY KEY (id_a));
insert into tableA values(null,'홍길동2'); 
insert into tableA values(null,'홍길동3'); 
insert into tableA values(null,'홍길동2'); 
insert into tableA values(null,'홍길동6'); 
insert into tableA values(null,'홍길동1'); 
insert into tableA values(null,'홍길동7'); 
insert into tableA values(null,'홍길동8'); 
insert into tableA values(null,'홍길동4'); 
insert into tableA values(null,'홍길동5'); 

-- 아이디가 다르면서 이름이 동일한 것을 찾아야 동명이인을 찾을 수 있음
select * from tableA t1, tableA t2
where t1.id_a !=  t2.id_a and t1.name = t2.name;

select distinct(t1.name) from tableA t1, tableA t2
where t1.id_a !=  t2.id_a and t1.name = t2.name;

select distinct(t1.id_a) from tableA t1, tableA t2
where t1.id_a !=  t2.id_a and t1.name = t2.name;

-- ex57) 세미조인: 메인쿼리에서 로우를 하나씩 가져와서 
-- 				 서브쿼리에서 exists로 존재 여부를 묻는 조인
-- <-> 안티조인: 세미조인이 존재하는 것을 찾는다면 안티조인은 존재하지 않는 것을 찾음
/*
메인쿼리	  서브쿼리
메뉴테이블   판매테이블
짜장		  짜장	
짬뽕		  짜장
냉면		  짬뽕
		  짜장
		  짬뽕
*/
create table menu(
	foodnum int,				
    name varchar(20)	
);
insert into menu values(1, '짜장');
insert into menu values(2, '우동');
insert into menu values(3, '냉면');
insert into menu values(4, '탕슉');
insert into menu values(5, '양장');

create table sell(
	no int,				-- 판매번호
    count varchar(20),	-- 판매수량
    foodnum int			-- 판매된 음식번호
);
insert into sell values(1, 2, 1);
insert into sell values(2, 3, 2);
insert into sell values(3, 8, 2);
insert into sell values(4, 4, 2);
insert into sell values(5, 1, 1);

select s.foodnum from sell s;

select *
from menu m
-- where d.foodnum = 1 or d.foodnum = 2;
-- where m.foodnum in (1, 2); 위 코드와 동일
-- where m.foodnum in (1, 2, 2, 2, 1); 위 코드와 동일
where m.foodnum in(select s.foodnum from sell s); -- 위 코드와 동일

-- 세미조인
select * from menu m
where exists(
	select * from sell s
    where m.foodnum = s.foodnum
);

-- 안티조인
select * from menu m
where not exists(
	select * from sell s
    where m.foodnum = s.foodnum
);

-- ex58) 외부조인(outer join)
create table tableA(
	id int,
    name varchar(20)
);
create table tableB(
	id int,
    age int
);

insert into tableA values(1, 'tiger01');
insert into tableA values(2, 'tiger02');
insert into tableA values(3, 'tiger03');
insert into tableA values(4, 'tiger04');
insert into tableA values(5, 'tiger05');

insert into tableB values(3, 30);
insert into tableB values(4, 40);
insert into tableB values(5, 50);
insert into tableB values(6, 60);
insert into tableB values(7, 70);

-- a의 1, 2는 빠지고 b의 6, 7은 빠짐
select *
from tableA t1, tableB t2
where t1.id = t2.id;

-- 1,2 포함해서 나옴
select *
from tableA t1
	left join tableB t2
	on t1.id = t2.id;
-- 6,7 포함해서 나옴
select *
from tableA t1
	right join tableB t2
	on t1.id = t2.id;
    
/*
전체 교수명단과 그 교수가 담당하는 과목의 이름을 검색하세요
일반 조인을 사용하면 강감찬은 전체 교수 명단에서 빠짐 - 외부조인 사용하기 
교수테이블			 과목테이블
이름		과목번호    과목번호    교과목이름
홍길동 	1		 1		   수학
안중근	null	 2         영어
홍길동 	2
이순신 	2
강감찬 	null
쿼리 결과는?
홍길동  영어
홍길동  수학
안중근  null
이순신  영어
강감찬  null
*/

-- ex59) group by: ~별로(그룹별로, 부서별로, 학과별로, 팀별로)
-- 그룹조건: having
-- ex) 그룹별 평균(avg)급여, 그룹별 사원수(count), 그룹별 최대연봉(max)
create table tableA(
	eno int, 
    salary int
);

insert into tableA values(10, 800);
insert into tableA values(20, 200);
insert into tableA values(20, 400);
insert into tableA values(10, 500);
insert into tableA values(20, 300);

select * from tableA;

-- group by를 사용해서 select할때는 컬럼명을 사용하는 것이 일반적이다.
select eno, sum(salary)
from tableA
group by eno;

-- 급여가 300이상인 직원들을 그룹별로 검색하세요.
select eno, sum(salary)
from tableA
where salary>300 -- select를 필터링한다.
group by eno; 

-- group by에서 조건 걸때는 having
select eno, sum(salary)
from tableA
group by eno
having sum(salary) > 1000; -- grouping된 결과를 필터링 

select eno, sum(salary)
from tableA
where salary>300
group by eno
having sum(salary) > 1000; -- grouping된 결과를 필터링 

/*
sql쿼리 실행 순서
① FROM
② ON
③ JOIN
④ WHERE
⑤ GROUP BY
⑥ CUBE | ROLLUP
⑦ HAVING
⑧ SELECT
⑨ DISTINCT
⑩ ORDER BY
⑪ TOP
*/
-- uq: unique key 삭제되고 다시 들어올때 동일 한 값 부여 가능
-- b: binary 대소문자 구분 체크 

-- ex60)binary
CREATE TABLE `db01`.`tablea` (
  `id` INT NOT NULL auto_increment,
  `name` VARCHAR(45) BINARY NULL,
  PRIMARY KEY (`id`));

insert into tableA values(1, 'Tiger');
insert into tableA values(2, 'tiger');
insert into tableA values(3, 'tiger');
insert into tableA values(4, 'Tiger');
insert into tableA values(5, 'TigerLion');

select * from tableA
where name = 'Tiger';

-- un >> unsigned의 약자: 음수사용불가 ex.나이 / int 양수의 범위를 두배로 사용가능
-- zf >> zerofill의 약자: 빈자리를 0으로 채울까요 말까요

CREATE TABLE `db01`.`tableb` (
  `id` INT NOT NULL auto_increment,
  `name` VARCHAR(45) BINARY NULL,
  age int(3) ZEROFILL NULL, -- 4자리수 밖에 데이터 못받음
  PRIMARY KEY (`id`));
  
insert into tableB values(null, 'tiger', 23); -- 023으로 나옴
select * from tableB;

-- g >> generate의 약자: 

-- --------내부조인---------
-- 교차조인, 내부조인, 등가조인          (일반조인, 안시조인)
-- 자연조인, Using 조인, 비등가조인
-- 셀프조인, 세미조인(안티조인)
-- --------외부조인---------
-- leftjoin, rightjoin