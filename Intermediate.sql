-- Intermediate to Advanced
-- Calculate the total budget of projects assigned to each employee.
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    SUM(p.budget) as project_budget
FROM 
    employees e
JOIN 
    employee_projects ep USING(employee_id)
JOIN 
    projects p USING(project_id)
GROUP BY
    e.employee_id, e.first_name, e.last_name;




-- List all employees with the number of projects assigned to them
SELECT 
    e.employee_id,
    e.first_name, 
    e.last_name, 
    COUNT(ep.project_id) AS project_count
FROM employees e
LEFT JOIN employee_projects ep USING(employee_id)
GROUP BY  
    e.employee_id, e.first_name, e.last_name;




-- Find the top 3 highest-paid employees per department

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    RANK() OVER (ORDER BY e.salary DESC) AS salary_rank
FROM employees e
LIMIT 3;




-- Find all employees who have worked on projects that started before they were hired.
SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
JOIN employee_projects ep USING(employee_id)
JOIN projects p USING(project_id)
WHERE e.hire_date < p.start_date;




-- Show the average project budget by country
SELECT 
    l.country,
    to_char(ROUND(AVG(p.budget), 0), 'FM$999,999,999') AS avg_budget_usd
FROM projects p
JOIN employee_projects ep ON ep.project_id = p.project_id
JOIN employees e ON e.employee_id = ep.employee_id
JOIN departments d ON d.department_id = e.department_id
JOIN locations l ON l.location_id = d.location_id
GROUP BY
    l.country;




-- Get the longest-running project(s)
SELECT 
    project_id, 
    COALESCE((end_date - start_date)::TEXT, 'Ongoing') AS duration
FROM 
    projects
ORDER BY end_date ASC NULLS LAST




--Using a CTE, calculate cumulative salaries per department ordered by hire date.
SELECT 
    employee_id,
    salary,
    SUM(salary) OVER (ORDER BY employee_id) AS cumulative_salary
FROM employees;

