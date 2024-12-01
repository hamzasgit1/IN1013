{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- 1\
SELECT Waiter.FirstName, Waiter.LastName, Bill.BillDate, COUNT(Bill.BillID) AS BillCount\
FROM Waiter\
JOIN Bill ON Waiter.WaiterID = Bill.WaiterID\
GROUP BY Waiter.FirstName, Waiter.LastName, Bill.BillDate\
HAVING COUNT(Bill.BillID) >= 2;\
\
-- 2\
SELECT Room.RoomName, COUNT(Table.TableID) AS TableCount\
FROM Room\
JOIN Table ON Room.RoomID = Table.RoomID\
WHERE Table.Capacity > 6\
GROUP BY Room.RoomName;\
\
-- 3\
SELECT Room.RoomName, SUM(Bill.Amount) AS TotalBillAmount\
FROM Room\
JOIN Bill ON Room.RoomID = Bill.RoomID\
GROUP BY Room.RoomName;\
\
-- 4\
SELECT HeadWaiter.FirstName, HeadWaiter.LastName, SUM(Bill.Amount) AS TotalBillAmount\
FROM HeadWaiter\
JOIN Room ON HeadWaiter.HeadWaiterID = Room.HeadWaiterID\
JOIN Bill ON Room.RoomID = Bill.RoomID\
GROUP BY HeadWaiter.FirstName, HeadWaiter.LastName\
ORDER BY TotalBillAmount DESC;\
\
-- 5\
SELECT Customer.FirstName, Customer.LastName\
FROM Customer\
JOIN Bill ON Customer.CustomerID = Bill.CustomerID\
GROUP BY Customer.FirstName, Customer.LastName\
HAVING AVG(Bill.Amount) > 400;\
\
-- 6\
SELECT Waiter.FirstName, Waiter.LastName, COUNT(Bill.BillID) AS BillCount\
FROM Waiter\
JOIN Bill ON Waiter.WaiterID = Bill.WaiterID\
GROUP BY Waiter.FirstName, Waiter.LastName\
HAVING COUNT(Bill.BillID) >= 3;}