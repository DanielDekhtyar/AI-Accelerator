CREATE SEQUENCE my_first_seq;



SELECT CURRVAL ('my_first_seq') --last that was used
BEGIN;
SELECT NEXTVAL ('my_first_seq')
ROLLBACK
SELECT NEXTVAL ('my_first_seq')

DROP SEQUENCE my_first_seq
	
CREATE SEQUENCE my_2nd_seq
INCREMENT BY 10
START WITH 5
MAXVALUE 35
MINVALUE 5
CYCLE

SELECT NEXTVAL ('my_2nd_seq')
SELECT CURRVAL ('my_2nd_seq')
DROP SEQUENCE my_2nd_seq;



SELECT * FROM prods
TRUNCATE prods
INSERT INTO prods
VALUES (NEXTVAL ('my_2nd_seq'),'Nokia',NULL)
