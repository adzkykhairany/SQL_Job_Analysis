-- Top skills based on salary

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS salary_avg
FROM 
    job_postings_fact a
INNER JOIN 
    skills_job_dim b ON a.job_id = b.job_id
INNER JOIN 
    skills_dim c ON b.skill_id = c.skill_id 
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY 
    salary_avg DESC
LIMIT 25

/*
Insights into Top Paying Skills for Data Analysts
1. Big Data Processing and Advanced Analytics: PySpark, DataRobot, and Databricks are essential for big data processing, advanced machine learning platforms, and unified analytics.
2. DevOps and Automation Tools: Bitbucket, Jenkins, and Kubernetes highlight the importance of collaboration, version control, automated deployment, and scalable containerized applications.
3. Core Programming and Data Science Libraries: Pandas, Numpy, and Scikit-learn reflect the foundational role these libraries play in data manipulation, numerical computing, and machine learning.

[
  {
    "skills": "pyspark",
    "salary_avg": "208172"
  },
  {
    "skills": "bitbucket",
    "salary_avg": "189155"
  },
  {
    "skills": "couchbase",
    "salary_avg": "160515"
  },
  {
    "skills": "watson",
    "salary_avg": "160515"
  },
  {
    "skills": "datarobot",
    "salary_avg": "155486"
  },
  {
    "skills": "gitlab",
    "salary_avg": "154500"
  },
  {
    "skills": "swift",
    "salary_avg": "153750"
  },
  {
    "skills": "jupyter",
    "salary_avg": "152777"
  },
  {
    "skills": "pandas",
    "salary_avg": "151821"
  },
  {
    "skills": "elasticsearch",
    "salary_avg": "145000"
  },
  {
    "skills": "golang",
    "salary_avg": "145000"
  },
  {
    "skills": "numpy",
    "salary_avg": "143513"
  },
  {
    "skills": "databricks",
    "salary_avg": "141907"
  },
  {
    "skills": "linux",
    "salary_avg": "136508"
  },
  {
    "skills": "kubernetes",
    "salary_avg": "132500"
  },
  {
    "skills": "atlassian",
    "salary_avg": "131162"
  },
  {
    "skills": "twilio",
    "salary_avg": "127000"
  },
  {
    "skills": "airflow",
    "salary_avg": "126103"
  },
  {
    "skills": "scikit-learn",
    "salary_avg": "125781"
  },
  {
    "skills": "jenkins",
    "salary_avg": "125436"
  },
  {
    "skills": "notion",
    "salary_avg": "125000"
  },
  {
    "skills": "scala",
    "salary_avg": "124903"
  },
  {
    "skills": "postgresql",
    "salary_avg": "123879"
  },
  {
    "skills": "gcp",
    "salary_avg": "122500"
  },
  {
    "skills": "microstrategy",
    "salary_avg": "121619"
  }
]
*/