SELECT
    job_id,
    salary_year_avg,
    CASE
        WHEN salary_year_avg IS NULL THEN 'Not Defined'
        WHEN salary_year_avg < 100000 THEN 'Low'
        WHEN salary_year_avg BETWEEN 100000 AND 150000 THEN 'Standard'
        ELSE 'High'
    END AS salary_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg ASC
LIMIT 100;


SELECT salary_year_avg 
FROM job_postings_fact 
ORDER BY 
salary_year_avg ASC;