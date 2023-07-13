CREATE TABLE Movie
(MovieID int primary key,
MovieName varchar(50) Not null,
MovieType varchar(50),
MovieLanguage Varchar(50)
);
describe Movie;

INSERT INTO Movie VALUES
(11,'Dhamal','Comedy','Hindi'),
(12,'kanchna','Horror','Tamil'),
(13,'Hit','Drama','English'),
(14,'Halchal','Action','Hindi');
SELECT*FROM Movie;

CREATE TABLE Producer
(ProducerID INT Primary key,
ProducerName Varchar(50) unique,
Location  Varchar(50) NOT NULL
);
describe Producer;  

INSERT INTO Producer VALUES
(101,'Ravi','Mumbai'),
(102,'Ragesh','Panvel'),
(103,'Raman','Thane'),
(104,'Pari','pune');

Select*From Producer;

CREATE TABLE Actor
(ActorID INT Unique,
ActorName varchar(50),
Location Varchar(50) NOT NULL,
Age INT ,
MovieID int,
Foreign key(MovieID) References Movie(MovieID)
);
Describe Actor;

INSERT INTO Actor VALUES
(01,'Khushi','Mumbai', 22 , 11),
(02,'Daya','Thane', 20 , 12),
(03,'Nihal','Mumbai', 25 , '13'),
(04,'Dips','Nagar', 22 , 14),
(05,'Abhi','Mumbai', 32 , 11),
(06,'Tonny','Sangali', 32 , 12),
(07,'Sonal','Latur', 17 , 11),
(08,'Aani','Mumbai', 29, 11),
(09,'Riya','Pune', 35 , 12);

Select*from Actor;

CREATE TABLE Review
(MovieID INT ,
MovieName Varchar(50) NOT NULL,
Review varchar(50)
);
describe Actor;

INSERT INTO Review VALUES 
(11, 'Dhamal','Good'),
(12, 'Kanchna','Excellent'),
(13, 'Hit','Good'),
(14, 'Halchal','Excellent');
Select*from Review;

CREATE TABLE Plot
(MovieName Varchar(50) NOT NULL,
MoviePlot Varchar(50)
);
describe Plot;

INSERT INTO Plot VALUES 
('Dhamal','Its Comedy movie'),
('Kanchna','Its Horror movie'),
('Hit','Its Drama movie'),
('Halchal','Its Action movie');
Select*from Plot;

#IN
Select*from Actor
WHERE Location IN('Mumbai','Latur')
Order by Age;

select*from Actor
WHERE Age BETWEEN 17 AND 29
Order by Age DESC;
#Upeer and Lower
SELECT UPPER('Actor');
SELECT LOWER('Plot');

#Aggregate function
SELECT*FROM Actor;
SELECT SUM(Age) As 'Sum Of Age ' FROM Actor;

SELECT Avg(Age) AS 'Avg Of Age ' FROM ACTOR;

SELECT MIN(Age) As 'Min of Age' FROM Actor;

SELECT MAX(Age) As 'Max of Age' FROM Actor;

SELECT Count(ActorId) AS 'No of Actor' FROM  Actor;

#Group by
SELECT * From Actor;
SELECT LOCATION, Max(Age) FROM Actor
Group by LOCATION;

SELECT LOCATION, Count(Age) FROM Actor
Group by LOCATION;

SELECT*FROM Movie;

SELECT MovieLanguage, count(MovieID) FROM Movie
Group by MovieLanguage;

SELECT MovieLanguage, sum(MovieID) FROM Movie
Group by MovieLanguage
Having MovieLanguage = 'Hindi';
#Transition
SAVEPOINT Savepoint1;
INSERT  INTO Movie VALUES(15,'harry','Comedy','Hindi');
SELECT * FROM Movie;
DELETE FROM Movie WHERE MovieID=15;
ROLLBACK;

#Highest price using LIMIT;
SELECT * FROM Actor
ORDER BY Age DESC
LIMIT 1;

SELECT * FROM Actor
ORDER BY Age DESC
LIMIT 3;

#Display full information of suquery
SELECT * FROM Actor
ORDER BY Age DESC
LIMIT 1
OFFSET 3;


#Forth highest Age
SELECT * FROM ACTOR
WHERE Age=
(SELECT Max(Age) FROM Actor
WHERE Age<
(SELECT Max(Age) FROM Actor 
WHERE Age<
(SELECT Max(Age) FROM Actor
WHERE Age<
(SELECT Max(Age) FROM Actor))));

#Alter
ALTER TABLE Actor
ADD COLUMN DateofBirth DATE;

SELECT * FROM Actor;

#Insert Data Intio New Column
UPDATE Actor
SET DateofBirth= '2000-09-15'
WHERE ActorID = 1;

#Alter + Change
ALTER TABLE  Actor
CHANGE COLUMN DateofBirth DOB DATE;

SELECT * FROM Actor;

#Rename Table 
RENAME TABLE Movie To Movies;
SELECT * FROM Movies;

#Join