#### Create / Drop
``` sql
CREATE IF NOT EXISTS TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT, -- use serial in postgres
    name VARCHAR(100) NOT NULL,  
    age INT CHECK (age > 0),  
    created_at TIMESTAMP UNIQUE DEFAULT NOW()
)
DROP TABLE users;

CREATE TABLE orders (
    id INT PRIMARY KEY, -- use serial in postgres
    amount INT CHECK (amount >= 0),
    price DECIMAL(10, 2),
    user_id INT,
    CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users(id)
        -- deletes order if user_id is deleted
        ON DELETE CASCADE
        ON DELETE SET NULL
)
```
#### Alter
``` sql
ALTER TABLE users RENAME TO people;  
ALTER TABLE users ADD email VARCHAR(100);  
ALTER TABLE users DROP COLUMN email;
ALTER TABLE users ALTER COLUMN email TYPE TEXT;
ALTER TABLE orders ADD CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE users ALTER COLUMN id SET NOT NULL;
ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq');
```
#### Insert / Delete / Update
``` sql
INSERT INTO users (id, name, age) VALUES (1, 'Alice', 25), (2, 'Bob', 30);
DELETE FROM users WHERE id = 1;

UPDATE users SET age = 26 WHERE id = 1;
-- update or insert
INSERT INTO users(id, name) VALUES (1, 'Alice')  
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name;
```
#### Select
``` sql  
SELECT * FROM users;
SELECT name, age FROM users;  
SELECT name AS username FROM users;  
SELECT DISTINCT age FROM users;

SELECT * FROM users LIMIT 10 OFFSET 20;

-- null => 0
SELECT COALESCE(age, 0) FROM Users

-- users with id in orders.user_ids
SELECT * FROM users WHERE id IN ( SELECT user_id FROM orders );

SELECT City FROM Customers  
    UNION     -- selects distinct values from both
    UNION ALL -- selects both values
    INTERSECT -- selects only values that both have
    EXCEPT    -- selects only 1st values not in 2nd
SELECT City FROM Suppliers

-- string concatination
SELECT cast(price as text) || ' USD' AS price FROM orders
```
#### Filter
``` sql
SELECT * FROM users 
WHERE age > 25
WHERE age BETWEEN 20 AND 30
WHERE name LIKE 'A%' -- starts with A  
WHERE name IN ('Alice', 'Bob') 
WHERE age IS NULL
```
#### Sort
``` sql
SELECT * FROM users 
ORDER BY age ASC
ORDER BY age DESC
ORDER BY 1 DESC -- order by 1st column
```
#### Aggregation
``` sql
SELECT COUNT(*) FROM users;  
SELECT AVG(age) FROM users;  
SELECT SUM(age) FROM users;  
SELECT MIN(age) FROM users;  
SELECT MAX(age) FROM users;
-- group by ages, with group size > 2
-- HAVING = WHERE for aggegates
SELECT age, COUNT(*) FROM users GROUP BY age HAVING COUNT(*) > 2;
```
#### Join
``` sql
SELECT users.name, orders.amount FROM users 
INNER JOIN orders -- users.id, orders.user_id != NULL, INNER is optional  
LEFT JOIN orders -- join on all users.id, orders.user_id maybe NULL
RIGHT JOIN orders -- join on all orders.id, users.user_id maybe NULL
OUTER JOIN orders -- FULL JOIN, users.id, orders.user_id maybe NULL  
CROSS JOIN orders -- all combinations of users.id, orders.id
ON users.id = orders.user_id;
```
##### Transactions
``` sql
BEGIN;  
  
UPDATE users SET age = 30 WHERE id = 1;  
  
COMMIT; -- save  
ROLLBACK; -- undo
```
##### Debug
``` sql
EXPLAIN SELECT * FROM users;
EXPLAIN ANALYZE SELECT * FROM users WHERE id = 5;
-- pgadmin
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';
```
### Examples
``` sql
-- top 10 most spending adult users
SELECT u.name, SUM(o.amount) AS total  
FROM users u  
JOIN orders o ON u.id = o.user_id  
WHERE u.age > 18  
GROUP BY u.id  
ORDER BY total DESC  
LIMIT 10;

-- active user total spendings
WITH  
active_users AS ( SELECT * FROM users WHERE active = true ),  
totals AS ( SELECT user_id, SUM(amount) total FROM orders GROUP BY user_id )  
SELECT u.name, t.total  
FROM active_users u  
JOIN totals t ON u.id = t.user_id;

WITH RECURSIVE tree AS (
    SELECT id, parent_id FROM nodes WHERE id = 1  
    UNION ALL  
    SELECT n.id, n.parent_id FROM nodes n JOIN tree t ON n.parent_id = t.id  
)
SELECT * FROM tree;
```
