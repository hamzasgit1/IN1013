-- 1
SELECT Date, Total
FROM Bill
WHERE Customer_Name = 'Bob Crow';

-- 2
SELECT DISTINCT Customer_Name
FROM Customer
WHERE Customer_Last_Name = 'Smith'
ORDER BY Customer_Name DESC;

-- 3
SELECT DISTINCT Customer_Name
FROM Customer
WHERE Customer_Last_Name LIKE 'C%';

-- 4
SELECT DISTINCT Staff_Name
FROM Staff
WHERE Headwaiter IS NULL;

-- 5
SELECT *
FROM Bill
WHERE Date BETWEEN 160201 AND 160229;

-- 6
SELECT DISTINCT Date
FROM Bill
WHERE Date BETWEEN 150101 AND 151231
ORDER BY Date ASC;