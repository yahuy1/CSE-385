use University;
drop table Enroll;
drop table Student;
drop table Class;
drop table Faculty;

CREATE TABLE Student (
studId VARCHAR(6) PRIMARY KEY,
lastName VARCHAR(20) NOT NULL ,
firstName VARCHAR(20) NOT NULL ,
major VARCHAR(20) ,
credits DECIMAL(3) DEFAULT 0,
CONSTRAINT Student_credits_cc CHECK ((credits>=0) AND (credits
<150)));
CREATE TABLE Faculty (
facId VARCHAR(6),
name VARCHAR(20),
department VARCHAR(20),
therank VARCHAR(20),
CONSTRAINT faculty_facId_pk PRIMARY KEY (facId));
CREATE TABLE Class(
classNumber VARCHAR(8),
facId VARCHAR(6),
schedule VARCHAR(8),
room VARCHAR(6),
CONSTRAINT class_classNumber_pk PRIMARY KEY (classNumber),
CONSTRAINT class_schedule_uk UNIQUE (schedule,room));
CREATE TABLE ENROLL(
studId VARCHAR(6),
classNumber VARCHAR(8),
grade VARCHAR(2),
CONSTRAINT Enroll_ClassNumber_studId_pk PRIMARY KEY(classNumber,
studId),
CONSTRAINT Enroll_ClassNumber_fk FOREIGN KEY (classNumber)
REFERENCES Class (classNumber),
CONSTRAINT Enroll_studId_fk FOREIGN KEY (studId) REFERENCES Student
(studId) );

Insert into Student values ('S1001','Smith','Tom','History',90);
Insert into Student values ('S1002','Chin','Anne','Math',36);
Insert into Student values ('S1005','Lee','Perry','History',3);
Insert into Student values ('S1010','Burns','Edward','Art',63);
Insert into Student values ('S1013','McCarthy','Owen','Math',0);
Insert into Student values ('S1015','Jones','Mary','Math',42);
Insert into Student values ('S1020','Rivera','Jane','CSC',15);
Insert into Faculty values ('F101','Adams','Art','Professor');
Insert into Faculty values ('F105','Tanaka','CSC','Instructor');
Insert into Faculty values ('F110','Byrne','MATH','Assistant');
Insert into Faculty values ('F115','Smith','HISTORY','Associate');
Insert into Faculty values ('F221','Smith','CSC','Professor');
Insert into Class values ('ART103A','F101','MWF9','H221');
Insert into Class values ('CSC201A','F105','TuThF10','M110');
Insert into Class values ('CSC203A','F105','MTHF12','M110');
Insert into Class values ('HST205A','F115','MWF11','H221');
Insert into Class values ('MTH101B','F110','MTuTh9','H225');
Insert into Class values ('MTH103C','F110','MWF11','H225');
Insert into Enroll values ('S1001','ART103A','A');
Insert into Enroll values ('S1001','HST205A','C');
Insert into Enroll values ('S1002', 'ART103A','D');
Insert into Enroll values ('S1002','CSC201A','F');
Insert into Enroll values ('S1002','MTH103C','B');
Insert into Enroll values ('S1020','CSC201A','B');
Insert into Enroll values ('S1020','MTH101B','A');
Insert into Enroll(studId, classNumber) values ('S1010','ART103A');
Insert into Enroll(studId, classNumber) values ('S1010','MTH103C');