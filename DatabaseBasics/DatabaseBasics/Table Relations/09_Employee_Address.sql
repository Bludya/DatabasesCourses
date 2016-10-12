SELECT	employee_id, job_title, e.address_id, a.address_text
  FROM	employees as e
  LEFT 	OUTER	JOIN addresses as a
    ON	e.address_id = a.address_id
 ORDER	BY address_id
 LIMIT	5