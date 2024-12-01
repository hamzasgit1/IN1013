{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- 1. \
SELECT DISTINCT Customer.FirstName, Customer.LastName\
FROM Customer\
JOIN Bill ON Customer.CustomerID = Bill.CustomerID\
JOIN Room ON Bill.RoomID = Room.RoomID\
JOIN HeadWaiter ON Room.HeadWaiterID = HeadWaiter.HeadWaiterID\
WHERE HeadWaiter.FirstName = 'Charles' AND Bill.Amount > 450.00;\
\
-- 2. \
FROM HeadWaiter\
JOIN Room ON HeadWaiter.HeadWaiterID = Room.HeadWaiterID\
JOIN Bill ON Room.RoomID = Bill.RoomID\
JOIN Customer ON Bill.CustomerID = Customer.CustomerID\
WHERE Customer.FirstName = 'Nerida' AND Bill.BillDate = '2016-01-11';\
\
-- 3. \
SELECT Customer.FirstName, Customer.LastName\
FROM Customer\
JOIN Bill ON Customer.CustomerID = Bill.CustomerID\
WHERE Bill.Amount = (\
    SELECT MIN(Amount)\
    FROM Bill\
);\
\
-- 4. \
SELECT Waiter.FirstName, Waiter.LastName\
FROM Waiter\
WHERE Waiter.WaiterID NOT IN (\
    SELECT DISTINCT WaiterID\
    FROM Bill\
);\
\
-- 5. \
SELECT Customer.FirstName AS CustomerName, Customer.LastName AS CustomerLastName,\
       HeadWaiter.FirstName AS HeadWaiterFirstName, HeadWaiter.LastName AS HeadWaiterLastName,\
       Room.RoomName\
FROM Customer\
JOIN Bill ON Customer.CustomerID = Bill.CustomerID\
JOIN Room ON Bill.RoomID = Room.RoomID\
JOIN HeadWaiter ON Room.HeadWaiterID = HeadWaiter.HeadWaiterID\
WHERE Bill.Amount = (\
    SELECT MAX(Amount)\
    FROM Bill\
);}