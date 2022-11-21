USE University;

-- Question 1
SELECT firstName, lastName, studId 
FROM student 
WHERE major='ART';

-- Question 2
SELECT DISTINCT classNumber 
FROM enroll;

-- Question 3
SELECT firstName, lastName 
FROM student 
WHERE major='MATH' 
    AND credits > 41;

-- Question 4
SELECT firstName, lastName 
FROM student, enroll 
WHERE student.studId=enroll.studId 
    AND classNumber='MTH101B';

-- Question 5
SELECT studId, grade 
FROM enroll, class 
WHERE enroll.classNumber=class.classNumber 
    AND facId='F105';

-- Question 6
SELECT c1.classNumber, c2.classNumber, c1.room 
FROM class AS c1, class AS c2
WHERE  c1.room=c2.room
    AND c1.classNumber<c2.classNumber;

-- Question 7
SELECT s1.studId, s2.studId
FROM student AS s1, student AS s2
WHERE s1.major=s2.major
    AND s1.studId>s2.studId;

-- Question 8
SELECT studId 
FROM student
WHERE credits>50
    OR major='MATH';

-- Question 9
SELECT count(*) 
FROM student, enroll 
WHERE student.studId=enroll.studId 
    AND classNumber='ART103A' 
    AND grade IS NOT NULL;

-- Question 10
SELECT avg(credits) 
FROM student 
WHERE major='MATH';