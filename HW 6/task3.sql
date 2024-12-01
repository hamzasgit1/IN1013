{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- 1. \
SELECT DISTINCT Waiter.FirstName, Waiter.LastName\
FROM Waiter\
JOIN Bill ON Waiter.WaiterID = Bill.WaiterID\
JOIN Customer ON Bill.CustomerID = Customer.CustomerID\
WHERE Customer.FirstName = 'Tanya' AND Customer.LastName = 'Singh';\
\
-- 2. \
SELECT DISTINCT Bill.BillDate\
FROM Bill\
JOIN Room ON Bill.RoomID = Room.RoomID\
JOIN HeadWaiter ON Room.HeadWaiterID = HeadWaiter.HeadWaiterID\
WHERE HeadWaiter.FirstName = 'Charles' AND Room.RoomName = 'Green'\
 AND Bill.BillDate LIKE '2016-02%';\
\
-- 3. \
SELECT DISTINCT Waiter.FirstName, Waiter.LastName\
FROM Waiter\
JOIN Room ON Waiter.RoomID = Room.RoomID\
WHERE Room.HeadWaiterID = (\
    SELECT Room.HeadWaiterID\
    FROM Waiter\
    JOIN Room ON Waiter.RoomID = Room.RoomID\
    WHERE Waiter.FirstName = 'Zoe' AND Waiter.LastName = 'Ball'\
);\
\
-- 4. \
SELECT Customer.FirstName AS CustomerName, Bill.Amount, Waiter.FirstName AS WaiterName\
FROM Bill\
JOIN Customer ON Bill.CustomerID = Customer.CustomerID\
JOIN Waiter ON Bill.WaiterID = Waiter.WaiterID\
ORDER BY Bill.Amount DESC;\
\
-- 5. \
SELECT DISTINCT Waiter.FirstName, Waiter.LastName\
FROM Waiter\
JOIN Bill ON Waiter.WaiterID = Bill.WaiterID\
WHERE Bill.TeamID IN (\
    SELECT DISTINCT TeamID\
    FROM Bill\
    WHERE Bill.BillID IN ('00014', '00017')\
);\
\
-- 6. \
SELECT DISTINCT Waiter.FirstName, Waiter.LastName\
FROM Waiter\
JOIN Bill ON Waiter.WaiterID = Bill.WaiterID\
WHERE Bill.RoomID = (\
    SELECT Room.RoomID\
    FROM Room\
    WHERE Room.RoomName = 'Blue'\
) AND Bill.BillDate = '160312'\
UNION\
SELECT HeadWaiter.FirstName, HeadWaiter.LastName\
FROM HeadWaiter\
JOIN Room ON HeadWaiter.HeadWaiterID = Room.HeadWaiterID\
WHERE Room.RoomName = 'Blue';}