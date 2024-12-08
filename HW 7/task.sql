{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \'971\
\
CREATE VIEW BillsBySam AS\
SELECT staff.first_name, staff.surname, bill.bill_date, bill.cust_name, bill.bill_total\
FROM restbill AS bill\
INNER JOIN reststaff AS staff\
ON bill.waiter_no = staff.staff_no\
WHERE staff.first_name = 'Sam';\
\
SELECT * \
FROM BillsBySam\
WHERE bill_total > 400;\
\
CREATE VIEW RoomBillTotals AS\
SELECT tables.room_name, SUM(bills.bill_total) AS total_room_sum\
FROM restrest_table AS tables\
INNER JOIN restbill AS bills\
ON tables.table_no = bills.table_no\
GROUP BY tables.room_name;\
\
CREATE VIEW HeadWaiterTotals AS\
SELECT CONCAT(head.first_name, ' ', head.surname) AS headwaiter_fullname, \
       SUM(bills.bill_total) AS total_sum\
FROM restbill AS bills\
INNER JOIN reststaff AS waiters ON bills.waiter_no = waiters.staff_no\
LEFT JOIN reststaff AS head ON waiters.headwaiter = head.staff_no\
GROUP BY head.staff_no, head.first_name, head.surname;\
}