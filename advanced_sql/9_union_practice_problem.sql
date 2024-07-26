-- Practice Problem 1
WITH q1_jobs AS (
    SELECT job_id, job_title_short, company_id, job_location, salary_year_avg
    FROM january_job
    UNION
    SELECT job_id, job_title_short, company_id, job_location, salary_year_avg
    FROM february_job
    UNION
    SELECT job_id, job_title_short, company_id, job_location, salary_year_avg
    FROM march_job
)
SELECT 
    a.job_title_short,
    c.skills,
    c.type
FROM q1_jobs a
LEFT JOIN skills_job_dim b ON a.job_id = b.job_id
LEFT JOIN skills_dim c ON b.skill_id = c.skill_id
WHERE a.salary_year_avg > 70000
ORDER BY a.job_id


-- Practice Problem
SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE,
    salary_year_avg
FROM (
    SELECT *
    FROM january_job
    UNION ALL
    SELECT * 
    FROM february_job
    UNION ALL
    SELECT * 
    FROM march_job
) AS quarter1_job_postings
WHERE 
    salary_year_avg > 70000
    AND job_title_short = 'Data Analyst'
ORDER BY
    quarter1_job_postings.salary_year_avg DESC  