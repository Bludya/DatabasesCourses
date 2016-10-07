SELECT 	first_name, last_name, 	e.department_id
  FROM 	employees AS e
  JOIN	(SELECT	department_id, AVG(salary) AS salary
  		   FROM employees
  		  GROUP	BY	department_id
  		) AS avg_salary
  	ON	e.department_id = avg_salary.department_id
   AND	e.salary > avg_salary.salary
 ORDER	BY e.department_id
 LIMIT	10