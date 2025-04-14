/****************************** Constraints ******************************/
CREATE TABLE prods
(prod_id INT CONSTRAINT prods_prod_id_pk  PRIMARY KEY ,
prod_name VARCHAR CONSTRAINT prods_prod_name_nn  NOT NULL 
	
);

INSERT INTO prods 
VALUES (1,'iPhone')

INSERT INTO prods 
VALUES (2,null)

DROP TABLE prods

CREATE TABLE prods
(prod_id INT  ,
prod_name VARCHAR  
	
);

SELECT * FROM prods
DROP TABLE prods

	--tbl level
CREATE TABLE prods
(prod_id INT ,
prod_name VARCHAR  ,
CONSTRAINT prods_prod_id_pk  PRIMARY KEY (prod_id)
--CONSTRAINT prods_prod_name_nn  NOT NULL (prod_name)
)

DROP TABLE prods

CREATE TABLE prods
(prod_id INT CONSTRAINT prods_prod_id_pk  PRIMARY KEY ,
category CHAR(1) CONSTRAINT prods_cat_pk PRIMARY KEY,
prod_name VARCHAR CONSTRAINT prods_prod_name_nn  NOT NULL 
	
);

INSERT INTO prods
VALUES ('a', 'iPhone')

CREATE TABLE prods
(prod_id INT CONSTRAINT prods_prod_id_pk  PRIMARY KEY ,
prod_name VARCHAR CONSTRAINT prods_prod_name_uq  UNIQUE
	)
	
INSERT INTO prods
VALUES (4 , null)

SELECT * FROM prods


DROP TABLE prods

CREATE TABLE prods
(prod_id INT, 
prod_name VARCHAR, 
price NUMERIC(9,2),
CONSTRAINT prods_prod_id_pk  PRIMARY KEY (prod_id) ,
CONSTRAINT prods_prod_name_uq  UNIQUE (prod_name)
	)

INSERT INTO prods 
VALUES (4, null, 3)

SELECT * FROM prods

DROP TABLE prods

CREATE TABLE prods
(prod_id INT, 
prod_name VARCHAR, 
price NUMERIC(9,2) NOT NULL,
CONSTRAINT prods_prod_id_pk  PRIMARY KEY (prod_id) ,
CONSTRAINT prods_prod_name_uq  UNIQUE (prod_name)
	)


CREATE TABLE prods
(prod_id INT, 
prod_name VARCHAR, 
price NUMERIC(9,2) NOT NULL,
CONSTRAINT prods_prod_id_pk  PRIMARY KEY (prod_id) ,
CONSTRAINT prods_prod_name_uq  UNIQUE (prod_name),
 CHECK (price > 0)
	)


INSERT INTO prods
VALUES (1,'iPhone',10000)

INSERT INTO prods
VALUES (2,'uPhone',-10000)

CREATE TABLE prods
(prod_id INT, 
prod_name VARCHAR, 
price NUMERIC(9,2) CONSTRAINT prods_price_ck CHECK (price > 0),
category_id INT,
CONSTRAINT prods_prod_id_pk  PRIMARY KEY (prod_id) ,
CONSTRAINT prods_prod_name_uq  UNIQUE (prod_name)

	)

DROP TABLE prods

CREATE TABLE categories
(cat_id INT PRIMARY KEY,
cat_name VARCHAR NOT NULL,
CHECK (LENGTH(cat_name)>1)
	)

--DROP TABLE categories
CREATE TABLE prods
(prod_id INT, 
prod_name VARCHAR, 
price NUMERIC(9,2) CONSTRAINT prods_price_ck CHECK (price > 0),
cat_id INT  ,
CONSTRAINT prods_prod_id_pk  PRIMARY KEY (prod_id) ,
CONSTRAINT prods_prod_name_uq  UNIQUE (prod_name),
CONSTRAINT prod_cat_id_fk FOREIGN KEY (cat_id) REFERENCES categories(cat_id)

	)

INSERT INTO categories
VALUES (1, 'Toys')


SELECT * FROM categories
INSERT INTO prods 
VALUES (100, 'car',13.7,1)


SELECT * FROM prods

INSERT INTO prods 
VALUES (101, 'kia car',150000,null)


DROP TABLE prods
	
--fk column level	
CREATE TABLE prods
(prod_id INT CONSTRAINT prods_prod_id_pk  PRIMARY KEY, 
prod_name VARCHAR CONSTRAINT prods_prod_name_uq  UNIQUE, 
price NUMERIC(9,2) CONSTRAINT prods_price_ck CHECK (price > 0),
cat_id INT CONSTRAINT prod_cat_id_fk REFERENCES  categories(cat_id)
 )

---remake with errors?
DROP TABLE prods;
DROP TABLE categories;
	
CREATE TABLE categories
(cat_id INT PRIMARY KEY ,
cat_name VARCHAR NOT NULL,
CHECK (LENGTH(cat_name)>1)
	)

CREATE TABLE prods
(prod_id INT CONSTRAINT prods_prod_id_pk  PRIMARY KEY, 
prod_name VARCHAR CONSTRAINT prods_prod_name_uq  UNIQUE, 
price NUMERIC(9,2) CONSTRAINT prods_price_ck CHECK (price > 0),
cat_id INT CONSTRAINT prod_cat_id_fk REFERENCES  categories(cat_id)
 )


INSERT INTO categories
VALUES (1,'Toys'),(2,'Phones'),(3,'Cars');

INSERT INTO prods
VALUES (10,'hot wheels city car',13.7,1),
		(20,'Barbie',87,1),
		(30,'Cherry tigo',180000,3),
		(40, 'iPhone',5000,2)

SELECT * FROM categories
SELECT * FROM prods

DELETE fROM categories WHERE cat_id =1

SELECT * FROM prods


----ON DELETE  SET NULL/CASCADE
DROP TABLE prods;
DROP TABLE categories;

CREATE TABLE categories
(cat_id INT CONSTRAINT cat_id_pk PRIMARY KEY ,
cat_name VARCHAR NOT NULL,
CHECK (LENGTH(cat_name)>1)
	);

ALTER TABLE categories
ALTER COLUMN cat_name DROP NOT NULL;


	
CREATE TABLE prods
(prod_id INT CONSTRAINT prods_prod_id_pk  PRIMARY KEY, 
prod_name VARCHAR CONSTRAINT prods_prod_name_uq  UNIQUE, 
price NUMERIC(9,2) CONSTRAINT prods_price_ck CHECK (price > 0),
cat_id INT CONSTRAINT prod_cat_id_fk REFERENCES  categories(cat_id) --ON DELETE /*SET NULL*/CASCADE
 );


INSERT INTO categories
VALUES (1,'Toys'),(2,'Phones'),(3,'Cars');

INSERT INTO prods
VALUES (10,'hot wheels city car',13.7,1),
		(20,'Barbie',87,1),
		(30,'Cherry tigo',180000,3),
		(40, 'iPhone',5000,2)

SELECT * FROM categories
SELECT * FROM prods

DELETE fROM categories WHERE cat_id =1

SELECT * FROM prods



ALTER TABLE categories
ADD CONSTRAINT cat_cat_name_uk UNIQUE (cat_name);

CREATE TABLE students2
(id INT, name varchar);

ALTER TABLE students2
ADD cONSTRAINT stu_id_pk PRIMARY KEY (id);

ALTER TABLE students2
DROP CONSTRAINT stu_id_pk


ALTER TABLE categories
DROP CONSTRAINT cat_id_pk CASCADE
