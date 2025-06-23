CREATE DATABASE Learning_Space;
USE Learning_space;
CREATE TABLE science_curriculum (
    enrollment_id INTEGER NOT NULL PRIMARY KEY,
    enrollment_name VARCHAR(255),
    science_marks INTEGER
);
SHOW TABLES;
USE learning_space;
SELECT * FROM science_curriculum;
SHOW TABLES;
SHOW DATABASES;
INSERT INTO science_curriculum(enrollment_id, enrollment_name, science_marks) VALUES (4, 'David', 80);
INSERT INTO science_curriculum (enrollment_id, enrollment_name, science_marks) VALUES (5, 'Eva', 75);
INSERT INTO science_curriculum (enrollment_id, enrollment_name, science_marks) VALUES (6, 'Frank', 65);
INSERT INTO science_curriculum (enrollment_id, enrollment_name, science_marks) VALUES (7, 'Grace', 88);
INSERT INTO science_curriculum (enrollment_id, enrollment_name, science_marks) VALUES (8, 'Hannah', 90);
INSERT INTO science_curriculum (enrollment_id, enrollment_name, science_marks) VALUES (9, 'Isaac', 70);
INSERT INTO science_curriculum (enrollment_id, enrollment_name, science_marks) VALUES (10, 'Jack', 85);
INSERT INTO science_curriculum (enrollment_id, enrollment_name, science_marks) VALUES (11, 'Kara', 95);
INSERT INTO science_curriculum (enrollment_id, enrollment_name, science_marks) VALUES (12, 'Liam', 78);
INSERT INTO science_curriculum (enrollment_id, enrollment_name, science_marks) VALUES (13, 'Mia', 82);
INSERT INTO science_curriculum (enrollment_id, enrollment_name, science_marks) VALUES (14, 'Noah', 89);
UPDATE science_curriculum
SET science_marks=90 where enrollment_id=1;

SELECT DISTINCT enrollment_id, enrollment_name, science_marks 
FROM science_curriculum 
WHERE enrollment_id=1;
INSERT INTO science_curriculum (enrollment_id, enrollment_name, science_marks) 
VALUES (15, 'Robb', 99);


SELECT * 
FROM science_curriculum
WHERE enrollment_name = 'Robb';

DELETE FROM science_curriculum
WHERE enrollment_id=15;
ALTER TABLE science_curriculum
RENAME COLUMN science_marks TO marks_obtained;

UPDATE science_curriculum
SET  marks_obtained=65
WHERE enrollment_id=2;
USE learning_space;
DROP TABLE science_curriculum;
show tables;
SELECT*FROM SCIENCE_CURRICULUM;

