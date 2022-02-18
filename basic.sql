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

-- ex15
-- 모두채울때 (묵시적 방법)
insert into table01 values(null,'유니콘',20,300);
-- 선택적으로 채울 때 (명시적 방법)
insert into table01(id, name, age, salary) values (null,'유니콘',20,300);
insert into table01(id, age) values (null,20);
insert into table01(age, id) values (120, null);

-- ex16) workBench에서 n개의 로우를 삭제할 때
-- 우클릭을 이용하여 n개 삭제 가능 이지만 apply 안누르면 다시 보면 삭제 안되어있음

-- ex17) 로우의 개수를 출력
select count(*) from table01;

-- ex18) sakila db에서 검색 및 개수 출력
select * from actor;
select * from city;
select count(*) from city;

