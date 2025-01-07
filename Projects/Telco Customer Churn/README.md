# Solutions

## A. Easy Questions

### 1. Who is the senior most employee based on job title?

```sql
SELECT title, last_name, first_name
FROM employee
ORDER BY levels DESC
LIMIT 1;
```
| title                  | first_name | last_name |
|------------------------|------------|-----------|
| Senior General Manager | Madan      | Mohan     |
