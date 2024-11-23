-- 1
SELECT SUM(Total) AS Income
FROM Bill;

-- 2
SELECT SUM(Total) AS "Feb Income"
FROM Bill
WHERE Date BETWEEN 160201 AND 160229;

-- 3
SELECT AVG(Total) AS "Average Bill"
FROM Bill
WHERE Table_No = 2;

-- 4
SELECT MIN(Seats) AS Min, MAX(Seats) AS Max, AVG(Seats) AS Avg
FROM Table
WHERE Room = 'Blue';

-- 5
SELECT COUNT(DISTINCT Table_No) AS DistinctTables
FROM Bill
WHERE Waiter_No IN (004, 002);