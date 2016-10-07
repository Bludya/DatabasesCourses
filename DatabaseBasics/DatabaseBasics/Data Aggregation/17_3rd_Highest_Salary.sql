SELECT	max_salary.department_id, MAX(max_salary.salary) AS third_max_salary
  FROM	employees AS max_salary
  JOIN	(SELECT	e.department_id, MAX(e.salary) AS salary
		   FROM	employees AS e
		   JOIN	(SELECT department_id, MAX(salary) salary
			     FROM employees 
			     GROUP BY department_id)	AS max_salary
		     ON	e.department_id = max_salary.department_id
		    AND	e.salary < max_salary.salary
		  GROUP	BY	department_id) AS second_max
     ON	max_salary.department_id = second_max.department_id
    AND	max_salary.salary < second_max.salary
  GROUP	BY	department_id