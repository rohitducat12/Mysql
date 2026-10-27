DROP DATABASE IF EXISTS all_functions;
CREATE DATABASE all_functions;
Use all_functions;
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    Salary DECIMAL(10, 2),
    DepartmentID INT
);

-- Insert some sample data into the table
INSERT INTO Employees (FirstName, LastName, BirthDate, HireDate, Salary, DepartmentID)
VALUES
('ajay', 'Kumar尽', '1998-01-15', '2010-06-01', 60000.28, 1),
('ashish', 'Tyagi', '1985-02-20', '2012-09-15', 75000.60, 2),
('sachin', 'Diskshit', '1979-03-10', '2011-04-20', 80000.01, 1),
('richa', 'Mittal', '1990-07-12', '2015-01-05', -70000.90, 3),
('aditi', 'Bhardwaz', '1988-11-30', '2013-10-10', 68000.10, 2);

Select *
from employees;

-- 1. String Function
-- Concatenate FirstName and LastName
SELECT CONCAT(FirstName, '_', LastName) AS FullName,
      birthdate,
      departmentid
FROM Employees;

-- CONCAT_WS() (With Separator)
SELECT CONCAT_WS('-', '2026', '02', '03');

-- TRIM() Removes spaces from both sides.
SELECT TRIM('   Hello   ');

-- LTRIM() Removes spaces from the left side.
SELECT LTRIM('   Hello');

-- RTRIM() Removes spaces from the right side.
SELECT RTRIM('Hello   ');

-- Convert FirstName to uppercase
SELECT UPPER(CONCAT(FirstName, '_', LastName)) AS FirstNameUpper FROM Employees;

-- Convert LastName to lowercase
SELECT LOWER(LastName) AS LastNameLower FROM Employees;

-- Get the length of FirstName -- tell you the number of bytes 
SELECT LENGTH(FirstName) AS FirstNameLength FROM Employees;

-- Get the char_length of FirstName # tell you the number of characters 
-- CHARACTER_LENGTH() same
SELECT char_LENGTH(lastname) AS charlength,
	   LENGTH(LastName) as length
       FROM Employees;

-- Substring of FirstName
-- Same as SUBSTR()
SELECT SUBSTRING(FirstName, 2,3) AS FirstNameSub,firstname
 FROM Employees;

-- LEFT() Extracts characters from the left. 
SELECT LEFT('Hello', 2);
-- Output: He

-- RIGHT() Extracts characters from the right.
SELECT RIGHT('Hello', 2);
-- Output: lo


 

-- Capitalize of FirstName
-- No direct method to capitalize
select firstname,
concat(upper(substring(firstname,1,1)),substring(firstname,2)) as capitalname
from employees;

-- find output location of i in firstname
select firstname,locate('i',firstname)
from employees;
-- Finds position of a substring.
SELECT LOCATE('World', 'Hello World');
-- Output: 7

-- LPAD() Pads string from the left.
SELECT LPAD('5', 3, '0');
-- Output: 005
-- RPAD() Pads string from the right.
SELECT RPAD('Hi', 5, '*');

-- REVERSE() Reverses a string.
SELECT REVERSE('Hello');
-- Output: olleH

-- SPACE() Returns spaces.
SELECT CONCAT('Hi', SPACE(3), 'Hello');

-- STRCMP() Compares two strings.
SELECT STRCMP('Hello', 'Hello');
-- Output: 0

-- 0 → equal

-- -1 → first < second

-- 1 → first > second

-- ASCII() Returns ASCII value of first character.
SELECT ASCII('A');
-- Output: 65

-- CHAR() Returns character from ASCII value.
SELECT CHAR(65);
-- Output: A
-- FORMAT() Formats number as string.
SELECT FORMAT(123456.789, 2);
-- Output: 123,456.79

-- REPEAT() 
SELECT REPEAT('Hi', 3);
-- Output: HiHiHi

-- INSERT() Replaces part of a string at a position.
SELECT INSERT('Hello World', 7, 5, 'MySQL');
-- Output: Hello MySQL


-- Replace characters in LastName
SELECT REPLACE(LastName, 'i', 'o') AS LastNameReplaced FROM Employees;
###############################################################################################################
-- 2. Numeric Functions
-- Round Salary to the nearest integer
-- .50 greater next integer  
-- .50 less previous integer
select * from employees;
SELECT ROUND(Salary) AS SalaryRounded ,
Salary as Original_Salary
FROM Employees;

-- Ceiling of Salary
-- CEILING: Rounds a number up to the next nearest integer.
SELECT CEIL(Salary) AS SalaryCeiling,
Salary as Original_Salary
FROM Employees;

-- Floor of Salary
-- FLOOR: Rounds a number down to the nearest integer.
SELECT FLOOR(Salary) AS SalaryFloor,
Salary as Original_Salary
FROM Employees;

-- Absolute value of a number
-- ABS (Absolute): Returns the absolute (positive) value of a number.
SELECT ABS(Salary) AS SalaryAbsolute,
Salary as Original_Salary
FROM Employees;

-- Modulus of Salary
-- MOD (Modulus): Returns the remainder of a division operation between two numbers.
SELECT MOD(Salary, 5000) AS SalaryModulus,
Salary as Original_Salary
FROM Employees;

##############################################################################################################################3

-- 3.Date functions
-- Current date and time
SELECT  NOW() AS CurrentDateTime;
-- Current date and time with muliteples data selection
SELECT 
    FirstName,
	salary,
	NOW() AS CurrentDateTime,
    CURDATE() AS CurrentDate,
    CURTIME() As currenttime
 from employees;
 
select * from employees;
-- Extract year from HireDate
select hiredate from employees;
 -- get year from date 
SELECT HireDate,
YEAR(HireDate) AS HireYear FROM Employees;
-- get month number from date 
SELECT firstname ,
	salary,
    hiredate,
	month(HireDate) AS Hiremonth ,
    day(HireDate) as date,
    monthname(hiredate) as monthname,
    dayname(hiredate) as dayname,
    now() today_datetime
FROM Employees;
-- get month name from datae
SELECT firstname , 
salary, 
hiredate, 
monthname(hiredate) 
AS Hiremonth FROM Employees;

-- get day from the date
SELECT hiredate,
day(hiredate) AS Hiremonth 
FROM Employees;

-- get day name from the date
SELECT hiredate,
dayname(hiredate) AS Hiredate 
FROM Employees;

-- Extract month from BirthDate
SELECT MONTH(BirthDate) AS BirthMonth FROM Employees;

-- Add 1 year to HireDate
Select * from employees;

SELECT HireDate as old_date,
DATE_ADD(HireDate, INTERVAL 1 YEAR) AS HireDatePlusOneYear FROM Employees;
SELECT DATE_ADD(HireDate, INTERVAL 1 MONTH) AS HireDatePlusOneYear FROM Employees;
SELECT DATE_ADD(HireDate, INTERVAL 1 DAY) AS HireDatePlusOneYear FROM Employees;
SELECT hiredate as original_Date,
DATE_ADD(DATE_ADD(DATE_ADD(hiredate, INTERVAL 1 YEAR), INTERVAL 1 MONTH), INTERVAL 1 DAY) as new_Date
from employees;

SELECT DATE_FORMAT(hiredate, '%d/%m/%Y') as hiredate
from employees;   -- 22/11/2025

SELECT DATE_FORMAT(hiredate, '%M %d, %Y') as hiredate
from employees;  -- November 22, 2025

SELECT DATE_FORMAT(hiredate, '%M %D, %Y') as hiredate
from employees;  -- November 22, 2025

SELECT DATE_FORMAT(order_date, '%Y-%m-%d');   -- 2025-11-22 (default)

-- Calculate age of employees
SELECT TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) AS Age FROM Employees;

SELECT firstname, salary, TIMESTAMPDIFF(year, BirthDate, CURDATE()) AS Age FROM Employees;
SELECT firstname, salary, TIMESTAMPDIFF(month, BirthDate, CURDATE()) AS Age FROM Employees;
SELECT firstname, salary, TIMESTAMPDIFF(day, BirthDate, CURDATE()) AS Age FROM Employees;
SELECT firstname, salary, TIMESTAMPDIFF(hour, BirthDate, CURDATE()) AS Age FROM Employees;
SELECT firstname, salary, TIMESTAMPDIFF(minute, BirthDate, CURDATE()) AS Age FROM Employees;
SELECT firstname, salary, TIMESTAMPDIFF(second, BirthDate, CURDATE()) AS Age FROM Employees;

select *
from customers
where name regexp "^[a-zA-Z]{3,}$"

like "___%"


-- 4. Aggregate Function
-- Count number of employees
SELECT COUNT(*) AS EmployeeCount FROM Employees;

-- Count number of employees where salary is greater than 70k
SELECT COUNT(*) AS EmployeeCount
FROM Employees
where salary > 70000;

-- If you want to count only non-NULL values in a specific column, you can use COUNT(column_name) instead:
SELECT COUNT(firstname) AS NonNullCount FROM Employees;

Select count(*) from employees;
Select count(distinct firstname) from employees; # will not count null

-- Sum of salaries
SELECT SUM(Salary) AS TotalSalary FROM Employees;

-- Average salary
SELECT AVG(Salary) AS AverageSalary FROM Employees;

-- Minimum salary
SELECT MIN(Salary) AS MinimumSalary FROM Employees;

-- Maximum salary
SELECT MAX(Salary) AS MaximumSalary FROM Employees;

-- 5. Control Flow Functions
-- IF function to check if salary is above 70000
SELECT FirstName,
	Salary, 
	IF(Salary > 70000, 'High', 'Low') AS SalaryLevel 
    FROM Employees;

-- CASE function to categorize salary
SELECT FirstName, Salary,
CASE
    WHEN Salary >= 75000 THEN 'Very High'
    WHEN Salary >= 70000 THEN 'High'
    ELSE 'Average'
END AS SalaryLevel
FROM Employees;


SELECT REPLACE(firstname, 'i', 'o') AS LastNameReplaced FROM Employees;
SELECT SUBSTRING(FirstName, 2, 3) AS FirstNameSub FROM Employees;
SELECT LENGTH(FirstName) AS FirstNameLength FROM Employees;

select locate('i',firstname)
from employees;

SELECT 
    CONCAT(
        SUBSTRING(firstname, 1, LOCATE('i', firstname) - 1),'o',SUBSTRING(firstname, LOCATE('i', firstname) + 1)
    ) AS modified_firstname
FROM (SELECT 'rishiiiii' AS firstname) AS temp;


select firstname,
CONCAT(
        SUBSTRING(firstname, 1, LOCATE('i', firstname) - 1),'o',SUBSTRING(firstname, LOCATE('i', firstname) + 1)
    ) AS modified_firstname;
    
    
SELECT 
    EmployeeID,
    FirstName,
    LastName,
    BirthDate,
    HireDate,
    Salary,
    DepartmentID,
    CASE
        WHEN LOCATE('i', FirstName) > 0 THEN
            CONCAT(
                SUBSTRING(FirstName, 1, LOCATE('i', FirstName) - 1),
                'o',
                SUBSTRING(FirstName, LOCATE('i', FirstName) + 1)
            )
        ELSE FirstName
    END AS UpdatedFirstName
FROM Employees;
    
    
  











