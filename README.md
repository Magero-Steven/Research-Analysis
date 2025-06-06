# Statistical Hypothesis Testing for Research and Monitoring & Evaluation Projects

![WhatsApp Image 2025-04-29 at 12 33 30_6325c344](https://github.com/user-attachments/assets/e46c5489-1af0-4726-b27d-3e2084e536d5)


---
**Project:** Analysis of a Synthetic Dataset based on the study *"Gender Inclusive Approaches for Leishmaniasis Treatment in West Pokot County"*.

This repository demonstrates common statistical tests used in **Monitoring & Evaluation (M&E)** and **Research** using Python, featuring a **randomly generated synthetic dataset** simulating real-world health research conditions.

---
### Tools

- Excel-Data cleaning
- MySQL - Analyis
- JuypterNotebooks
- Tableau - Dashbords/Reports

--- 
## 📚 Table of Contents
- [Project Overview](#project-overview)
  
- [Synthetic Dataset](#synthetic-dataset)
  
- [Statistical Tests Included](#statistical-tests-included)
  
   [1. Independent T-Test](#1-independent-t-test)
  
   [2. Chi-Square Test](#2-chi-square-test)
  
   [3. Pearson Correlation](#3-pearson-correlation)
  
   [4. ANOVA (Analysis of Variance)](#4-anova-analysis-of-variance)
  
   [5. Paired T-Test (Pre-Post Intervention)](#5-paired-t-test-pre-post-intervention)
  
   [6. Mann-Whitney U Test](#6-mann-whitney-u-test)
  
   [7. Kruskal-Wallis Test](#7-kruskal-wallis-test)
  
   [8. Logistic Regression (Binary Outcomes)](#8-logistic-regression-binary-outcomes)
  
- [Visualizations](#visualizations)
  
- [Installation](#installation)
  
- [Usage](#usage)
  
- [License](#license)
---

## 📖 Project Overview
This project simulates real-world hypothesis testing typically conducted during field evaluations, project assessments, and health research interventions.

Using Python libraries (`pandas`, `scipy.stats`, `statsmodels`, `seaborn`, `matplotlib`), we explore various statistical tests and visualize key insights to inform decision-making.

---

## 🗂️ Synthetic Dataset

- File: `/data/west_pokot_leishmaniasis_study.csv`
- Sample size: 200 participants
- Variables:
  - `participant_id`
  - `gender` (Male/Female)
  - `knowledge_score_pre` (Before awareness sessions)
  - `knowledge_score_post` (After awareness sessions)
  - `attended_awareness_sessions` (1 to 5)
  - `diagnosis_delay_days`
  - `treatment_choice` (Public Health Center / Traditional Healer)
  - `treatment_success` (1 = Success, 0 = Failure)

---
## Expolatory Data Analysis
Snippets of The data in MySql Workbench.
---
   1. Data Preview
``` sql
SHOW TABLES;
select *
from West_pokot_leishmaniasis_study
limit 100;
```
  2. Check for Missing Data
```sql
SELECT *
FROM West_pokot_leishmaniasis_study
WHERE 
    participant_id IS NULL OR
    gender IS NULL OR
    knowledge_score_pre IS NULL OR
    knowledge_score_post IS NULL OR
    attended_awareness_sessions IS NULL OR
    diagnosis_delay_days IS NULL OR
    treatment_choice IS NULL OR
    treatment_success IS NULL;
```
  
  3. Compare Average Knowledge Scores (Pre vs Post Awareness Sessions)
``` sql
SELECT 
    AVG(knowledge_score_pre) AS avg_knowledge_score_pre,
    AVG(knowledge_score_post) AS avg_knowledge_score_post
FROM 
    West_pokot_leishmaniasis_study;
```

  4. Correlation Between Awareness Sessions and Treatment Success

```sql
SELECT 
    attended_awareness_sessions,
    AVG(treatment_success) AS treatment_success_rate
FROM 
   West_pokot_leishmaniasis_study
GROUP BY 
    attended_awareness_sessions;
```
## 🧪 Statistical Tests Included

### 1. Independent T-Test
- Compare mean diagnosis delay days between **males** and **females**.
- Function used: `ttest_ind()`
- Independent T-Test: Compare diagnosis delay days between males and females;
  
  For Example
---
  
```python
male_delay = df[df['gender'] == 'Male']['diagnosis_delay_days']
female_delay = df[df['gender'] == 'Female']['diagnosis_delay_days']
t_stat, p_val = stats.ttest_ind(male_delay, female_delay)
print("\n1. Independent T-Test:")
print(f"T-Statistic = {t_stat:.4f}, P-Value = {p_val:.4f}")
```

### 2. Chi-Square Test
- Analyze relationship between **gender** and **choice of treatment facility**.
- Function used: `chi2_contingency()`

### 3. Pearson Correlation
- Measure relationship between **study hours** (attendance) and **exam scores** (knowledge scores).
- Function used: `pearsonr()`

### 4. ANOVA (Analysis of Variance)
- Compare **mean knowledge scores** among different groups based on **number of sessions attended**.
- Function used: `f_oneway()`

### 5. Paired T-Test (Pre-Post Intervention)
- Measure improvement in **knowledge scores** before and after awareness sessions.
- Function used: `ttest_rel()`

### 6. Mann-Whitney U Test
- Compare **median diagnosis delays** between genders when assumptions of normality are violated.
- Function used: `mannwhitneyu()`

### 7. Kruskal-Wallis Test
- Test for differences in **diagnosis delay** among participants attending varying numbers of sessions.
- Function used: `kruskal()`

### 8. Logistic Regression (Binary Outcomes)
- Predict **treatment success** based on the number of awareness sessions attended.
- Function used: `Logit()` from `statsmodels`

---

## 📊 Visualizations

All notebooks include visualizations such as:

- 📈 **Histograms** (distribution of diagnosis delay days)
- 📊 **Boxplots** (group comparisons by gender)
- 📉 **Scatter Plots** (correlations between sessions attended and knowledge gain)
- 🗂️ **Bar Charts** (treatment success rates)

  ![image](https://github.com/user-attachments/assets/10f2f947-679f-40c3-9a1f-5cf4abfd9b05)


Libraries used:
- `matplotlib`
- `seaborn`
- `Tableau public`
  
  ### Dashboard
  [link](https://public.tableau.com/views/WestPokotFamilyPlaniningUptakeDummyDatavisualization/WestPokotUptakeofFamilyPlanningServices?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---

## ⚙️ Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/statistical-hypothesis-testing.git
cd statistical-hypothesis-testing

