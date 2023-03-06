/* BookRentalShop 연습 */
SELECT *
  FROM divtbl;

-- 서브쿼리 - 성능이 떨어지는 영향(안좋음)
SELECT b.Author AS '저자' --1
    -- b.Division AS 

-- 서브쿼리 - 장르로 그룹핑
SELECT (SELECT Names 
	      FROM divitbl 
		 WHERE Division = bb.Division) AS '장르' 
	 , bb.chdgkq
  FROM (
		SELECT b.Division
			 , SUM(b.Price) AS '총합'
		  FROM bookstbl AS b
		 GROUP BY b.Division
	   ) AS bb;
       
-- 조인
SELECT m.Names '이름'
	 , m.Addr '주소'
     , m.Mobile '연락처'
     , r.rentalIdx
     , r.rentalDate '대여일자'
     , IFNULL(r.returnDate, '미반납') AS '반납일자'
     , b.Names '책제목'
     , b.Division '장르'
     , b.Price '금액'
  FROM membertbl AS m
  LEFT OUTER JOIN rentaltbl AS r
    ON m.memberIdx = r.memberIdx
  LEFT OUTER JOIN bookstbl AS b
    ON r.bookIdx = b.bookIdx
  LEFT OUTER JOIN divtbl AS d
    ON b.Division = d.Division
 WHERE r.rentalIdx IS NULL;
 
-- 책을 두권 이상 출판한 저자
SELECT bb.Author, bb.Division
     , d.Name As'장르', bb.출판권수, bb.합계금액
  FROM(
		SELECT b.Author
			 , b.Division
			 , COUNT(b.Author) AS '출판권수'
			 , SUM(b.Price) AS '합계금액'
		  FROM bookstbl AS b
		 GROUP BY b.Author, b.Division
		HAVING COUNT(b.Author) >= 2
	   ) AS bb
  INNER JOIN divtbl AS d
    ON bb.Division = d.Division
 ORDER BY bb.출판권수 DESC;
       



