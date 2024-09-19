--union and practice problem 8

-- Get jobs and companies from January
SELECT 
	job_title_short,
	company_id,
	job_location
FROM
	january_jobs

UNION ALL-- combine the two tables 

-- Get jobs and companies from February 
SELECT 
	job_title_short,
	company_id,
	job_location
FROM
	february_jobs

UNION ALL -- combine another table

-- Get jobs and companies from March
SELECT 
	job_title_short,
	company_id,
	job_location
FROM
	march_jobs

--problem 8

SELECT
	job_title_short,
	job_location,
	job_via,
	job_posted_date::DATE,
    salary_year_avg
FROM

-- Gets all rows from January, February, and March job postings 
    (
		SELECT *
		FROM january_jobs
		UNION ALL
		SELECT *
		FROM february_jobs
		UNION ALL 
		SELECT *
		FROM march_jobs
	) AS quarter1_job_postings 
WHERE
	quarter1_job_postings.salary_year_avg > 70000 AND
	job_postings.job_title_short = 'Data Analyst'
ORDER BY
	quarter1_job_postings.salary_year_avg DESC

SELECT
	quarter1_job_postings.job_title_short,
	quarter1_job_postings.job_location,
	quarter1_job_postings.job_via,
	quarter1_job_postings.job_posted_date::DATE
FROM
-- Gets all rows from January, February, and March job postings 
	(
		SELECT *
		FROM january_jobs
		UNION ALL
		SELECT *
		FROM february_jobs
		UNION ALL 
		SELECT *
		FROM march_jobs
	) AS quarter1_job_postings 
WHERE
	quarter1_job_postings.salary_year_avg > 70000
	--AND job_postings.job_title_short = 'Data Analyst'
ORDER BY
	quarter1_job_postings.salary_year_avg DESC