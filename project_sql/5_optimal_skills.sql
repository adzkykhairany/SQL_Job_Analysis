-- Most optimal skills to learn for Data Analyst job

-- With CTE
WITH demanded_skills AS (
    SELECT 
        c.skill_id,
        c.skills,
        COUNT(b.job_id) AS demand_count
    FROM 
        job_postings_fact a
    INNER JOIN 
        skills_job_dim b ON a.job_id = b.job_id
    INNER JOIN 
        skills_dim c ON b.skill_id = c.skill_id 
    WHERE
        a.job_title_short = 'Data Analyst'
        AND a.salary_year_avg IS NOT NULL
        AND a.job_work_from_home = TRUE
    GROUP BY
        c.skill_id
), top_paying_skills AS (
    SELECT 
        b.skill_id,
        ROUND(AVG(a.salary_year_avg), 0) AS salary_avg
    FROM 
        job_postings_fact a
    INNER JOIN 
        skills_job_dim b ON a.job_id = b.job_id
    INNER JOIN 
        skills_dim c ON b.skill_id = c.skill_id 
    WHERE
        a.job_title_short = 'Data Analyst'
        AND a.salary_year_avg IS NOT NULL
        AND a.job_work_from_home = TRUE
    GROUP BY
        b.skill_id
)
SELECT
    d.skills,
    demand_count,
    salary_avg
FROM demanded_skills d
INNER JOIN top_paying_skills e ON d.skill_id = e.skill_id
WHERE demand_count > 10
ORDER BY
    salary_avg DESC,
    demand_count DESC 
LIMIT 25

-- More concise 
SELECT
    c.skills,
    COUNT(a.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) AS salary_avg
FROM job_postings_fact a
INNER JOIN skills_job_dim b ON a.job_id = b.job_id
INNER JOIN skills_dim c ON b.skill_id = c.skill_id 
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY c.skill_id
HAVING COUNT(a.job_id) > 10
ORDER BY
    salary_avg DESC,
    demand_count DESC 
LIMIT 25