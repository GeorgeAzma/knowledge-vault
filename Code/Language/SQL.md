### Database Management System `DBMS` Types
- **MySQL** Standard
- **PostgreSQL** Robust, performant 
- **SQLite** Lightweight, serverless, self-contained
- [[Object Relational Mapping (ORM)]]
### [[SQL Types]]
### [[SQL Queries]]
### [[SQL Functions]]
### Database
``` sql
CREATE DATABASE db; -- contains tables, views etc.
DROP DATABASE old_db;
USE db;
```
### CLI
``` bash
psql -h localhost -p 5432 -U username -d database
```
### [[Docker Compose]]
``` yaml
version: '3.8'
services:
  db:
    image: postgres:16
    container_name: pg-test
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: root
      POSTGRES_DB: testdb
    ports:
      - "5432:5432"
  pgadmin:
    image: dpage/pgadmin4
    container_name: pgadmin
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@admin.com
      PGADMIN_DEFAULT_PASSWORD: root
    ports:
      - "8080:80"
```
