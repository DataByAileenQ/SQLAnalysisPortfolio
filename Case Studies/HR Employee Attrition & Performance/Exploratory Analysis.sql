-- After creating the schema below, I imported the CSV file into SQLite Studio to begin exploratory data analysis.

/*CREATE TABLE employee_data (
    Age INTEGER,
    Attrition TEXT,
    BusinessTravel TEXT,
    Department TEXT,
    DistanceFromHome INTEGER,
    Education INTEGER,
    EducationField TEXT,
    EmployeeNumber INTEGER PRIMARY KEY,
    EnvironmentSatisfaction INTEGER,
    Gender TEXT,
    HourlyRate INTEGER,
    JobInvolvement INTEGER,
    JobLevel INTEGER,
    JobRole TEXT,
    JobSatisfaction INTEGER,
    MaritalStatus TEXT,
    MonthlyIncome INTEGER,
    NumCompaniesWorked INTEGER,
    OverTime TEXT,
    PercentSalaryHike INTEGER,
    PerformanceRating INTEGER,
    RelationshipSatisfaction INTEGER,
    StockOptionLevel INTEGER,
    TotalWorkingYears INTEGER,
    TrainingTimesLastYear INTEGER,
    WorkLifeBalance INTEGER,
    YearsAtCompany INTEGER,
    YearsInCurrentRole INTEGER,
    YearsSinceLastPromotion INTEGER,
    YearsWithCurrManager INTEGER
);*/

SELECT * FROM employee_data;

-------------------------Employee Segmentation-------------------------

-- Performance & Attrition by Age Group:
-- Observation: Employees with an attrition status of 'Yes' have the highest average performance rating in the Younger than 20 group (3.33), followed by 30 and above (3.21), 40 and above (3.15), 20 and above (3.11), and finally, 50 or Older (3.04).
-- Insight: The highest-performing employees are those in the Younger than 20 group, which may indicate that younger employees, such as interns, put in extra effort to secure permanent positions. The second-highest performers are in the 30 and above group, suggesting that employees in this age range may be particularly motivated to advance their careers and achieve growth. 

SELECT CASE WHEN Age >= 50 THEN '50 or Older'
            WHEN Age BETWEEN 40 AND 49 THEN '40 and above'
            WHEN Age BETWEEN 30 AND 39 THEN '30 and above'
            WHEN Age BETWEEN 20 AND 29 THEN '20 and above'
            ELSE 'Younger than 20'
       END AS 'AgeBracket',
       ROUND(AVG(PerformanceRating),2) AS 'AvgPerformanceRating'
FROM employee_data
WHERE Attrition = 'Yes'
GROUP BY AgeBracket
ORDER BY AvgPerformanceRating DESC;

-- High Performing Departments:
-- Observation: Observation: Employees who left the company with a performance rating of 4 came from the Research & Development department (26 employees), Sales (10 employees), and Human Resources (1 employee).
-- Insight:  The highest number of high-performing employees who left were from the Research & Development department. This may indicate potential issues within that department, and further analysis should be conducted to understand the reasons behind this attrition.

SELECT Department, COUNT(PerformanceRating) AS 'HighPerformanceRatingCount'
FROM employee_data
WHERE Attrition = 'Yes'
AND PerformanceRating = 4
GROUP BY Department
ORDER BY HighPerformanceRatingCount DESC;

-- Education Fields of High Performing Employee's Who Left:
-- Observation: Among the high-performing employees who left, the most common education fields were Life Sciences (17 employees), followed by Medical (9), Technical Degree (6), Other (2), Marketing (2), and Human Resources (1).
-- Insight: Employees with degrees in fields like Life Sciences may not have the specialized skills needed to grow within the organization, potentially contributing to their decision to leave. On the other hand, the single Human Resources employee who left suggests that there could be greater growth opportunities within the organization for HR professionals.

SELECT EducationField, 
       COUNT(EmployeeNumber) AS 'TotalEmployees'
FROM employee_data
WHERE Attrition = 'Yes'
AND PerformanceRating = 4
GROUP BY EducationField
ORDER BY TotalEmployees DESC; 

-- Employee Marital Status in the Research & Development Department (High Performing Employees Who Left):
-- Observation: In the Research & Development department, most high-performing employees who left were Single (18 employees), followed by Married (5) and Divorced (3). All these employees had an average age in their 30s.
-- Insight: The higher number of Single employees who left could indicate that they prioritize career growth and mobility over stability, potentially seeking new opportunities for advancement. Married employees, with their potentially higher responsibilities, may also be motivated by career growth, though the smaller number suggests that the desire for stability could be influencing their decisions. Divorced employees, representing the smallest group, may be prioritizing job stability over career growth, potentially due to personal factors or life changes.


SELECT MaritalStatus,
       COUNT(EmployeeNumber) AS 'TotalEmployees',
       AVG(Age) AS 'AvgAge'
FROM employee_data
WHERE PerformanceRating = 4
AND Attrition = 'Yes'
AND Department = 'Research & Development'
GROUP BY MaritalStatus
ORDER BY TotalEmployees DESC;

-------------------------Compensation-------------------------

-- Monthly Income by Department:
-- Observation: The highest Employee Monthly Income comes from Sales at 5908.46 (count 92), followed by Research & Development at 4108.08 (count 133), and the lowest is Human Resources at 3715.75 (count 12).
-- Insight: There seems to be a higher employee income in the Sales department and the lowest in Human Resources. Despite this, HR has a relatively low count of employees who left (12), suggesting that compensation may not be highly correlated with attrition in this case. Other factors, such as work culture or career growth opportunities, might play a more significant role in HR's lower attrition rate.

SELECT Department,
       ROUND(AVG(MonthlyIncome),2) AS 'AvgMonthlyIncome',
       COUNT(Attrition) AS 'TotalEmp'
FROM employee_data
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY AvgMonthlyIncome DESC;

-- Top 5 Employees by Salary Hike:
-- Observation: 3 out of the top 5 employees who received the highest salary hikes were in their 30s, all had a performance rating of 4, and none of them worked overtime.
-- Insight: Employees in their 30s may be more focused on career growth, which is reflected in their performance ratings. However, it's interesting that none of these top performers worked overtime, suggesting that salary growth might not necessarily be linked to extra hours worked. This warrants further investigation.

SELECT *
FROM employee_data
ORDER BY PercentSalaryHike DESC
LIMIT 5;

-------------------------Role Engagement-------------------------

-- Employee Career Development & Attrition:
-- Observation: Employees who left the company had slightly lower average training time (2.6 hours) compared to those who stayed (2.8 hours). Additionally, employees who left had fewer years at the company on average (5.1 years) compared to those who stayed (7.4 years). The average years in their current role were also lower for employees who left (2.9 years) compared to those who stayed (4.5 years). Employees who left were younger on average (34 years) compared to those who stayed (38 years).
-- Insight: While the average training time did not significantly differ between employees who left and those who stayed, employees who left had slightly lower training hours. The differences in years at the company and years in the current role suggest that employees who leave tend to be younger and have less tenure, which may indicate that younger employees are more likely to leave earlier in their careers, possibly in pursuit of new opportunities or faster growth. In contrast, older employees appear to stay longer, possibly valuing stability and opportunities for career progression within the company.

WITH Emp_Development_CTE AS (
SELECT CASE 
           WHEN Attrition = 'Yes' THEN 'Employee Left' 
           ELSE 'Employee Stayed'
       END AS 'EmployeeStatus',
       ROUND(AVG(TrainingTimesLastYear),1) AS 'AvgTrainingTimesLastYear',
       ROUND(AVG(YearsAtCompany),1) AS 'AvgYearsAtCompany',
       ROUND(AVG(YearsInCurrentRole),1) AS 'AvgYearsInCurrentRole',
       ROUND(AVG(Age)) AS 'AverageAge'
FROM employee_data
GROUP BY EmployeeStatus

)
SELECT *
FROM Emp_Development_CTE
;

-- Employee Performance & Overtime:
-- Observation: There is no significant difference in employee performance between those who worked overtime and those who didn’t. Employees who stayed and worked overtime had an average performance rating of 3.15, while those who didn’t had 3.16. Similarly, employees who left and worked overtime had an average rating of 3.18, compared to 3.13 for those who didn’t.
-- Insight: While there are no major differences in performance related to overtime, employees who left the company and worked overtime had the highest average performance rating (3.18). This suggests that these employees may have been more motivated to demonstrate their dedication and growth potential before leaving, possibly seeking new opportunities for advancement.

SELECT Attrition,
       Overtime,
       ROUND(AVG(PerformanceRating),2) AS 'AvgPerformanceRating'
FROM employee_data
GROUP BY OverTime, Attrition
ORDER BY Attrition;

-- Employee Involvement & total Working Years:
-- Observation: High-performing employees who stayed at the company had a higher average job involvement (2.72) compared to those who left (2.46). Additionally, employees who stayed had more total working years on average (12 years) than those who left (7 years). Employees who stayed were also older on average (38 years) than those who left (33 years).
-- Insight: The lower job involvement of employees who left is concerning, as job involvement is a key indicator of an employee’s connection to the company’s values. This lower involvement may contribute to higher turnover and lower performance, suggesting that improving engagement could help reduce attrition and boost performance.

SELECT Attrition,
       ROUND(AVG(JobInvolvement),2) AS 'AvgJobInvolvement',
       ROUND(AVG(TotalWorkingYears),1) AS 'AvgTotalWorkingYears',
       ROUND(AVG(Age)) AS 'AvgAge'
FROM employee_data
WHERE PerformanceRating = '4'
GROUP BY Attrition;

-------------------------Work Environment-------------------------

-- Work Life Balance & Job Satisfaction by Department:
-- Observation: Among employees who stayed and had a performance rating of 4, the HR department had the highest average work-life balance (3.13) and the highest average job satisfaction (3.0). In contrast, Sales had a lower average work-life balance (2.67) and job satisfaction (2.96), while Research & Development (R&D) had the lowest work life balance (2.78) and job satisfaction (2.81). Interestingly, while R&D had the highest number of high performing employees who stayed (130), HR had the lowest (8). 
-- Insight: The data shows that although HR employees have the highest average work life balance and job satisfaction, they also have the lowest number of high performing employees who stayed. Conversely, R&D has the highest number of high performing employees but relatively lower work life balance and job satisfaction scores. This suggests that high performance may not always correlate directly with work life balance or job satisfaction. There could be other factors, such as job demands, team dynamics, or career growth opportunities, that contribute more significantly to an employee's performance in different departments.

SELECT Department,      
       ROUND(AVG(WorkLifeBalance),2) AS 'AvgWorkLifeBalance',
       COUNT(PerformanceRating) AS 'TotalEmp',
       ROUND(AVG(JobSatisfaction),2) AS 'AvgJobSatisfaction',
       RANK() OVER (ORDER BY AVG(JobSatisfaction) DESC) AS 'SatisfactionRank'
FROM employee_data
WHERE PerformanceRating = 4 
AND Attrition = 'No'
GROUP BY Department;

-- Employee Attrition & Job Level Correlations:
-- Observation: For employees who left, the average education level was consistent across job levels (3). The highest hourly rate was in Job Level 4 (79), while the lowest was in Level 5 (61.8). Attrition was highest in Level 1 (143 employees) and decreased with job level, with only 5 departures at Level 5. Average years in role and age increased with job level, while performance ratings decreased as job level rose.
-- Insight: Education level did not vary significantly by job level, suggesting it isn’t a key factor in attrition. Interestingly, while Level 5 had the lowest attrition and hourly rate, it also had the oldest employees, possibly indicating less turnover among senior leadership. In contrast, younger employees in lower job levels, with higher pay, showed greater attrition, likely seeking better opportunities. The rise in years in role and decline in performance ratings by job level suggest that younger employees may be more driven, while higher-level employees experience diminishing motivation over time.

SELECT JobLevel,
       ROUND(AVG(Education)) AS 'AvgEducationLevel',
       ROUND(AVG(HourlyRate),2) AS 'AvgHourlyRate',
       ROUND(AVG(YearsInCurrentRole)) AS 'AvgYearsInCurrentRole',
       ROUND(AVG(PerformanceRating),2) AS 'AvgPerformanceRating',
       ROUND(AVG(Age)) AS 'AvgAge',
       COUNT(Attrition) AS 'EmpLeftCount'
FROM employee_data
WHERE Attrition = 'Yes'
GROUP BY JobLevel;
