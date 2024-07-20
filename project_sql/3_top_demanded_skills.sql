-- Most in-demand skills Data Analyst

SELECT 
    skills,
    COUNT(d.job_id) AS demand_count
FROM 
    job_postings_fact c
INNER JOIN 
    skills_job_dim d ON c.job_id = d.job_id
INNER JOIN 
    skills_dim e ON d.skill_id = e.skill_id 
GROUP BY
    skills
LIMIT 5