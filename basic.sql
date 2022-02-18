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
insert into table01 values(null,'이순신',20,300);
insert into table01 values(null,'홍길동',21,200);
insert into table01 values(null,'안중근',22,300);
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

-- ex12) delete
delete from table01 where name = '홍길동';

-- ex13)
-- 모두채울때 (묵시적 방법)
insert into table01 values(null,'유니콘',20,300);
-- 선택적으로 채울 때 (명시적 방법)
insert into table01(id, name, age, salary) values (null,'유니콘',20,300);
insert into table01(id, age) values (null,20);
insert into table01(age, id) values (120, null);

-- ex14) workBench에서 n개의 로우를 삭제할 때
-- 우클릭을 이용하여 n개 삭제 가능 이지만 apply 안누르면 다시 보면 삭제 안되어있음

-- ex15) 로우의 개수를 출력
select count(*) from table01;

-- ex16) sakila db에서 검색 및 개수 출력
select * from actor;
select * from city;
select count(*) from city;
-- 검색 로우의 개수가 다른것을 검색으로 같이 사용할 수 없다
select count(*), city_id from city;

-- ex17) 출력개수 제한 - 0번부터 6개
select * from city limit 0,6;
select * from city limit 6;
-- index 2번부터 3개
select * from city limit 2,3;

-- ex18) 선택적으로 로우 검색
select name from table01;
select id, name from table01;
select id, name, name from table01;

-- ex19) 선택컬럼에 산술식을 사용할 수 있다.
select name, salary from table01;
select name, salary, salary*0.1 from table01;

-- ex20) 컬럼명에 별칭 사용
select name as 이름, salary as 급여 from table01;
select name, salary * 0.1 as 보너스, salary+salary*0.1 as 실수령액 from table01;

-- as 생략가능
select name 이름, salary 급여 from table01;

-- 별칭 사이에 공백이 들어가는 경우 백쿼터이용
select name `이 름`, salary `급 여` from table01;

-- 단순 쿼리 정리
select name `이 름`, salary * 12 `연    봉` from table01;

-- ex21) 컬럼연결이 필요한 경우(컬럼+컬럼 >> 컬럼컬럼)
select concat(name, salary) 이름급여 from table01;
select concat(name, '님의 급여는', salary,'원입니다') 이름급여 from table01;
select concat('님의 급여는', concat (salary,'원입니다')) 이름급여 from table01;

-- ex22) 단순 산술식이나 날짜를 얻고 싶을때 - 가상테이블
select 3*5 from dual;
select sysdate(), 3*7 from dual;
-- 몫값은 실제 연산 결과 값이다. 소숫점까지
select 9+2, 9-2, 9*2, 9/2, 9%2 from dual;

-- ex23) null 검색
select * from table01;
select * from table01 where salary = null; -- 아주 조심 해야하는 문장
select * from table01 where salary is null;
select name from table01 where salary is not null;
select name `급여를 받는 사람` from table01 where salary is not null;

-- ex24)
CREATE TABLE table02 (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45),
  salary INT,
  bonus INT,
  PRIMARY KEY (id));

-- ex25) 직원들의 연간 총소득을 모두 검색하여 출력
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

-- ex28 중복제거
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



