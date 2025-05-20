-- Basic To Intermediate
--List all employees with their department name and city.
SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name,
    d.department_id,
    d.department_name
FROM employees e
JOIN departments d USING(department_id)
ORDER BY 
    employee_id;



-- Find all employees hired after January 1, 2020, sorted by hire date descending.
SELECT 
    employee_id, 
    first_name,
    last_name, 
    hire_date
FROM 
    employees
WHERE 
    hire_date > '2020-01-01'
ORDER BY 
    hire_date DESC;



--Show the total number of employees per department.
SELECT 
    d.department_id, 
    d.department_name, 
    COUNT(employee_id) AS employee_count
FROM 
    departments d
JOIN 
    employees e USING(department_id)
GROUP BY 
    department_id
ORDER BY 
    department_id;




-- Get the average salary per department and order the results by average salary descending.
SELECT 
    d.department_id, 
    d.department_name, 
    ROUND(AVG(salary), 0) AS avarage_salary_USD$
FROM 
    departments d
JOIN 
    employees e USING(department_id)
GROUP BY 
    department_id
ORDER BY 
    department_id;




--Find all projects that have not ended yet (end_date is NULL).
SELECT
    project_id,
    project_name
FROM projects
WHERE end_date IS NULL;




-- List all employees working on the project 'Apollo'.
SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    p.project_id, 
    p.project_name
FROM 
    projects p
JOIN 
    employee_projects ep USING(project_id)
JOIN 
    employees e ON ep.employee_id = e.employee_id 
WHERE 
    p.project_name = 'Apollo';




-- Find all employees who are assigned to more than one project.
SELECT 
    e.employee_id,
    e.first_name, 
    e.last_name, 
    COUNT(ep.project_id) AS project_count
FROM employees e
JOIN employee_projects ep USING(employee_id)
GROUP BY  
    e.employee_id, e.first_name, e.last_name
HAVING COUNT(ep.project_id) > 1;




-- Get all departments located in the USA.
SELECT 
    d.department_id,
    d.department_name, 
    l.city, 
    l.country 
FROM locations l
JOIN departments d USING(location_id)
WHERE country = 'USA';




--List projects with a budget over $500,000, showing project name and budget formatted as currency.
SELECT 
    project_id,
    project_name,
    TO_CHAR(budget, 'FM$999,999,999.00') AS budget
FROM 
    projects
WHERE 
    budget > 500000
ORDER BY 
    budget;




--Find employees whose last name starts with 'S'.
SELECT 
    employee_id, 
    first_name,
    last_name
FROM employees
WHERE last_name LIKE 'S%'
ORDER BY last_name;