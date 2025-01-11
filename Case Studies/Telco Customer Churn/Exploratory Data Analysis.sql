SELECT * FROM TelecoChurn;

--------CUSTOMER DEMOGRAPHIC--------

-- Churn rate by customer gender:
-- Observation: Female and Male customers have the same churn rate 13%
-- Insight: Gender appears to have no direct impact on churn. Other factors should be explored for driving retention strategies.
SELECT Gender, 
       ROUND(COUNT(Churn)*100.0/(SELECT COUNT(*) FROM TelecoChurn),2) AS ChurnRate
FROM TelecoChurn
WHERE Churn = 'Yes'
GROUP BY Gender;

-- Churn by Dependents 
-- Observation: Customers with dependents have 4.63% churn rate compared to non dependents 21.91%
-- Insight: Customers with dependents may have a greater incentive to stay long-term, potentially due to increased stability or reliance on services.
SELECT Dependents,
       ROUND(COUNT(Churn)*100.0/(SELECT COUNT(*) FROM TelecoChurn),2) AS ChurnRate
FROM TelecoChurn
WHERE Churn = 'Yes' 
GROUP BY Dependents;

-- Churn by Partner
-- Observation: Customers without partners 17.04% have higher churn rates than customers with partners 9.5%
-- Insight: Customers without partners may be more cost-sensitive, making them more likely to seek alternative options.
SELECT Partner,
       ROUND(COUNT(Churn)*100.0/(SELECT COUNT(*) FROM TelecoChurn),2) AS ChurnRate
FROM TelecoChurn
WHERE Churn = 'Yes' 
GROUP BY Partner;

-- Churn by Senior Citizen Status
-- Observation: Senior citizens have a lower churn rate 7% compared to non senior citizens 20%
-- Insight: Senior citizens may have a greater tendency to stick with familiar services, which could explain their lower churn rate.
SELECT SeniorCitizen, 
       ROUND(COUNT(Churn)*100.0/(SELECT COUNT(*)FROM TelecoChurn))AS ChurnRate
FROM TelecoChurn
WHERE Churn = 'Yes' 
GROUP BY SeniorCitizen;


--------BILLING METHODS--------

-- Churn by Type of Contract
-- Observation: Among churned customers, the Month-to-Month contract is the most popular (1,655), followed by One Year (166) and Two Year (48)
-- Insight: Short-term contracts may contribute to higher churn, as they provide customers with flexibility and lower commitment.
SELECT Contract,
       COUNT(CustomerID) AS TotalCustomers
FROM TelecoChurn
WHERE Churn = 'Yes'
GROUP BY Contract;

-- Churn by Monthly and Total Charges
-- Observation: Customers who churned had higher average Monthly Charges $74.44 and Total Charges $1,531.8 compared to non churning customers $61.27 avg Monthly, $2,549.91 avg Total
-- Insight: Higher Monthly Charges for churned customers could indicate that cost plays a significant role in churn behavior.
SELECT Churn,
       ROUND(AVG(MonthlyCharges),2) AS AvgMonthlyCharges, 
       ROUND(AVG(TotalCharges),2) AS AvgTotalCharges
FROM TelecoChurn
GROUP BY Churn;

-- Churn by payment Methods
-- Observation: Among churned customers Electronic Checks have the highest churn rate 15%, followed by Mailed Check 4%, Bank Transfer (Automatic) 4%, and Credit Card (Automatic) 3%
-- Insight: Customers using automatic payment methods, like Bank Transfers and Credit Cards, tend to have lower churn rates, possibly due to the convenience and automatic renewal process. Electronic Checks require manual payment, may indicate less commitment.
SELECT PaymentMethod,
       ROUND(COUNT(Churn)*100.0/(SELECT COUNT(*) FROM TelecoChurn)) AS ChurnRate
FROM TelecoChurn
WHERE Churn = 'Yes'
GROUP BY PaymentMethod;  


--------SERVICES--------

-- Churn by Internet Service type
-- Observation: Fiber Optic has the highest churned customer count 1,297, followed by DSL 459, and No Service 113
-- Insight: The higher churn rate for Fiber Optic customers could indicate a potential issue or pain point with the service. Further investigation into service quality, pricing, or customer support for Fiber Optic could help reduce churn.
SELECT InternetService,
       COUNT(CustomerID) AS TotalCustomers
FROM TelecoChurn
WHERE Churn = 'Yes'
GROUP BY InternetService
ORDER BY COUNT(CustomerID) DESC;

-- Percentage of Customers Using Phone Service
-- Observation: Observation: 24% of customers with phone service have churned, while 66% have remained. The remaining customers either don't use phone service or haven't churned
-- Insight: The relatively high churn rate among customers with phone service suggests that there may be opportunities for improving the service to increase retention.
SELECT Churn, 
       CASE WHEN PhoneService = 'Yes' THEN 'With Phone Service'
            ELSE 'Without Phone Service'
       END AS 'PhoneService',
       ROUND(COUNT(CustomerID)*100.0/(SELECT COUNT(CustomerID) FROM TelecoChurn)) AS PercentageOfCustomers
FROM TelecoChurn
GROUP BY CASE WHEN PhoneService = 'Yes' THEN 'With Phone Service'
            ELSE 'Without Phone Service'
       END, Churn
ORDER BY Churn;

-- Churn by StreamingTV or StreamingMovies
-- Observation: 15% of churned customers have either Streaming TV or Streaming Movies service.
-- Insight: The churn rate for customers with these services may suggest that they are not seeing enough value in them. Further analysis is needed to understand if issues like pricing, content variety, or service quality are contributing to the churn.
SELECT COUNT(CustomerID)*100.0/(SELECT COUNT(CustomerID) FROM TelecoChurn) AS ChurnRate
FROM TelecoChurn
WHERE Churn = 'Yes' 
AND (StreamingTV = 'Yes' OR StreamingMovies = 'Yes');


--------Customer Tenure--------

-- Longest Tenured Customers
-- Observation: 9 out of 10 longest-tenured customers use automatic payment methods, have contracts of 1 year or longer, have a partner, and only 1 is a senior.
-- Insight: Financial stability, such as having automatic payments and longer-term contracts, as well as support from a partner, could play a significant role in customer retention. 
SELECT *
FROM TelecoChurn
ORDER BY tenure DESC
LIMIT 10;

-- Distribution of churned customers by tenure
-- Observation: There are 1,136 churned customers with low tenure, 515 with high tenure, and 218 with mid tenure.
-- Insight: The majority of churned customers come from the low-tenure group, indicating that pain points or dissatisfaction may occur early in the customer journey. This suggests that retention efforts should focus on improving the experience during the initial stages.
SELECT COUNT(CustomerID) AS TotalCustomers,
       CASE WHEN tenure BETWEEN 0 AND 15 THEN 'Low Tenure'
            WHEN tenure BETWEEN 16 AND 25 THEN 'Mid Tenure'
            ELSE 'High Tenure'
       END AS "TenureDistribution"
FROM TelecoChurn
WHERE Churn = 'Yes'
GROUP BY CASE WHEN tenure BETWEEN 0 AND 15 THEN 'Low Tenure'
	            WHEN tenure BETWEEN 16 AND 25 THEN 'Mid Tenure'
	            ELSE 'High Tenure'
	       END
ORDER BY COUNT(CustomerID) DESC;
