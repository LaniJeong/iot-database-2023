/* DB Coding Test - 정수민 */
USE bookrentalshop;

-- 1번 문제
SELECT CONCAT(LEFT(m.Names,1),
			  ',',
              SUBSTRING(m.Names,2)
             ) AS '회원명'
	 , m.Addr AS '주소'
     , m.Mobile AS '폰번호'
     , UCASE(m.Email) As '이메일'
  FROM membertbl AS m
 ORDER BY m.Names desc;

-- 2번 문제
SELECT d.Names AS '장르'
	 , b.Author AS '작가'
	 , b.Names AS '책제목'
  FROM bookstbl AS b
 INNER JOIN divtbl AS d
 WHERE d.Division = 'B006';
 
 -- 3번 문제
 INSERT INTO divtbl
 (Division, Names)
 VALUES
 ('I002', '네트워크');
 
-- 4번 문제
START TRANSACTION;

UPDATE membertbl
   SET Levels = 'D'
	 , Mobile = '010-9839-9999'
 WHERE Names = '성명건';

-- 5번 문제
SELECT IFNULL(d.Names,'--합계--') AS '장르'
	 , CONCAT(FORMAT(SUM(b.Price),'0,000'),'원') AS '장르별 총합계'
  FROM bookstbl AS b
  JOIN divtbl AS d
    ON b.Division = d.Division
 GROUP BY d.Names
  WITH ROLLUP;


  
