/*
Write a query to find the average salary both yearly (salary_year_avg) and hourly
(salary_hour_avg) for job postings that were posted after June 1, 2023. Group the results by
job schedule type.
*/

SELECT
    AVG(salary_year_avg) AS avg_salary_year,
    AVG(salary_hour_avg) AS avg_salary_hour,
    job_schedule_type AS schedule_type
FROM
    job_postings_fact
WHERE
    job_posted_date::DATE > '2023-06-01'
GROUP BY
    schedule_type;

/*
Write a query to count the number of job postings for each month in 2023, adjusting the
job_posted_date to be in 'America/New_York' time zone before extracting (hint) the month.
Assume the job_posted_date is stored in UTC. Group by and order by the month
*/

SELECT
    COUNT(job_id) job_count,
    EXTRACT(MONTH FROM (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST')) AS month
FROM
    job_postings_fact
WHERE 
    EXTRACT(YEAR FROM (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST')) = 2023
GROUP BY
    month
ORDER BY
    month;

/*
Write a query to find companies (include company name) that have posted jobs offering health 
insurance, where these postings were made in the second quarter of 2023. Use the date extraction 
to filter by quarter.
*/

SELECT DISTINCT
    a.name
FROM
    company_dim a
JOIN
    job_postings_fact b ON a.company_id = b.company_id
WHERE
    b.job_health_insurance IS TRUE
    AND EXTRACT(QUARTER FROM job_posted_date) = 2;


-- Create a new table from an existing table 
-- January
CREATE TABLE january_job AS
    SELECT * 
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE february_job AS
    SELECT * 
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_job AS
    SELECT * 
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT job_posted_date
FROM march_job;