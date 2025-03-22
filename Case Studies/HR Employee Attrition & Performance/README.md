![Banner](Images/HR%20Employee%20Attrition%20Banner.png)


# HR Employee Attrition & Performance Overview

In a competitive business environment, organizations thrive when employees perform at their best. However, understanding what makes employees excel is complex. This project uses IBM HR Analytics data to uncover actionable insights into what drives high performance. Identify the key predictors of high-performing employees and develop data driven strategies to enhance employee performance, engagement, and retention.

## Key Takeaways: Entry-level employees who are single are at a higher risk of leaving for other opportunities.

## Table of Contents

1. [HR Employee Attrition & Performance Overview]([#hr-employee-attrition--performance-overview])
2. [Business Problem](#business-problem)
3. [Data Source](#data-source)
4. [Process](#process)
5. [Methods](#methods)
6. [Discoveries](#discoveries)
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

## Discoveries

### Discovery #1: Lower Monthly Income is associated with higher Attrition Rate
![Discovery 1](Images/Discovery%201.png)

### Discovery #2: Attrition Peaks Early but Declines with Continued Training 
<img src="Images/Discovery%202.png" alt="Discovery 2" width="600" height="400">

### Discovery #3: Employee Attrition is Linked to Job Level and Age Demographics
<img src="Images/Discovery%203.png" alt="Discovery 3" width="700" height="400">

<Br>

---

## Insights

- **Discovery #1**: Employees earning below **$5,999 per month** experience **higher attrition rates**, with the **$2,000–$2,999** salary range having the **highest attrition rate at 6.46%**. Higher salaries correlate with lower attrition, suggesting that compensation impacts retention. Lower salaries may indicate **Entry Level positions** with **higher turnover** due to better opportunities elsewhere. Offering **career progression paths, upskilling programs, and performance based raises** could help retain employees in lower salary brackets, necessitating a **reassessment of salary structures** for improved retention.

- **Discovery #2:** Employee **attrition peaks at 2 training sessions** and declines with continued training, with the **highest rates at 2 (6.67%)** and **3 sessions (4.69%)**. This indicates a critical turning point in retention. Employees in early training stages may have **high expectations** that, if unmet, lead to turnover. Completing **4+ training sessions** may result in **promotions or salary increases**, incentivizing retention. **Early training programs** should include **career progression, mentorship, and growth incentives** to reduce early attrition. Providing **monetary incentives and role advancements** tied to training milestones can also enhance retention.

- **Discovery #3:** The highest attrition rates are among **Interns (143)** and **Junior-level employees (52)**, with the **25-34 age group** showing the **highest attrition rate at 7.62%**. As **Job Level increases**, attrition decreases, though younger employees exhibit higher turnover expectations. Entry Level employees may leave if their **career advancement expectations** are unmet. Focusing retention strategies on interns and Junior Level workers with **clear growth opportunities** is essential. Additionally, offering **personalized career development plans** and **mentorship programs** for younger employees can improve retention, especially for **high-performing individuals** in lower job levels.
  
## Lessons Learned

**Prioritizing data integrity** is crucial for deriving **accurate insights** and understanding **correlations** within the dataset. A clear comprehension of each **field name** and its associated **values** contributes to the overall **quality** of the data. Identifying **discrepancies** among values is essential for maintaining data integrity, which in turn ensures **high-quality recommendations**.

## Reccomendation

1. **Enhance Compensation Strategy**
    - **Action**: Conduct **compensation benchmarking** against industry standards to adjust salary offerings, especially for entry-level roles and employees in the **25-34 age group**.
    - **Expected Outcome**: Attract and retain top talent, ensuring salaries are competitive within the market.

2. **Build Comprehensive Career Development Programs**
    - **Action**: Develop **personalized career growth plans**, focusing on **mentorship** and **skill development programs** for early career employees (Interns and Junior level).
    - **Expected Outcome**: Improved job satisfaction, increased employee loyalty, and a reduced turnover rate among younger, early career employees.

3. **Create Retention Strategies for High Performers**
    - **Action**: Identify high-performing employees in lower levels and create retention incentives like **tailored advancement opportunities**, **recognition programs**, and **performance-based rewards**.
    - **Expected Outcome**: Enhanced engagement and retention of key talent, leading to a more stable workforce and improved organizational productivity.

4. **Work-Life Balance Initiatives for Single Employees**
    - **Action**: Review and enhance work-life balance policies, including flexible work schedules and telecommuting options, especially for single employees in entry-level roles.
    - **Expected Outcome**: Improve job satisfaction and reduce turnover by addressing the specific needs of this group.

## Limitations

The analysis was limited by the presence of **data inaccuracies** and **exclusions** in the dataset.

**Data Inaccuracies & Exclusions**: Some records contained inaccuracies, leading to their exclusion from the analysis. This particularly affected insights related to **employee income trends**, potentially limiting a more comprehensive understanding of salary’s impact on attrition. However, despite these exclusions, the remaining data provided **valuable insights** for addressing the business problem.

**External Factors Not Considered**: The dataset did not account for **broader economic conditions, industry trends, or internal organizational changes** during the study period. Factors such as **market demand for specific roles** or **competitive salary benchmarks** could have influenced employee attrition beyond what was captured in the internal data.

Implementing these data considerations could have enabled a better understanding of employee performance and improved talent retention.

<Br>

---

## Further Exploration

- **[Interactive Tableau Dashboard](https://public.tableau.com/app/profile/aileen.q/viz/HREmployeeAttritionPerformance/Dashboard2?publish=yes):** Explore the visualizations and analysis interactively on Tableau Public.
- **[Interactive Tableau Dashboard](https://public.tableau.com/app/profile/aileen.q/viz/HREmployeeAttritionPerformance/Dashboard2?publish=yes){:target="_blank"}:** Explore the visualizations and analysis interactively on Tableau Public.
  
