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

-- ex41) any 안에서 제일 작은 숫자를 찾음, all 가장 큰 숫자 찾음
select * 
from table11
where salary > ANY(300, 200, 250);
-- 번역 결과 : where salary > 200;

-- where salary > All(300, 200, 250);
-- 번역 결과 : where salary > 300;

-- where salary < ANY(300, 200, 250);
-- 번역 결과 : where salary < 300;

-- where salary < All(300, 200, 250);
-- 번역 결과 : where salary < 200;

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