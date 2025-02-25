![Banner](HR%20Employee%20Attrition%20Banner.png)

# HR Employee Attrition & Performance Overview

In a competitive business environment, organizations thrive when employees perform at their best. However, understanding what makes employees excel is complex. This project uses IBM HR Analytics data to uncover actionable insights into what drives high performance. Identify the key predictors of high-performing employees and develop data driven strategies to enhance employee performance, engagement, and retention.

## Key Takeaways: Entry-level employees who are single are at a higher risk of leaving for other opportunities.

## Table of Contents

1. [HR Employee Attrition & Performance Overview](#hr-employee-attrition-&-performance-overview)
2. [Business Problem](#business-problem)
3. [Data Source](#data-source)
4. [Process](#process)
5. [Methods](#methods)
6. [Brief Results](#brief-results)
7. [Insights](#insights)
8. [Lessons Learned](#lessons-learned)
9. [Reccomendation](#reccomendation)
10. [Limitations](#limitations)

<Br>

---

## Business Problem
How can we identify the key predictors of high-performing employees and design data driven strategies to replicate these success factors across the organization?

## Data Source
- [Kaggle HR Attrition](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)

## Process
- **Data Familiarization and Transformation**: Collected and cleaned the dataset to address inconsistencies, resolve discrepancies, and ensure data quality using Excel.
- **Exploratory Data Analysis (EDA)**: Conducted an in-depth analysis using SQL to uncover patterns and trends, such as identifying the characteristics of high-performing employees.
- **Data Visualizations**: Designed interactive dashboards in Tableau to effectively present insights and make data driven findings accessible.
- **Recommendation**: Developed actionable strategies based on analysis results, providing clear steps to enhance employee performance and engagement.

## Methods
- Data Preparation
- Exploratory Data Analysis (EDA)
- Employee Segmentation
- Job Satisfaction & Engagement
- Performance Retention Strategy
- Career Development Analysis

<Br>
  
---

## Brief Results

### Churn Distribution by Tenure:
![ChurnDistributionbyTenure](Images/ChurnDistributionbyTenure.png)

### Churn by Payment Method:
![ChurnbyPaymentMethod](Images/ChurnbyPaymentMethod.png)

### Customer Churn by Contract:
![CustomerChurnbyContract](Images/CustomerChurnbyContract.png)

### Customer Demographic:

<Br>

---

## Insights

- **Tenure**: The **highest churn rate** is observed within the first **5 years**, with **680 customers leaving during this period**. Churn decreases as tenure increases, indicating that **early stage retention efforts should be prioritized**. This could be because customers often use the initial months or years to test the product and assess its value. Improving personalized engagement, early support, and price to value match could help reduce churn in these critical stages.

- **Payment Method**: Customers using **electronic checks 15.21% exhibit a higher churn rate**, suggesting that **flexibility and control over payments** may lead to a higher likelihood of churn. In contrast, customers who use **automatic payment methods**, such as bank transfers and credit cards, have **significantly lower churn** rates, indicating that these customers may exhibit **greater commitment and financial stability**. **Mailed check users** also show a relatively **low churn** rate, possibly reflecting a more **traditional and loyal customer segment**.

- **Contract**: The **majority of churned customers** were on **month-to-month contracts 88.55%**, suggesting that the **lack of long-term commitment** in these contracts is a **significant driver of churn**. In contrast, customers on one-year and two-year contracts exhibit lower churn, indicating that longer commitments may help improve retention.

- **Demographic**: **Churned customers without dependents or partners** experience **higher churn rates** compared to those who do. Churned customers **without dependents have a rate of 21.91%** while **churned customers without partners have a 17.04% churn rate**, This suggests that customers **without a partner** may lack support, making them **more cost-sensitive** and more likely to seek alternatives. On the other hand, those **with dependents** may be more incentivized to stay long-term, driven by increased stability or greater **reliance on the service**.

## Lessons Learned

**Data quality is really important** having more complete datasets, especially with more customer details can lead to better insights. Customer segmentation was key in identifying high risk groups and creating targeted retention strategies. 

## Reccomendation

- **Incentivize Long-Term Contracts**
Offer discounts or exclusive benefits to customers who commit to 1 or 2 year contracts. This will increase customer retention by reducing churn from month-to-month contracts.

- **Encourage Automated Payment Methods**
Promote the use of credit cards or bank transfers instead of electronic checks by offering small discounts or loyalty rewards for customers who sign up for automatic payments. This will increase customer stability and reduce churn.

- **Target Non-Partnered Customers with Long-Term Commitment Incentives**
Since customers without a partner tend to have higher churn rates, create tailored offers that emphasize long-term benefits or individual-focused plans. Consider offering personalized discounts, loyalty rewards, or flexible plans that cater to their unique needs, which can help foster greater engagement and encourage longer-term commitment.

## Limitations

The analysis was limited by the lack of essential **demographic** and **product related data**, such as **age**, **salary**, and **detailed service pricing**.

- **Age and Salary Data**: Without this, it was difficult to segment customers based on their financial profiles and tailor retention or pricing strategies accordingly.
- **Service Pricing Data**: The absence of detailed pricing information made it hard to assess price sensitivity or determine if churn was due to dissatisfaction with service value.

Incorporating these data points would have enabled a more comprehensive understanding of customer behavior and improved retention strategies.

<Br>

---

## Further Reading and Exploration

- **[Detailed Case Study](https://link-to-your-notion.com):** Dive deeper into the insights, challenges, and processes behind this project on my personal portfolio.  
- **[Interactive Tableau Dashboard](https://public.tableau.com/app/profile/aileen.q/viz/TelcoCustomerChurn_17359555698340/Dashboard2?publish=yes):** Explore the visualizations and analysis interactively on Tableau Public.  
