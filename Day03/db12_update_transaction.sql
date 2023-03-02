-- UPDATE  & TRANSACTION
START TRANSACTION;

-- Warning! UPDATE 구문에서는 WHERE절 빼면 안됨!
UPDATE usertbl_bak
   SET mobile1 = '010'
	 , mobile2 = '66667788'
     , addr = '부산'
 WHERE userID = 'SMG';

COMMIT;
ROLLBACK;

-- DELET
-- WHERE 빠지면 
DELETE FROM usertbl
 WHERE userID = 'IM';