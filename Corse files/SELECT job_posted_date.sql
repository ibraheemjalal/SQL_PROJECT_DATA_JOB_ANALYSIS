SELECT job_posted_date
FROM job_postings_fact
LIMIT 10; 

SELECT '2023-03-19' ::DATE;

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date 
FROM
    job_postings_fact
ORDER BY 
    job_posted_date::DATE DESC;

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'
FROM
    job_postings_fact;

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT (MONTH FROM job_posted_date) AS date_month
FROM
    job_postings_fact;

SELECT
	COUNT(job_id) as job_posted_count,
	EXTRACT(MONTH FROM job_posted_date) as job_posted_month
FROM
	job_postings_fact
WHERE
	job_title_short = 'Data Analyst'
GROUP BY
  job_posted_month
ORDER BY
  job_posted_count DESC;
    
    