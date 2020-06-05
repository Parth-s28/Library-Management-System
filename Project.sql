use [LIBRARY_PES];

CREATE SCHEMA [LIBRARY] AUTHORIZATION [PUBLIC];

CREATE TABLE LIBRARY.BOOK(
B_no varchar(10) not null,
Subject_Name char(30) ,
B_Name char(25) not null,
Author  char(20) not null,
Publisher char(20) not null,
Editor char(30) not null,
Copies int not null,
Cost int not null,
PRIMARY KEY(B_no,B_Name));

/* DROP TABLE LIBRARY.Issue; */

CREATE TABLE LIBRARY.Issue(
Bno varchar(10) not null,
Id1  varchar(25) ,
Id2 varchar(25) ,
Issue_date  date not null ,
book_name char(25) not null,
Due_date date not null ,
PRIMARY KEY(Bno,book_name),
FOREIGN KEY(Bno,book_name) REFERENCES LIBRARY.BOOK(B_no,B_name),
FOREIGN KEY(Id1) REFERENCES LIBRARY.student(st_ID),
FOREIGN KEY(Id2) REFERENCES LIBRARY.teacher(T_ID),
constraint ck_Due_date check (Due_date > Issue_date));


/* DROP TABLE LIBRARY.Issue; */



CREATE TABLE LIBRARY.staff(
s_name varchar(15) not null,
s_Id varchar(10) not null,
j_date date not null,
s_password varchar(14) not null CHECK(s_password like '%[0-9]%' and s_password like '%[A-Z]%' and s_password like '%[!@#$%a^&*()-_+=.,;:]%' and len(s_password)>=8),
Salary DECIMAL(10,2) ,
PRIMARY KEY(s_Id));

/* DROP TABLE LIBRARY.staff; */

CREATE TABLE LIBRARY.student(
st_ID varchar(25) not null,
st_name char(15) not null,
Semester int not null,
B_num varchar(10) not null,
Book_issued char(25) not null,
PRIMARY KEY(st_ID),
FOREIGN KEY(B_num,Book_issued) REFERENCES LIBRARY.BOOK(B_no,B_Name));


/* DROP TABLE LIBRARY.teacher; */

CREATE TABLE LIBRARY.teacher(
T_ID varchar(25) not null,
T_Name varchar(10) not null,
Book_no varchar(10) not null,
Subject char(30) ,
Book_name char(25) not null
PRIMARY KEY(T_ID),
FOREIGN KEY (Book_no,Book_name) REFERENCES LIBRARY.BOOK(B_no,B_Name));

/* DROP TABLE LIBRARY.return_book; */


CREATE TABLE LIBRARY.return_book(
Book_no varchar(10) not null,
Book_name char(25) not null,
ID1 varchar(25) ,
ID2 varchar(25) , 
Issue_date date not null,
due_date date not null,
return_date date not null ,
PRIMARY KEY(Book_no,Book_name),
FOREIGN KEY(Book_no,Book_name) REFERENCES LIBRARY.BOOK (B_no,B_Name),
FOREIGN KEY(ID1) REFERENCES LIBRARY.student(st_ID),
FOREIGN KEY(ID2) REFERENCES LIBRARY.teacher(T_ID),
constraint ck_ret_date check(return_date <= due_date));




INSERT INTO LIBRARY.BOOK VALUES('B_12345611','Electrical Science', 'Intro to Electrical', 'Hughes', 'Pearson','Jack Kilby',56,976);
INSERT INTO LIBRARY.BOOK VALUES('B_12345612','Electronics', 'Basic Electronics', 'Rajappa', 'MK Publishers','Namita',23, 800);
INSERT INTO LIBRARY.BOOK VALUES('B_12345613','ECE', 'DSP', 'Proakis', 'Cengage','Alex',112, 1800);
INSERT INTO LIBRARY.BOOK VALUES('B_12345614','Electronics', 'OP-AMP', 'RAJA V', 'BK Publisher','Rajappa',68, 400);
INSERT INTO LIBRARY.BOOK VALUES('B_12345615','CSE', 'Machine Learning', 'Andrew NG', 'Pearson','Harley Barne',344, 2100);
INSERT INTO LIBRARY.BOOK VALUES('B_12345616','CSE', 'Deep Learning With Python', 'Francois Chollet', 'Manning Publications','Eventos',550, 2300);
INSERT INTO LIBRARY.BOOK VALUES('B_12345617','Electrical Science', 'Intro To Transformers', 'B.L. Thereaja', 'TATA McGraw Hill','Gargi Sinha',342,889);
INSERT INTO LIBRARY.BOOK VALUES('B_12345618','Mechanical Engineering', 'Automobile Engineering', 'R.K. Rajput', 'Firewall India','R.k. Rajput',431,489);
INSERT INTO LIBRARY.BOOK VALUES('B_12345619','Mechanical Engineering', 'Fluid Mechanics', 'R.K. Bansal', 'Laxmi Publications','Indira',13,576);
INSERT INTO LIBRARY.BOOK VALUES('B_12345620','CSE', 'C Programming', 'Dennis Ritchie', 'Cengage','Eventos',344,678);
INSERT INTO LIBRARY.BOOK VALUES('B_12345621','CSE', 'DBMS', 'Navathe', 'Pearson','Elmasri',455,1022);
INSERT INTO LIBRARY.BOOK VALUES('B_12345622','Mechanical Engineering', 'Thermoynamics', 'B.K. Rajput', 'Firewall India','Gargi Sinha',322,234);
INSERT INTO LIBRARY.BOOK VALUES('B_12345623','Mechanical Engineering', 'Material Sciences', 'William Callister', 'Wiley','Watson',242,877);
INSERT INTO LIBRARY.BOOK VALUES('B_12345624','Electronics', 'Types Of Transistors', 'D.Devadiga', 'Laxmi Publications','Thimmaiah',43,430);
INSERT INTO LIBRARY.BOOK VALUES('B_12345625','Electronics', 'More About Diodes', 'Rajappa', 'MK Publishers','Namita',21,134);
INSERT INTO LIBRARY.BOOK VALUES('B_12345626','ECE', 'Power Electronics', 'Muhammad ashid', 'Pearson','Abdul',42,1222);
INSERT INTO LIBRARY.BOOK VALUES('B_12345627','ECE', 'Signals And Systems', 'Allan V. Coppenheim', 'Pearson','Alex',412,1200);
INSERT INTO LIBRARY.BOOK VALUES('B_12345628','ECE', 'Intro to VLSI Design', 'Debaprasad Das', 'Pearson','Rictor',342,989);
INSERT INTO LIBRARY.BOOK VALUES('B_12345629','Electrical Sciences', 'Intro To Resistors', 'Rachit Gupta', 'MK Publishers','Gupta',34,152);
INSERT INTO LIBRARY.BOOK VALUES('B_12345630','Electrical Sciences', 'Intro To Capacitance', 'Rachit Gupta', 'MK Publishers','Gupta',42,122);

INSERT INTO LIBRARY.student VALUES('S_123456101','Alex',2,'B_12345611','Intro To Electrical');
INSERT INTO LIBRARY.student VALUES('S_123456102','Sameer',4,'B_12345628','Intro to VLSI Design');
INSERT INTO LIBRARY.student VALUES('S_123456103','Avinash',6,'B_12345616','Deep Learning With Python');
INSERT INTO LIBRARY.student VALUES('S_123456104','Isha',5,'B_12345619','Fluid Mechanics');
INSERT INTO LIBRARY.student VALUES('S_123456105','Alok',3,'B_12345627','Signals And Systems');
INSERT INTO LIBRARY.student VALUES('S_123456106','Neha',2,'B_12345625','More About Diodes');
INSERT INTO LIBRARY.student VALUES('S_123456107','Sara',3,'B_12345620','C Programming');
INSERT INTO LIBRARY.student VALUES('S_123456108','Alpana',5,'B_12345626','Power Electronics');
INSERT INTO LIBRARY.student VALUES('S_123456109','Danish',4,'B_12345622','Thermodynamics');
INSERT INTO LIBRARY.student VALUES('S_123456110','Partheesh',3,'B_12345621','DBMS');
INSERT INTO LIBRARY.student VALUES('S_123456111','Rajesh',5,'B_12345618','Automobile Engineering');
INSERT INTO LIBRARY.student VALUES('S_123456112','John',4,'B_12345623','Material Sciences');
INSERT INTO LIBRARY.student VALUES('S_123456113','Ravi',2,'B_12345614','OP-AMP');
INSERT INTO LIBRARY.student VALUES('S_123456114','Tejus',1,'B_12345630','Intro To Capacitance');
INSERT INTO LIBRARY.student VALUES('S_123456115','Aradhana',2,'B_12345629','Intro To Resistors');
INSERT INTO LIBRARY.student VALUES('S_123456116','Namita',4,'B_12345616','Deep Learning With Python');
INSERT INTO LIBRARY.student VALUES('S_123456117','Sapna',6,'B_12345616','Deep Learning With Python');
INSERT INTO LIBRARY.student VALUES('S_123456118','Charvi',5,'B_12345617','Intro To Transformers');
INSERT INTO LIBRARY.student VALUES('S_123456119','Gargi',2,'B_12345612','Basic Electronics');
INSERT INTO LIBRARY.student VALUES('S_123456120','Sourav',4,'B_12345621','DBMS');

SELECT * FROM LIBRARY.BOOK;

INSERT INTO LIBRARY.teacher VALUES('T_13324401','Sachin','B_12345611','Electrical Science', 'Intro to Electrical');
INSERT INTO LIBRARY.teacher VALUES('T_13324402','Sachin B','B_12345615','CSE', 'Machine Learning' );
INSERT INTO LIBRARY.teacher VALUES('T_13324403','ALOK', 'B_12345613',null,'DSP');
INSERT INTO LIBRARY.teacher VALUES('T_13324404', 'sameer','B_12345630','Electrical Sciences', 'Intro To Capacitance');
INSERT INTO LIBRARY.teacher VALUES('T_13324405', 'varun', 'B_12345628',null,'Intro to VLSI Design');
INSERT INTO LIBRARY.teacher VALUES('T_13324406', 'Vikas','B_12345617',null, 'Intro To Transformers');
INSERT INTO LIBRARY.teacher VALUES('T_13324407', 'gaurav','B_12345621','CSE', 'DBMS');
INSERT INTO LIBRARY.teacher VALUES('T_13324408', 'Danish','B_12345626','ECE', 'Power Electronics');
INSERT INTO LIBRARY.teacher VALUES('T_13324409', 'kamal','B_12345618','Mechanical Engineering', 'Automobile Engineering');
INSERT INTO LIBRARY.teacher VALUES('T_13324410', 'kunal','B_12345624','Electronics', 'Types Of Transistors');
INSERT INTO LIBRARY.teacher VALUES('T_13324411', 'alex','B_12345620','CSE', 'C Programming');
INSERT INTO LIBRARY.teacher VALUES('T_13324412', 'Harish','B_12345627',null, 'Signals And Systems' );
INSERT INTO LIBRARY.teacher VALUES('T_13324413', 'Kunal', 'B_12345621','CSE', 'DBMS');
INSERT INTO LIBRARY.teacher VALUES('T_13324414', 'Uma','B_12345614','Electronics', 'OP-AMP');
INSERT INTO LIBRARY.teacher VALUES('T_13324415', 'Waqar','B_12345623','Mechanical Engineering', 'Material Sciences');
INSERT INTO LIBRARY.teacher VALUES('T_13324416','Sumer', 'B_12345619','Mechanical Engineering', 'Fluid Mechanics' );
INSERT INTO LIBRARY.teacher VALUES('T_13324417','Saurav', 'B_12345611','Electrical Science', 'Intro to Electrical');
INSERT INTO LIBRARY.teacher VALUES('T_13324418','Denver', 'B_12345619','Mechanical Engineering', 'Fluid Mechanics');
INSERT INTO LIBRARY.teacher VALUES('T_13324419','Harsh', 'B_12345616','CSE', 'Deep Learning With Python');

select * from LIBRARY.teacher;

INSERT INTO LIBRARY.staff VALUES('DAYA','S1','1987-12-03','A12#45bcd',23000);
INSERT INTO LIBRARY.staff VALUES('ABHIJEET','S2','1988-04-28','B231*hjw',21000);
INSERT INTO LIBRARY.staff VALUES('Ravi','S3','1983-09-12','xwe12$54',23000);
INSERT INTO LIBRARY.staff VALUES('Tarun','S5','2010-11-21','de#hju43',20000);
INSERT INTO LIBRARY.staff VALUES('Tejus','S4','1980-01-21','ind3h^tqy',25000);
INSERT INTO LIBRARY.staff VALUES('Gargi','S6','1999-07-22','9(jh&231',19000);
INSERT INTO LIBRARY.staff VALUES('Ina','S7','1989-11-23','0@133abds',23500);
INSERT INTO LIBRARY.staff VALUES('Kamal','S8','1988-02-03','njc%12ed',24500);
INSERT INTO LIBRARY.staff VALUES('Zaveri','S9','1989-12-04','bick%123',23500);
INSERT INTO LIBRARY.staff VALUES('Shubham','S10','1989-09-23','inf&123s',25000);
INSERT INTO LIBRARY.staff VALUES('Mina','S11','1990-01-03','SD%12asd',26000);
INSERT INTO LIBRARY.staff VALUES('Rakesh','S12','1999-09-12','AD*34@ssh',23000);
INSERT INTO LIBRARY.staff VALUES('Ram','S13','1976-08-23','f(122$98',24500);
INSERT INTO LIBRARY.staff VALUES('Ashish','S14','1987-09-02','hi$237A0',24300);
INSERT INTO LIBRARY.staff VALUES('Furkhan','S15','1989-08-23','kin#12ed',30000);
INSERT INTO LIBRARY.staff VALUES('Abhay','S16','1999-08-12','li#54Was',24000);
INSERT INTO LIBRARY.staff VALUES('Akash','S17','1999-08-12','Ash$7612',25000);
INSERT INTO LIBRARY.staff VALUES('Akshay','S18','1997-12-03','nity#4522',26000);
INSERT INTO LIBRARY.staff VALUES('Akshat','S19','1997-03-21','rt#4512ef',28000);
INSERT INTO LIBRARY.staff VALUES('Riya','S20','1997-03-25','2@123T9iy',29500);

SELECT * FROM LIBRARY.staff;

SET DATEFORMAT 'DMY';

INSERT INTO LIBRARY.Issue VALUES('B_12345611','S_123456101','T_13324401','12-05-2020','Intro To Electrical','22-05-2020');
INSERT INTO LIBRARY.Issue VALUES('B_12345616','S_123456103','T_13324419','2020-05-23','Deep Learning With Python','2020-06-02');
INSERT INTO LIBRARY.Issue VALUES('B_12345620','S_123456107',null,'2020-04-18','C Programming','2020-04-28');
INSERT INTO LIBRARY.Issue VALUES('B_12345611',null,'T_13324417','2020-09-12', 'Intro to Electrical','2020-09-22');
INSERT INTO LIBRARY.Issue VALUES('B_12345615',null,'T_13324402','2020-10-02', 'Machine Learning','2020-10-12');
INSERT INTO LIBRARY.Issue VALUES('B_12345615','S_123456103',null,'2020-03-11','Machine Learning', '2020-03-21');
INSERT INTO LIBRARY.Issue VALUES('B_12345627','S_123456105',null,'2020-01-12','Signals And Systems','2020-01-22');
INSERT INTO LIBRARY.Issue VALUES('B_12345629','S_123456115',null,'2020-03-21','Intro To Resistors','2020-04-01');
INSERT INTO LIBRARY.Issue VALUES('B_12345617','S_123456103',null,'2020-03-21','Intro To Transformers','2020-04-01');
INSERT INTO LIBRARY.Issue VALUES('B_12345626','S_123456103',null,'2020-04-12','Power Electronics','2020-04-22');
INSERT INTO LIBRARY.Issue VALUES('B_12345618','S_123456103','T_13324409','2020-04-12','Automobile Engineering','2020-04-22');
INSERT INTO LIBRARY.Issue VALUES('B_12345618','S_123456103','T_13324409','2020-04-12','Automobile Engineering','2020-04-22');
INSERT INTO LIBRARY.Issue VALUES('B_12345619','S_123456103','T_13324409','2020-04-12','Fluid Mechanics','2020-04-22');
INSERT INTO LIBRARY.Issue VALUES('B_12345621','S_123456103',null,'2020-04-12','DBMS','2020-04-22');


SELECT * FROM LIBRARY.Issue;

SET DATEFORMAT 'DMY';
INSERT INTO LIBRARY.return_book VALUES('B_12345629','Intro To Resistors','S_123456115',null,'2020-03-21','2020-04-01','2020-03-23');
INSERT INTO LIBRARY.return_book VALUES('B_12345611','Intro to Electrical',null,'T_13324417','2020-09-12','2020-09-22','2020-09-22');
INSERT INTO LIBRARY.return_book VALUES('B_12345616','Deep Learning With Python','S_123456103',null,'2020-05-23','2020-06-02','2020-05-25');
INSERT INTO LIBRARY.return_book VALUES('B_12345620','C Programming','S_123456107',null,'2020-04-18','2020-04-28','2020-04-18');



SELECT * FROM LIBRARY.return_book;



CREATE TABLE LIBRARY.BOOK_AUDITS(
  change_id INT IDENTITY PRIMARY KEY,
  B_no varchar(10) not null,
  Subject_Name char(30) ,
  B_Name char(25) not null,
  Author  char(20) not null,
  Publisher char(20) not null,
  Editor char(30) not null,
  Copies int not null,
  Cost int not null,
  updated_at DATETIME NOT NULL,
  operation CHAR(3) NOT NULL,
  CHECK(operation = 'INS' or operation='DEL')
 );

/*DROP TABLE LIBRARY.BOOK_AUDITS; */




CREATE TRIGGER LIBRARY.BOOK_AUDIT
ON LIBRARY.BOOK
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO LIBRARY.BOOK_AUDITS(
        B_no, 
        Subject_Name,
        B_Name,
        Author,
        Publisher,
        Editor,
		Copies,
		Cost,
        updated_at, 
        operation
    )
    SELECT
        i.B_no,
        Subject_Name,
        B_Name,
        Author,
        Publisher,
		Editor,
		Copies,
		i.Cost,
        GETDATE(),
        'INS'
    FROM
        inserted i
    UNION ALL
    SELECT
        d.B_no,
        Subject_Name,
        B_Name,
        Author,
        Publisher,
        Editor,
		Copies,
		d.Cost,
        GETDATE(),
        'DEL'
    FROM
        deleted d;
END
   
 

INSERT INTO LIBRARY.BOOK(B_no,Subject_Name,B_Name,Author,Publisher,Editor,Copies,Cost) VALUES ('B_23412999','CSE','Fuzzy Logic','Andrew','Cengage','Dereth',23,890);

SELECT * FROM LIBRARY.BOOK;
SELECT * FROM LIBRARY.BOOK_AUDITS;

DELETE FROM LIBRARY.BOOK where B_no='B_23412999';
DELETE FROM LIBRARY.BOOK_AUDITS WHERE B_Name='Fuzzy Logic';




 SELECT B.Cost, B.B_Name
 FROM LIBRARY.BOOK B
 WHERE B.B_Name	IN 
 (SELECT I.book_name 
   FROM LIBRARY.Issue I
   WHERE B.B_Name=I.book_name);








SELECT I.Id1 , I.Id2
FROM LIBRARY.Issue I
WHERE I.book_name
IN 
(SELECT B.B_Name
FROM LIBRARY.BOOK B
WHERE B.B_Name='Deep Learning With Python');

SELECT B.B_Name, B.Author
FROM LIBRARY.BOOK B
WHERE EXISTS ( SELECT I.Id2 
               FROM LIBRARY.Issue I
			   WHERE I.Bno=B.B_no AND I.book_name= B.B_Name)
	AND EXISTS ( SELECT R.Id1
	             FROM LIBRARY.return_book R
				 WHERE R.Book_no=B.B_no AND R.Book_name=B.B_Name);


SELECT S.st_name, S.st_ID
FROM LIBRARY.student S
WHERE EXISTS ( SELECT I.Id1 
               FROM LIBRARY.Issue I 
			   WHERE I.Id1=S.st_ID )
		AND NOT EXISTS ( SELECT R.ID1 
		                 FROM LIBRARY.return_book R
						 WHERE R.ID1=S.st_ID);


SELECT I.Bno, I.book_name
FROM LIBRARY.Issue I
WHERE I.Id1='S_123456103'
GROUP BY I.Bno, I.book_name
HAVING COUNT(*)>5;

SELECT * FROM LIBRARY.Issue;


SELECT SUM(Cost)
FROM LIBRARY.BOOK
WHERE Copies>300;


Select B.B_no AS BOOK_NUMBER, I.book_name AS BOOK_NAME
FROM LIBRARY.BOOK B LEFT OUTER JOIN LIBRARY.Issue I
on B.B_no=I.Bno;



/*LOSSLESS DECOMPOSITION CHECK */
/* R= {Book_no,Book_name,ID1,ID2,Issue_date,due_date,return_date} */
/* This is decomposed into R1={Book_no,Book_name,ID1,ID2},R2={Issue_date,due_date,return_date} */


CREATE TABLE LIBRARY.BOOK_INFO
(
   Book_no varchar(10) ,
   Book_name char(25) ,
   ID1 varchar(25),
   ID2 varchar(25),
   PRIMARY KEY(Book_no,Book_name),
   FOREIGN KEY (Book_no,Book_name) REFERENCES LIBRARY.BOOK(B_no,B_Name));
DROP TABLE LIBRARY.BOOK_INFO;


CREATE TABLE LIBRARY.Date_Info
(
 Book_no varchar(10),
 Book_name varchar(25),
 Issue_date date,
 due_date date ,
 return_date date
 PRIMARY KEY(Issue_date));

DROP TABLE LIBRARY.Date_Info; 

INSERT INTO LIBRARY.BOOK_INFO VALUES('B_12345629','Intro To Resistors','S_123456115',null);
INSERT INTO LIBRARY.BOOK_INFO VALUES('B_12345611','Intro to Electrical',null,'T_13324417');
INSERT INTO LIBRARY.BOOK_INFO VALUES('B_12345616','Deep Learning With Python','S_123456103',null);
INSERT INTO LIBRARY.BOOK_INFO VALUES('B_12345620','C Programming','S_123456107',null);






INSERT INTO LIBRARY.Date_Info VALUES ('B_12345629','Intro To Resistors','2020-03-21','2020-04-01','2020-03-23');
INSERT INTO LIBRARY.Date_Info VALUES ('B_12345611','Intro to Electrical','2020-09-12','2020-09-22','2020-09-22');
INSERT INTO LIBRARY.Date_Info VALUES ('B_12345616','Deep Learning With Python','2020-05-23','2020-06-02','2020-05-25');
INSERT INTO LIBRARY.Date_Info VALUES ('B_12345620','C Programming','2020-04-18','2020-04-28','2020-04-18');





SELECT LIBRARY.BOOK_INFO.*, LIBRARY.Date_Info.*
    FROM LIBRARY.BOOK_INFO  INNER JOIN Library.Date_Info 
    ON Library.BOOK_INFO.Book_no = Library.Date_Info.Book_no;


SELECT * FROM LIBRARY.return_book;


/*End of Lossless Decomposition Check */