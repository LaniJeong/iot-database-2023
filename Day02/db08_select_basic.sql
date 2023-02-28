-- Active: 1677570408526@@127.0.0.1@3306@sqldb
-- 사용데이터베이스 변경
USE employees;

-- SELECT ALL X : ALL 은 *로 표시
-- 한 문장의 끝은 ;로 마침
SELECT * FROM indextbl;
SELECT * FROM employees.indextbl;	/*동일한 의미 */

SELECT * FROM employees.titles;		-- 다른 DB의 테이블에서 데이터를 가져오려면

-- 필요한 컬럼만 가져오겠다
SELECT first_name, last_name FROM indextbl;

-- sqldb를 사용
USE sqldb;

-- 조건절 검색
SELECT userID
	, name
    , birthYear
    , height
  FROM usertbl
WHERE name = '김경호';

-- 관계 연산자
SELECT *
  FROM usertbl
 WHERE birthYear >= 1970
   AND height >= 182; 

-- 사이의 값을 조회
 SELECT *
   FROM usertbl
  WHERE height BETWEEN 180 AND 183;
  
-- IN 연산자
SELECT*
  FROM usertbl
 WHERE addr = '경남' OR addr = '경북' OR addr = '전남';
 
SELECT*
  FROM usertbl
 WHERE addr IN('경남', '경북', '전남');
 
 -- 문자열 검색 - 뉴스 본문안에서 일정 단어를 검색
SELECT *
   FROM usertbl
  WHERE name LIKE '%김%';
  
-- 언더바_
SELECT *
   FROM usertbl
  WHERE name LIKE '김__';
  
-- Subquery 사용위치
-- 1. 컬럼 위치
-- 2. 테이블 위치
-- 3. 조건절 위치
-- WHERE절에 서브쿼리가 칼럼이 한개이상이거나 결과가 한 개 이상이면 조건연산자로 조회할 수 없음
SELECT name
     , height
  FROM usertbl
  WHERE height > (SELECT height FROM usertbl WHERE name = '김경호');
  
-- 가상 테이블
SELECT u.userID
	 , u.name
     , (2023 - u.birthYear) AS age
  FROM (
		SELECT userID, name, birthYear, addr
		  FROM usertbl
		) AS u
  WHERE u.birthYear > 1969;
  
-- 컬럼에 쓰는 서브쿼리
SELECT b.userID
	 , (SELECT * FROM usertbl WHERE userID = b.userID) AS '이름'
	 , b.prodName
     , b.price * b.amount AS '판매액'
  FROM buytbl AS b;

-- 정렬 Order BY : DEFAULT ASC 안적어도 오름차순
-- 내림차순 DESC
SELECT name
     , birthYear
     , height
  FROM usertbl
 WHERE birthYear > 1069
 ORDER BY birthYear ASC, height DESC;
  
 -- 중복제거 / 중복제거할 컬럼만
SELECT DISTINCT addr
  FROM usertbl;
  
-- LIIMIT 갯수 제한
USE employees;

SELECT * FROM indextbl
 LIMIT 5;

USE sqlDB;

-- 조회하면서 새로운 테이블 생성
CREATE TABLE elec_buytbl_new
SELECT num
	 , prodName
     , price
  FROM buytbl
 WHERE groupName = '전자';

