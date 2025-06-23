--1.	Retrieve all data from the table ‘Science_curriculum--
SELECT*FROM SCIENCE_CURRICULUM;
--2.	Retrieve the name of students who have scored more than 65 marks--
SELECT NAME 
FROM SCIENCE_CURRICULUM 
WHERE MARKS > 65;
--3.	Retrieve all data of students who have scored more than 35 but less than 65 marks--\
SELECT * 
FROM SCIENCE_CURRICULUM 
WHERE MARKS >= 35 AND MARKS <= 65;
---4.	Retrieve all other students i.e. who have scored less than or equal to 35 or more than or equal to 65.
SELECT * 
FROM SCIENCE_CURRICULUM 
WHERE MARKS <= 35 OR MARKS >= 65;