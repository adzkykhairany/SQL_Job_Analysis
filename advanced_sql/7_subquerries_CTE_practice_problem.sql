-- Practice Problem 1 with subqueries = Top 5 skills most frequently mentioned
SELECT 
    skills
FROM 
    skills_dim
JOIN (
    SELECT 
        skill_id,
        COUNT(*) AS total_skills
    FROM
        skills_job_dim
    GROUP BY
        skill_id
    ORDER BY
        total_skills DESC
    LIMIT 5
) AS skills_count ON skills_dim.skill_id = skills_count.skill_id;

-- Practice Problem 1 CTE = Top 5 skills most frequently mentioned
WITH skills_count AS (
    SELECT 
        skill_id,
        COUNT(*) AS total_skills
    FROM
        skills_job_dim
    GROUP BY
        skill_id
)
SELECT
    skills
FROM
    skills_dim
LEFT JOIN skills_count ON skills_dim.skill_id = skills_count.skill_id
ORDER BY total_skills DESC
LIMIT 5;

-- Practice Problem 2 = Company size category
SELECT
    job_counts.company_id,
    job_counts.name,
    CASE
        WHEN job_counts.job_count < 10 THEN 'Small'
        WHEN job_counts.job_count BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS size_category
FROM (
    SELECT 
        cd.company_id, 
        cd.name,
        COUNT(jpf.company_id) AS job_count
    FROM company_dim cd
    JOIN job_postings_fact jpf ON cd.company_id = jpf.company_id
    GROUP BY cd.company_id, cd.name
) AS job_counts;


-- Practice Problem 
WITH remote_job_skill AS (
    SELECT
        skill_id,
        COUNT(*) AS skills_count
    FROM
        skills_job_dim a
    INNER JOIN
        job_postings_fact b ON a.job_id = b.job_id
    WHERE
        job_work_from_home = true 
        AND job_title_short = 'Data Analyst'
    GROUP BY
        skill_id
)
SELECT 
    c.skill_id, 
    skills AS skill_name,
    skills_count
FROM remote_job_skill c
INNER JOIN skills_dim d ON c.skill_id = d.skill_id
ORDER BY skills_count DESC
LIMIT 5