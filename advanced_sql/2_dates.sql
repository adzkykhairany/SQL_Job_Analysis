-- 1.Converts to a date format
SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM
    job_postings_fact
LIMIT 5;

-- 2.Converts a timestamp to a specified time zone
SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'AS date_time
FROM
    job_postings_fact
LIMIT 5;

-- 3.Gets specific date parts 
SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS column_month,
    EXTRACT(YEAR FROM job_posted_date) AS year_month
FROM
    job_postings_fact
LIMIT 5;

-- Analyzing job postings ternd from month to month
SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM   
    job_postings_fact
WHERE  
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    job_posted_count DESC;


SELECT
    job_id,
    salary_year_avg,
    salary_hour_avg,
    job_posted_date,
    job_schedule_type
FROM
    job_postings_fact
LIMIT 100;