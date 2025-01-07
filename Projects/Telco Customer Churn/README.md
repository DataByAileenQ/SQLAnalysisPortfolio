# Solutions

## A. Easy Questions

### 1. Who is the senior most employee based on job title?

```sql
SELECT title, last_name, first_name
FROM employee
ORDER BY levels DESC
LIMIT 1;
```
| Total Customers | Tenure Distribution |
|------------------|---------------------|
| 1136            | Low Tenure          |
| 515             | High Tenure         |
| 218             | Mid Tenure          |

