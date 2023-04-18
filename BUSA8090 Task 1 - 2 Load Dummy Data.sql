/* README
Student ID: 46228241
Student Name: Jeremy Hong
BUSA8090 Task 1 - Case Study 2 - ProApp
File purpose: Load Database with dummy data for queries
*/

USE ProApp;

INSERT INTO PROFICIENCY
VALUES
	(0,'Not Proficient'),
	(1,'Apprentice'),
	(2,'Master'),
	(3,'Specialist')
;

INSERT INTO APPLICANT_STATUS
VALUES
	(-1,'Rejected'),
	(0,'Not Yet Started'),
	(1,'In Progress'),
	(2,'In training'),
	(3,'Approved')
;

INSERT INTO EDU_LEVEL
VALUES
	(0,'No formal education'),
	(1,'Primary'),
	(2,'Secondary'),
	(3,'Trade School'),
	(4,'University and above')
;

INSERT INTO JOB_STATUS
VALUES
	(-1,'Cancelled'),
	(0,'Not Yet Started'),
	(1,'In Progress'),
	(2,'Completed')
;

INSERT INTO PAY_STATUS
VALUES
	(0,'Open'),
	(1,'Partial Paid'),
	(2,'Fully Paid')
;


INSERT INTO USER
VALUES
	(1,'Leonard','Leonard@gmail.com',400555000,'2021-04-01','2021-06-01'),
	(2,'Sheldon','Sheldon@gmail.com',400555001,'2021-04-02','2021-06-02'),
	(3,'Penny','Penny@gmail.com',400555002,'2021-04-03','2021-06-03'),
	(4,'Howard','Howard@gmail.com',400555003,'2021-04-04','2021-06-04'),
	(5,'Raj','Raj@gmail.com',400555004,'2021-04-05','2021-06-05'),
	(6,'Amy','Amy@gmail.com',400555005,'2021-04-06','2021-06-06'),
	(7,'Bernadette','Bernadette@gmail.com',400555006,'2021-04-07','2021-06-07'),
	(8,'Stuart','Stuart@gmail.com',400555007,'2021-04-08','2021-06-08'),
	(9,'Ron','Ron@gmail.com',400555008,'2021-04-09','2021-06-09'),
	(10,'Andy ','Andy @gmail.com',400555009,'2021-04-10','2021-06-10'),
	(11,'April','April@gmail.com',400555010,'2021-04-11','2021-06-11'),
	(12,'Leslie','Leslie@gmail.com',400555011,'2021-04-12','2021-06-12'),
	(13,'Ann','Ann@gmail.com',400555012,'2021-04-13','2021-06-13'),
	(14,'Michael','Michael@gmail.com',400555013,'2021-04-14','2021-06-14'),
	(15,'Dwight','Dwight@gmail.com',400555014,'2021-04-15','2021-06-15'),
	(16,'Jim','Jim@gmail.com',400555015,'2021-04-16','2021-06-16'),
	(17,'Pam','Pam@gmail.com',400555016,'2021-04-17','2021-06-17'),
	(18,'Ryan','Ryan@gmail.com',400555017,'2021-04-18','2021-06-18'),
	(19,'Stanley','Stanley@gmail.com',400555018,'2021-04-19','2021-06-19'),
	(20,'Meredith','Meredith@gmail.com',400555019,'2021-04-20','2021-06-20'),
	(21,'Angela','Angela@gmail.com',400555020,'2021-04-21','2021-06-21')
;

INSERT INTO CUSTOMER
VALUES
	(1,1,2153),
	(2,2,2155),
	(3,3,2155),
	(4,4,2154)
;

INSERT INTO SUPPLIER
VALUES
	(1,18,2153,'Property'),
	(2,19,2155,'Personal Services'),
	(3,20,2155,'Motor'),
	(4,21,2154,'Motor')
;

INSERT INTO TRADE_APPLICANT
VALUES
	(1,5,2153,'Property',2,4,'2021-04-14',3),
	(2,6,2155,'Personal Services',5,0,'2021-04-14',3),
	(3,7,2155,'Motor',10,3,'2021-04-14',3),
	(4,8,2154,'Motor',20,0,'2021-04-14',3),
	(5,9,2153,'Property',6,2,'2021-04-14',3),
	(6,10,2155,'Personal Services',3,3,'2021-04-18',1),
	(7,11,2155,'Motor',19,4,'2021-04-18',3),
	(8,12,2154,'Motor',4,3,'2021-04-18',1),
	(9,13,2153,'Property',7,2,'2021-04-18',1),
	(10,14,2155,'Personal Services',9,1,'2021-04-22',1),
	(11,15,2155,'Motor',1,0,'2021-04-22',-1),
	(12,16,2154,'Motor',3,3,'2021-04-22',2),
	(13,17,2154,'Motor',2,4,'2021-04-22',0)
;

INSERT INTO TRADEPERSON
VALUES
	(1,1,1,'2021-05-10'),
	(2,2,1,'2021-05-02'),
	(3,3,2,'2021-05-07'),
	(4,4,3,'2021-05-04'),
	(5,5,2,'2021-05-15'),
	(6,7,3,'2021-05-15')
;
