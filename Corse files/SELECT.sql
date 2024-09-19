SELECT 
	job_id,
	job_location,
  CASE
	  WHEN job_location = 'Anywhere' THEN 'Remote'
    WHEN job_location = 'Boston, MA' THEN 'Local'
	  ELSE 'Onsite'
  END AS location_category
FROM job_postings_fact;

SELECT 
  CASE
	  WHEN job_location = 'Anywhere' THEN 'Remote'
    WHEN job_location = 'Boston, MA' THEN 'Local'
	  ELSE 'Onsite'
  END AS location_category,
  COUNT(job_id) AS number_of_jobs 
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY 
    location_category
ORDER BY    
    number_of_jobs DESC;