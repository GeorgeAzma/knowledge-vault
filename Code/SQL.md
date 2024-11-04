youtu.be/zsjvFFKOm3c 
[[Object Relational Mapping (ORM)]]
### Database Management System (DBMS) Types
- **MySQL** Standard
- **PostgreSQL** Robust, performant 
- **SQLite** Lightweight, serverless, self-contained
### How It Works
- Tables can have have
	- Primary keys `unique id, for each item in the table`
	- Items/Rows `like player name in players table`
	- Foreign keys `other table unique id, like basketball team unique id`
### Data Types
- `BIGINT (64 bits), INT (32 bits) MEDIUMINT (24 bits), SMALLINT (16 bits), TINYINT (8 bits)`
- `DOUBLE (64 bits), FLOAT (32 bits), DECIMAL`
> [!note] 
> - `DECIMAL` is 65 digit precision base 10, perfect for storing cash
> - `INT` can also be used for storing floating points like money with cents
- `CHAR, VARCHAR(4), TEXT`
- `DATE, TIME, DATETIME, TIMESTAMP`
- `BIT(M)` `M is 1 to 64 bits` `assigned by literal b'0110'`
### Keywords
- **CASE**
``` mysql
CASE  
    WHEN id > 10 THEN 'result 1' 
    WHEN id = 20 THEN `result 2`
    ELSE `result 3`
END
```
- **DISTINCT** selects only unique row values of a column
``` mysql
SELECT DISTINCT user_id FROM Users
```
- **GROUP BY**
``` mysql
SELECT SUM(score), student_id FROM Exams
GROUP BY student_id 
-- sums total exam scores of each student
```
- **HAVING** same as `WHERE` but can be used with aggregate functions
``` mysql
-- Lists customers in each country
-- If country's customer count is more than 5
SELECT COUNT(CustomerID), Country  
FROM Customers  
GROUP BY Country
HAVING COUNT(CustomerID) > 5;
```
- **IN**
``` mysql
-- selects cities with unique location
select city_id from Cities
where (lat, lon) in
(
    select lat, lon from Cities
    group by lat, lon
    having count(city_id) = 1
)
```
- **UNION** combines `SELECT` statements with same number of columns
``` mysql
-- UNION selects distinct values
-- do UNION ALL for duplicates
SELECT City FROM Customers  
UNION  
SELECT City FROM Suppliers
```
### Functions
- `COUNT() SUM() AVG() MIN() MAX()` `called aggregate functions`
- `COALESCE(col, 0)` replaces nulls in column with 2nd parameter `usually 0`
``` mysql
SELECT COALESCE(column_name, 0) FROM Users
```
### Create Table
``` mysql
CREATE TABLE Users(
	id INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(255) NOT NULL UNIQUE,
	bio TEXT,
	country VARCHAR(2),
);
```
### Insert To Table
``` mysql
INSERT INTO Users (email, bio, country)
VALUES (
	'email@example.com',
	'love myself',
	'US'
);
-- or insert multiple rows
VALUES 
	('email@example.com', 'love myself', 'US'),
	('nomad@example.com', 'hate myself', 'UK');
```
### Select Items From Tables
``` mysql
SELECT * FROM Users users -- 'users' is alias for Users

WHERE country = 'US'
AND id > 1
AND email LIKE 'h%' -- emails starting with 'h'

ORDER BY id ASC -- or DESC
OFFSET 3 -- From 3rd row 
LIMIT 2;
```
### Create Index For Faster Data Retrieval
This makes things like `WHERE email LIKE 'h%'` much faster
But slower writes and more memory
``` mysql
CREATE INDEX email_index ON Users(email)
```
> [!note] `PRIMARY KEY, UNIQUE` can be indexed and sql indexes them using B-Tree
### Update Table
``` mysql
UPDATE Users Set email = 'dank@mail.com'
```
### Relationship Between Tables
``` mysql
CREATE TABLE Rooms(
	id INT AUTO_INCREMENT,
	street VARCHAR(255),
	owner_id INT NOT NULL,
	PRIMARY KEY (id)
	-- can't delete users who own a room now
	FOREIGN KEY (owner_id) REFERENCES Users(id)
);

INSERT INTO Rooms (owner_id, street)
VALUES
	(1, 'sailboat')
	(1, 'natucket')
```
### Joining Tables
``` mysql
-- joins user rows with room rows that have owner_id = user_id
SELECT * FROM Users
INNER JOIN Rooms
ON Rooms.owner_id = Users.id
-- or shorter and using alias
SELECT
	Users.id AS user_id
	Rooms.id AS room_id
FROM Users
INNER JOIN Rooms ON Rooms.owner_id = Users.id
```
### JOIN Types
- **INNER JOIN** returns rows where there is match in both tables
- **LEFT JOIN** returns all rows from left table and matched rows from right table
  if there is no match returns NULL
- **RIGHT JOIN** returns all rows from right table and matched rows from left table
  if there is no match returns NULL
- **FULL OUTER JOIN** returns all rows where there is a match in either left or right table
  on the table where there is no match returns NULL `not supported in mysql`
- **CROSS JOIN** returns all combinations
### Delete Tables
``` mysql
DROP TABLE Users;
DROP DATABASE airbnb;
DROP VIDEO cEqgamOA;
DELETE FROM Users Where id = 1;
```
