SELECT TO_CHAR(50000, 'fm99,999') FROM dual;


create table member_tbl_02 (
  custno  number(6) not null primary key, 
  custname varchar2(20),
  phone varchar2(13),
  address varchar2(60),
  joindate date,
  grade char(1),
  city char(2)
);

select custno,custname, phone, address, 
       to_char(joindate, 'YYYY-MM-DD') as joindate,
       DECODE(grade, 'A', 'VIP','B','일반','C','직원') as grade,
       city
from member_tbl_02;

create sequence member_seq 
increment by 1
start with 100001
minvalue 100001
maxvalue 999999
nocycle
nocache;

INSERT INTO member_tbl_02 VALUES(member_seq.nextval, '김행복', '010-1111-2222','서울 동대문구 휘경1동','2015-12-02','A','01');
INSERT INTO member_tbl_02 VALUES(member_seq.nextval, '이축복', '010-1111-3333','서울 동대문구 휘경2동','2015-12-06','B','01');
INSERT INTO member_tbl_02 VALUES(member_seq.nextval, '장믿음', '010-1111-4444','울릉군 울릉읍 독도1리','2015-10-01','B','30');
INSERT INTO member_tbl_02 VALUES(member_seq.nextval, '최사랑', '010-1111-5555','울릉군 울릉읍 독도2리','2015-11-13','A','30');
INSERT INTO member_tbl_02 VALUES(member_seq.nextval, '진평화', '010-1111-6666','제주도 제주시 외나무골','2015-12-25','B','60');
INSERT INTO member_tbl_02 VALUES(member_seq.nextval, '차공단', '010-1111-7777','제주도 제주시 감나무골','2015-12-11','C','60');

CREATE TABLE money_tbl_02(
  custno number(6) not null,
  salenol number(8) not null,
  pcost number(8),
  amount number(4),
  price number(8),
  pcode varchar2(4),
  sdate date,
  CONSTRAINT money_pk PRIMARY KEY(custno, salenol)
);

INSERT INTO money_tbl_02 VALUES (100001, 20160001, 500,5,2500,'A001','2016-01-01');
INSERT INTO money_tbl_02 VALUES (100001, 20160002, 1000,4,4000,'A002','2016-01-01');
INSERT INTO money_tbl_02 VALUES (100001, 20160003, 500,3,1500,'A008','2016-01-01');
INSERT INTO money_tbl_02 VALUES (100002, 20160004, 2000,1,2000,'A004','2016-01-02');
INSERT INTO money_tbl_02 VALUES (100002, 20160005, 500,1,500,'A001','2016-01-03');
INSERT INTO money_tbl_02 VALUES (100003, 20160006, 1500,2,3000,'A001','2016-01-03');
INSERT INTO money_tbl_02 VALUES (100004, 20160007, 500,2,1000,'A001','2016-01-04');
INSERT INTO money_tbl_02 VALUES (100004, 20160008, 300,1,300,'A005','2016-01-04');
INSERT INTO money_tbl_02 VALUES (100004, 20160009, 600,1,600,'A006','2016-01-04');
INSERT INTO money_tbl_02 VALUES (100004, 20160010, 3000,1,3000,'A007','2016-01-04');

SELECT * FROM money_tbl_02;

SELECT  c.custno, custname, 
        DECODE(grade, 'A', 'VIP','B','일반','C','직원') as grade,
        sum(price) as price        
FROM  member_tbl_02 c, money_tbl_02 m
WHERE c.custno = m.custno
GROUP BY c.custno, custname, grade
ORDER BY price desc;







