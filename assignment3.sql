/******************************************
		PROG8080: Assignment 3
	Name:			Lucas Currah
	Student Number: 7674542
	Date:			9 October, 2016
******************************************/

PRINT ''
PRINT 'Question 1'

SELECT c.number, pr.prerequisiteNumber  
	FROM CoursePrerequisiteAnd as pr, Course as c
	WHERE pr.courseNumber = c.number AND
	c.number = 'COMP2280'
	ORDER BY pr.prerequisiteNumber

PRINT ''
PRINT 'Question2'

SELECT e.number, p.firstName, p.lastName
	FROM Employee as e, Person as p
	WHERE e.number = p.number AND
	LEFT(p.lastName,1) = 'W'

PRINT ''
PRINT 'Question 3'

SELECT s.number, p.firstName, p.lastName, p.city
	FROM Person as p LEFT OUTER JOIN Student as s ON
	p.number = s.number 
	WHERE s.number IS NULL

PRINT ''
PRINT 'Question 4'

SELECT s.uniqueId, s.product
	FROM Room as r INNER JOIN LabSoftware as ls ON
	r.id = ls.roomId
	INNER JOIN Software as s ON
	s.uniqueId = ls.softwareUniqueId
	WHERE r.number = '2A205'

PRINT ''
PRINT 'Question 5'

SELECT co.sessionCode, co.courseNumber, p.firstName, p.lastName
	FROM CourseOffering as co INNER JOIN Employee e
	ON co.employeeNumber = e.number INNER JOIN Person p
	ON e.number = p.number
	WHERE co.sessionCode = 'F10'
	ORDER BY co.courseNumber

PRINT ''
PRINT 'Question 6'

SELECT CONCAT(p.firstName, ' ', p.lastName) as "Name", 
	p.collegeEmail, so.notes
	FROM Student as s INNER JOIN StudentOffence as so
	ON s.number = so.studentNumber INNER JOIN Person as p
	ON s.number = p.number

PRINT ''
PRINT 'Question 7'

SELECT e1.number as "Employee", e1.reportsTo as "Employee Reports To", 
	e2.reportsTo as "Supervisor Reports To"
	FROM Employee as e1 LEFT OUTER JOIN Employee as e2
	ON e1.reportsTo = e2.number
	ORDER BY e1.number

PRINT ''
PRINT 'Question 8'

SELECT CONCAT(LEFT(p.firstName,1), LEFT(p.lastName, 7)) as "User ID",
	e.schoolCode, e.extension
	FROM Employee as e LEFT JOIN Person as p
	ON e.number = p.number
	WHERE LEFT(p.lastName,1) = 'K'
	ORDER BY "User ID"

PRINT ''
PRINT 'Question 9'

SELECT c.number, c.hours, c.credits, c.name
	FROM Course as c INNER JOIN CourseOffering as co 
	ON c.number = co.courseNumber 
	WHERE co.sessionCode = 'F16' AND CHARINDEX('Programming', c.name) > 0
	ORDER BY c.number
