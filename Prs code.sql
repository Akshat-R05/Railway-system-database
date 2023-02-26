create database Railway;
use Railway;
CREATE TABLE PASSENGERS
(Username  VARCHAR(10)  NOT NULL,
 F_name    VARCHAR(15)  NOT NULL,
 L_name    VARCHAR(15) ,    
 Bdate     DATE         NOT NULL,
 Gender    CHAR(1),
 Age       INT,
 Mobile_no VARCHAR(11),
 City      CHAR(15),
 State     CHAR(15),
 Pincode   INT,
 PRIMARY KEY (Username));
 
 CREATE TABLE ROUTES
 ( Route_id  INT,
 Stop_code   VARCHAR(10),
  Stop_name VARCHAR(15), 
  PRIMARY KEY (Route_id));
  
 CREATE TABLE TRAINS
 (Train_no  VARCHAR(15),
 Username  VARCHAR(10)  NOT NULL,
 Route_id  INT,
 Train_name CHAR(15),
 Departure_time  VARCHAR(10),
 Arrival_time    VARCHAR(10),
 Destination     CHAR(15),
 Departure_from  CHAR(15),
 PRIMARY KEY (Train_no),
 FOREIGN KEY (Username) REFERENCES PASSENGERS(Username),
 FOREIGN KEY (Route_id) REFERENCES ROUTES(Route_id));
 
 CREATE TABLE TICKETS
 (PNR_no   INT          NOT NULL,
  Username VARCHAR(10)  NOT NULL,
  PF_name  CHAR(15),
  PL_name  CHAR(15),
  Train_no  VARCHAR(15),
  Class    VARCHAR(10),
  Departure_from   CHAR(15),
  Destination CHAR(15),
  Seat_no    VARCHAR(10),
  Departure_date      DATE,
  Departure_time   VARCHAR(15),
  PRIMARY KEY (PNR_no),
  FOREIGN KEY (Username) REFERENCES PASSENGERS(Username),
  FOREIGN KEY (Train_no) REFERENCES TRAINS(Train_no));
  
  DROP TABLE ROUTES;
  
  CREATE TABLE PAYMENT
  (TID   VARCHAR(15),
   PNR_no   INT          NOT NULL,
   Card_no  VARCHAR(20),
   Bank     CHAR (10),
   Amount   VARCHAR(10),
   PRIMARY KEY (TID),
   FOREIGN KEY (PNR_no) REFERENCES TICKETS(PNR_no));
   
   CREATE TABLE BOOKED
   ( Train_no  VARCHAR(15),
     Available_date DATE,
     Booked_seats   VARCHAR(10),
     PRIMARY KEY (Train_no, Available_date),
     FOREIGN KEY (Train_no) REFERENCES TRAINS(Train_no));
     
      CREATE TABLE AVAILABLE
   ( Train_no  VARCHAR(15),
     Available_date DATE,
     Available_seats   VARCHAR(10),
     PRIMARY KEY (Train_no, Available_date),
     FOREIGN KEY (Train_no) REFERENCES TRAINS(Train_no));
     
      CREATE TABLE WAITING
   ( Train_no  VARCHAR(15),
     Available_date DATE,
     Waiting_seats   VARCHAR(10),
     PRIMARY KEY (Train_no, Available_date),
     FOREIGN KEY (Train_no) REFERENCES TRAINS(Train_no));
     

INSERT INTO PASSENGERS
     VALUES   ('heen12a','Heena','Shah','1982-01-09','F',40,9865785280,'Delhi','Delhi',110085),
			  ('vaishh06','Vaishnavi','Sharma','2000-04-06','F',21,9722363124,'Lucknow','UP',226008),
              ('ntir5y','Nikhil','Tirkey','1991-11-21','M',30,9865785241,'Nagpur','Maharshtra',440004),
              ('24pkumar','Prashant','Kumar','2001-08-11','M',20,8586632510,'Bhavnagar','Gujarat',364530),
              ('akuu054','Akshat','Rohil','2002-09-24','M',19,9871870638,'Kochi','Kerala',682001),
              ('rai12n','Nitesh','Rai','1987-03-05','M',35,8871529683,'Jhansi','UP',284001),
              ('mg6k','Mayank','Gupta','1990-11-20','M',31,7611563210,'Ballari','Karnataka',583114),
              ('pv4ey','Priya','Varshney','1973-06-17','F',48,9089653240,'Mumbai','Maharashtra',400001),
              ('vishu07','Vishal','Goyal','1995-10-28','M',26,8965656932,'Pune','Maharashtra',111045);
                           
INSERT INTO ROUTES
       VALUES   (1,'BRY','Bareilly'),
                (2,'ORAI','Orai'),
                (3,'ITR','Itwari'),
                (4,'ADI','Ahmedabad'),
                (5,'TCR,AWY','Thrisur,Aluva'),
                (6,'WL','Warangal'),
                (7,'TK,RRB','Tumkur,Birur'),
                (8,'TNA','Thane'),
	            (9,'Null','No stop');
      
INSERT INTO TRAINS
     VALUES     ('04943','heen12a',1,'Lko Ndls','05:00','11:00','Lucknow','Delhi'),
                ('16093','vaishh06',2,'Lucknow Express','12:00','19:00','Chennai','Lucknow'),
                ('58833','ntir5y',3,'NGP CWA','11:35','15:15','Chhindwara','Nagpur'),
                ('12971','24pkumar',4,'Bdts Sf Exp','06:55','12:40','Bhavnagar','Mumbai'),
                ('12617','akuu054',5,'Mangladweep Exp','13:05','21:20','Delhi','Kochi'),
                ('07121','rai12n',6,'Sc Nlr Special ','16:55','00:50','Jhansi','Hyderabad'),
                ('82653','mg6k',7,'JP SUVIDHA EXP','12:00','19:00','Ballari','Hyderabad'),
                ('07618','pv4ey',8,'Tapovan Exp','16:10','22:35','Mumbai','Pune'),
                ('22106','vishu07',9,'Indrayani Exp','16:10','20:45','Thane','Pune');
                
                
INSERT INTO TICKETS
      VALUES      (110236231,'heen12a','Heena','Shah','04943','Sleeper','Delhi','Lucknow','32','2022-04-23','05:00'),
                  (556203259,'vaishh06','Vaishnavi','Sharma','16093','General','Lucknow','Chennai','26','2022-06-07','12:00'),
                  (400002159,'ntir5y','Nikhil','Tirkey','58833','AC I','Nagpur','Chhindwara','13','2022-07-23','11:35'),
                  (787896523,'24pkumar','Prashant','Kumar','12971','AC II','Mumbai','Bhavnagar','30','2022-11-10','06:55'),
                  (100632565,'akuu054','Akshat','Rohil','12617','Sleeper','Kochi','Delhi','32','2022-04-19','13:05'),
                  (520063598,'rai12n','Nitesh','Rai','07121','AC III','Hyderabad','Jhansi','3','2022-05-22','16:55'),
                  (114589682,'mg6k','Mayank','Gupta','82653','General','Hyderabad','Ballari','16','2022-04-29','12:00'),
                  (022689756,'pv4ey','Priya','Varshney','07618','AC III','Pune','Mumbai','16','2023-01-04','16:10'),
                  (598633024,'vishu07','Vishal','Goyal','22106','Sleeper','Pune','Thane','7','2023-01-04','16:10');
                  
INSERT INTO PAYMENT
      VALUES      ('VADE0B248932',110236231,4115223418653632,'HDFC','Rs500'),
				  ('6D9E895ECBC3',556203259,4577725041941672,'PNB','Rs300'),
				  ('41FF7AE1F5DD',400002159,4045143670690970,'SBI','Rs1750'),
				  ('0B17B8599F51',787896523,4676786873389430,'PNB','Rs1600'),
				  ('69CBF762AB35',100632565,4001170444337796,'HDFC','Rs500'),
				  ('AD4EECC2524D',520063598,4809115320413538,'ICICI','Rs1150'),
				  ('D98EDBEBBA1B',114589682,4802362916524487,'UBI','Rs300'),
				  ('405969E0CAC9',022689756,4059158990106781,'AXIS','Rs1150'),
				  ('7271E9B3679C',598633024,4185554736482477,'UCO BANK','Rs500');
                  

INSERT INTO BOOKED
      VALUES      ('04943','2022-04-23','1-27'),
                  ('16093','2022-06-07','10-24'),
                  ('58833','2022-07-23','1-9'),
                  ('12971','2022-11-10','3-25'),
                  ('12617','2022-04-19','1-17'),
                  ('07121','2022-05-22','1-2'),
                  ('82653','2022-04-29','1-9'),
                  ('07618','2023-01-04','1-6'),
                  ('22106','2023-01-04','1-6'); 
                  
INSERT INTO AVAILABLE 
       VALUES     ('04943','2022-04-23','31-75'),
                  ('16093','2022-06-07','25-55'),
                  ('58833','2022-07-23','13-75'),
                  ('12971','2022-11-10','26-55'),
                  ('12617','2022-04-19','30-75'),
                  ('07121','2022-05-22','3-55'),
                  ('82653','2022-04-29','15-75'),
                  ('07618','2023-01-04','7-55'),
                  ('22106','2023-01-04','7-55'); 
                      
INSERT INTO WAITING
      VALUES      ('04943','2022-04-23','28-30'),
                  ('16093','2022-06-07','1-9'),
                  ('58833','2022-07-23','10-12'),
                  ('12971','2022-11-10','1-2'),
                  ('12617','2022-04-19','18-29'),
                  ('07121','2022-05-22','0'),
                  ('82653','2022-04-29','10-14'),
                  ('07618','2023-01-04','0'),
                  ('22106','2023-01-04','0'); 
                  
select * from waiting;              
      
      
      

                

      
                
                
     
     
 




