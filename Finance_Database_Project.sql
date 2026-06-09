
Import

Export


Run





81
AND Revenue.Year = Expenses.Year
82
ORDER BY Net_Profit DESC;
83
SELECT Companies.Sector,
84
AVG(Revenue.Revenue) as Avg_Revenue
85
FROM Revenue
86
JOIN Companies
87
ON Revenue.Company = Companies.Company
88
GROUP BY Companies.Sector;
89
SELECT Company, Year, Revenue
90
FROM Revenue
91
WHERE Revenue = (
92
SELECT MAX(Revenue) 
93
FROM Revenue
94
);
95
SELECT Revenue.Company,
96
Revenue.Year,
97
Revenue.Revenue,
98
Expenses.Expenses,
99
(Revenue.Revenue - Expenses.Expenses) as Net_Profit,
100
ROUND((Revenue.Revenue - Expenses.Expenses) * 100.0 / Revenue.Revenue, 2) as Profit_Margin
101
FROM Revenue
102
JOIN Expenses
103
ON Revenue.Company = Expenses.Company
104
AND Revenue.Year = Expenses.Year
105
ORDER BY Profit_Margin DESC;
106
​
107
​
108
​
109
​
History
SQLite




DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
15:00:26
SQLite




DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
15:00:14
SQLite




DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
15:00:01
SQLite




DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
14:59:52
SQLite




DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
14:59:50
SQLite




DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
14:59:42
SQLite




DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
14:59:34
SQLite




DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
14:59:31
SQLite




DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
14:59:17
SQLite




DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
14:59:10
SQLite




DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
14:59:01
SQLite




DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
14:58:47
SQLite



DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
14:58:33
SQLite



DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
14:58:22
SQLite




SELECT Revenue.Company,
Revenue.Year,
Revenue.Revenue,
Expenses.Expenses,
(Revenue.Revenue - Expense
...
14:21:22
SQLite




SELECT Company, Year, Revenue
FROM Revenue
WHERE Revenue = (
SELECT MAX(Revenue) 
FROM Revenue
);
14:21:10
SQLite




SELECT Companies.Sector,
AVG(Revenue.Revenue) as Avg_Revenue
FROM Revenue
JOIN Companies
ON Revenue.
...
14:21:01
SQLite




SELECT Revenue.Company,
Revenue.Year,
Revenue.Revenue,
Expenses.Expenses,
(Revenue.Revenue - Expense
...
14:20:52
SQLite




SELECT Companies.Company, 
Companies.Sector,
Revenue.Year,
Revenue.Revenue
FROM Revenue
JOIN Compani
...
14:20:45
SQLite




SELECT Companies.Company, 
Companies.Sector,
Revenue.Year,
Revenue.Revenue
FROM Revenue
JOIN Compani
...
14:20:34
SQLite




SELECT Revenue.Company,
Revenue.Year,
Revenue.Revenue,
Expenses.Expenses,
(Revenue.Revenue - Expense
...
14:20:03
SQLite




SELECT Company, Year, Revenue
FROM Revenue
WHERE Revenue = (
SELECT MAX(Revenue) 
FROM Revenue
);
14:19:55
SQLite




SELECT Companies.Sector,
AVG(Revenue.Revenue) as Avg_Revenue
FROM Revenue
JOIN Companies
ON Revenue.
...
14:19:48
SQLite




SELECT Revenue.Company,
Revenue.Year,
Revenue.Revenue,
Expenses.Expenses,
(Revenue.Revenue - Expense
...
14:19:37
SQLite




SELECT Companies.Company, 
Companies.Sector,
Revenue.Year,
Revenue.Revenue
FROM Revenue
JOIN Compani
...
14:19:20
SQLite




SELECT * FROM Revenue
WHERE Revenue > 150000;
14:18:06
SQLite




SELECT * FROM Companies
WHERE Sector = 'IT';
14:17:57
SQLite




SELECT Company, Year, Revenue
FROM Revenue
ORDER BY Revenue DESC;
14:17:48
SQLite




SELECT Company, SUM(Revenue) as Total_Revenue
FROM Revenue
GROUP BY Company
ORDER BY Total_Revenue D
...
14:17:39
SQLite




select * from companies
14:08:54
SQLite



INSERT INTO Companies VALUES (1, 'Infosys', 'IT', 'India');
INSERT INTO Companies VALUES (2, 'TCS', 
...
14:08:05
SQLite



INSERT INTO Companies VALUES (1, 'Infosys', 'IT', 'India');
INSERT INTO Companies VALUES (2, 'TCS', 
...
14:06:42
SQLite



DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
14:05:24
SQLite



DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
14:04:58
SQLite



DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Expenses;
 
CREATE
...
14:04:51
History
About
 Settings
SQLite storage

Memory

 → "Create SQLite DB"
I recommend using the latest version of Chrome for OpFS

History storage

Memory


- clear old(30+ day) db history

* сlose all other tabs with this site open, then refresh the page.

Left Menu
Editor
Skins

Night (dark)


Color settings

Table
Hover cell
None

Format number
None

Old button panel