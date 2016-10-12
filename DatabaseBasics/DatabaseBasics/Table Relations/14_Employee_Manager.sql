
SELECT 	e.employee_id, e.first_name, e.manager_id, m.first_name AS manager_name
  FROM	employees AS e, employees AS m
 WHERE	e.manager_id IN(3,7)
   AND	m.employee_id = e.manager_id
 ORDER	BY	e.employee_id ASC