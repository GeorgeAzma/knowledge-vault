``` sql
-- pattern matching
CASE  
    WHEN id > 10 THEN 'result 1' 
    WHEN id = 20 THEN 'result 2'
    ELSE 'result 3'
END

to_date('16.02.2006', 'dd.mm.yyyy')
to_char(now(), 'yyyy')::int
extract (year from now())
```