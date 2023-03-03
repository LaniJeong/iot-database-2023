USE tabledb;

CREATE TABLE TBL1 (
	ID int NOT NULL PRIMARY KEY,
    bridge int NULL,
    constents VARCHAR(5000)
);

-- sqldv DB의 usertbl 데이터 중
-- userID, name, birthYear, addr 만 가져와서
-- tabledb.usertbl에 부어넣은 것
INSERT INTO tabledb.usertbl
SELECT userID, name, birthYear, addr
  FROM sqldb.usertbl;
  
select * FROM usertbl WHERE name = '김범수';