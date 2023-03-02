-- INSERT
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('IM', '임창균', '1996','서울', '010', '19960126', 176, '2016-05-14');

INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('YKH', '유기현', '1993','서울', NULL, NULL, 176, '2016-05-14');

-- NULL 컬럼은 생략 가능
INSERT INTO usertbl
(userID, name, birthYear, addr)
VALUES
('CHW', '채형원', '1994','서울');

-- 컬럼 지정 생략가능(단, 입력할 값의 순서가 컬럼순서와 일치)
INSERT INTO usertbl VALUES
('SHW', '손현우', '1992','서울', '010', '19920618', 181, '2016-05-14');

-- AUTO INCREMENT 의 경우 필드값을 입력하지 않아도 된다
INSERT INTO buytbl
(userID, prodName, groupName, price, amount)
VALUES
('SMG', '노트북', '전자', 5000000, 1);
