### Keys / Constraints
``` sql
CREATE TABLE users(
    id INT PRIMARY KEY -- unique, non null
    -- foreign key: guarantees school_id exists in schools.id
    company_id INT REFERENCES companies (company_id),
    -- foreign key written explicitely
    CONSTRAINT id_fk FOREIGN KEY company_id REFERENCES companies(id)
)
```
### Text
``` sql
CHAR(10), -- 10 chars, padded with space
VARCHAR(10) -- <10 chars, no padding

-- n chars, similar performance as varchar
-- postgres: < 1GB
-- mysql: < 65KB, LONGTEXT: < 4GB
TEXT
LONGTEXT
```
### Numbers
``` sql
BIGINT -- 64 bit
INT -- 32 bit, alias INTEGER
MEDIUMINT -- 24 bit
SMALLINT -- 16 bit
TINYINT -- 8 bit

DOUBLE -- f64, FLOAT(53)
REAL -- f32, same as FLOAT
FLOAT(precision) -- FLOAT(24) = f32, mantissa precision
NUMERIC -- unlimited precision, same as DECIMAL
DECIMAL(
    precision -- total digits
    scale -- digits after decimal
)

BIT(10) -- 1-64 bits

CREATE TABLE users (
    id SERIAL -- id INT NOT NULL DEFAULT nextval('users_id_seq')
)
```
### Time
``` sql
DATE -- 2026-03-11
TIME -- 14:23:10
TIMESTAMP -- 2026-03-11 14:23:10

TIME WITH TIME ZONE -- 14:23:10+04, alias TIMETZ
TIMESTAMP WITH TIME ZONE -- 2026-03-11 14:23:10+04, alias TIMESTAMPTZ
TIMESTAMP WITHOUT TIME ZONE

INTERVAL -- 2 days 3 hours

SET TIME ZONE 'UTC';
```
### Casting
``` sql
cast(users.id as text) -- users.id::text shorthand used in postgres
```
### Index
turns linear column searches into BTreeMap like searches
- faster queries `WHERE email LIKE 'h%'`
- slower writes,  more memory
``` sql
CREATE INDEX email_index ON Users(email)
```
- `PRIMARY KEY, UNIQUE` are already auto indexed
- `FOREIGN KEY` is not auto indexed, so it's often manually indexed
### Sequence
``` sql
CREATE SEQUENCE users_id_seq;
ALTER SEQUENCE users_id_seq OWNED BY users.id; -- auto drop seq when user.id drops
```
