SELECT 	department_id, MAX(salary)
  FROM 	employees
 GROUP	BY department_id
HAVING	MAX(salary) NOT BETWEEN 30000 AND 70000 