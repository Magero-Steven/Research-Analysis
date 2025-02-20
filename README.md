# Statistical Hypothesis Testing in Python

## Overview
This repository contains Python implementations of key **statistical hypothesis tests** using the `scipy.stats` module. The included tests help analyze relationships and differences between datasets in various scenarios.

## Tests Included
### 1. **Independent T-Test**
- Compares the means of two independent groups.
- Example: Test scores from two different groups of students.
- Uses `ttest_ind()` function.

```python
import scipy.stats as stats

group1 = [85, 88, 90, 92, 94, 96, 98, 99]
group2 = [80, 82, 85, 87, 89, 90, 92, 95]

t_stat, p_value = stats.ttest_ind(group1, group2)

print(f"T-statistic: {t_stat:.4f}")
print(f"P-value: {p_value:.4f}")

If p-value < 0.05, reject the null hypothesis → significant difference exists.
Otherwise, fail to reject the null hypothesis.


Chi-Square Test
Determines if there is a relationship between categorical variables.
Example: Preference survey of males vs. females.
Uses chi2_contingency() function.
python
Copy
Edit
import scipy.stats as stats
import numpy as np

observed = np.array([[30, 20], [25, 25]])

chi2_stat, p_value, dof, expected = stats.chi2_contingency(observed)

print(f"Chi-Square Statistic: {chi2_stat:.4f}")
print(f"P-value: {p_value:.4f}")
📌 Interpretation:

If p-value < 0.05, reject the null hypothesis → significant relationship exists.
Pearson Correlation Test
Measures the strength of a linear relationship between two variables.
Example: Study hours vs. Exam scores.
Uses pearsonr() function.
python
Copy
Edit
study_hours = [2, 3, 4, 5, 6, 7, 8, 9, 10]
exam_scores = [50, 55, 60, 65, 70, 75, 80, 85, 90]

corr_coeff, p_value = stats.pearsonr(study_hours, exam_scores)

print(f"Correlation Coefficient: {corr_coeff:.4f}")
print(f"P-value: {p_value:.4f}")
📌 Interpretation:

If p-value < 0.05, reject the null hypothesis → significant correlation exists.

ANOVA (Analysis of Variance)
Compares means of three or more groups.
Example: Exam scores from three different teaching methods.
Uses f_oneway() function.
python
Copy
Edit
method_1 = [85, 88, 90, 92, 94, 96, 98, 99]
method_2 = [80, 82, 85, 87, 89, 90, 92, 95]
method_3 = [70, 75, 78, 80, 82, 85, 88, 90]

f_stat, p_value = stats.f_oneway(method_1, method_2, method_3)

print(f"F-statistic: {f_stat:.4f}")
print(f"P-value: {p_value:.4f}")
📌 Interpretation:

If p-value < 0.05, reject the null hypothesis → at least one group differs significantly.
