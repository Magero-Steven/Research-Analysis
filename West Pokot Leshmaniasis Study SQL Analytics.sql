-- Load the Data onto the Schema;
use data_projects;

-- Import the  csv file
USE data_projects;

-- Data Preview
SHOW TABLES;
select *
from West_pokot_leishmaniasis_study
limit 100;

-- Check for Missing Data
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
    
    -- Validate a Specific Record
SELECT *
FROM West_pokot_leishmaniasis_study
WHERE participant_id = 'P_001';

-- 1. Compare Average Knowledge Scores (Pre vs Post Awareness Sessions)
SELECT 
    AVG(knowledge_score_pre) AS avg_knowledge_score_pre,
    AVG(knowledge_score_post) AS avg_knowledge_score_post
FROM 
    West_pokot_leishmaniasis_study;
    
-- 2. Correlation Between Awareness Sessions and Treatment Success
SELECT 
    attended_awareness_sessions,
    AVG(treatment_success) AS treatment_success_rate
FROM 
   West_pokot_leishmaniasis_study
GROUP BY 
    attended_awareness_sessions;
    
-- 3. Treatment Success by Treatment Choice
SELECT 
    treatment_choice,
    AVG(treatment_success) AS treatment_success_rate
FROM 
    West_pokot_leishmaniasis_study
GROUP BY 
    treatment_choice;
    
-- 4. Average Diagnosis Delay by Gender
SELECT 
    gender,
    AVG(diagnosis_delay_days) AS avg_diagnosis_delay_days
FROM 
     West_pokot_leishmaniasis_study
GROUP BY 
    gender;

-- 1. Identify Participants with Maximum Knowledge Improvement
SELECT 
    participant_id,
    gender,
    (knowledge_score_post - knowledge_score_pre) AS knowledge_improvement
FROM 
    West_pokot_leishmaniasis_study
ORDER BY 
    knowledge_improvement DESC
LIMIT 100;

-- Detect Outliers for Diagnosis Delay
SELECT 
    participant_id,
    diagnosis_delay_days
FROM 
    West_pokot_leishmaniasis_study
WHERE 
    diagnosis_delay_days > (SELECT AVG(diagnosis_delay_days) FROM West_pokot_leishmaniasis_study);

-- Treatment Success Rates by Diagnosis Delay Categories
SELECT
    CASE 
        WHEN diagnosis_delay_days <= 50 THEN 'Short Delay'
        WHEN diagnosis_delay_days BETWEEN 51 AND 150 THEN 'Moderate Delay'
        ELSE 'Long Delay'
    END AS delay_category,
    AVG(treatment_success) AS treatment_success_rate
FROM
    West_pokot_leishmaniasis_study
GROUP BY
    delay_category;
    
-- Gender and Treatment Choice Trends
SELECT 
    gender,
    treatment_choice,
    COUNT(*) AS participant_count
FROM 
    West_pokot_leishmaniasis_study
GROUP BY 
    gender, treatment_choice;




