-- Most in-demand skills for Data Analyst Jobs

SELECT 
    skills,
    COUNT(b.job_id) AS demand_count
FROM 
    job_postings_fact a
INNER JOIN 
    skills_job_dim b ON a.job_id = b.job_id
INNER JOIN 
    skills_dim c ON b.skill_id = c.skill_id 
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY 
    demand_count DESC
LIMIT 5


/*
[
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]
*/