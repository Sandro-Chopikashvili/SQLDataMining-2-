-- Create tables
CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    country TEXT NOT NULL
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name TEXT NOT NULL,
    location_id INT REFERENCES locations(location_id)
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    department_id INT REFERENCES departments(department_id),
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    budget DECIMAL(12, 2)
);

CREATE TABLE employee_projects (
    employee_id INT REFERENCES employees(employee_id),
    project_id INT REFERENCES projects(project_id),
    assigned_date DATE NOT NULL,
    PRIMARY KEY (employee_id, project_id)
);

-- Insert sample data
INSERT INTO locations (city, country) VALUES
('New York', 'USA'),
('San Francisco', 'USA'),
('Berlin', 'Germany'),
('Tokyo', 'Japan'),
('London', 'UK');

INSERT INTO departments (department_name, location_id) VALUES
('Engineering', 1),
('Marketing', 2),
('Sales', 3),
('HR', 4),
('Finance', 5);

INSERT INTO employees (first_name, last_name, department_id, hire_date, salary) VALUES
('Alice', 'Smith', 1, '2020-01-15', 90000.00),
('Bob', 'Johnson', 1, '2019-03-22', 95000.00),
('Charlie', 'Lee', 2, '2021-07-01', 60000.00),
('Diana', 'Brown', 3, '2018-11-30', 70000.00),
('Evan', 'Davis', 4, '2022-02-20', 55000.00),
('Fiona', 'Wilson', 5, '2017-09-10', 80000.00);

INSERT INTO projects (project_name, start_date, end_date, budget) VALUES
('Apollo', '2021-01-01', '2021-12-31', 1000000.00),
('Hermes', '2022-03-01', '2022-11-30', 750000.00),
('Zeus', '2023-06-15', NULL, 500000.00),
('Athena', '2020-05-20', '2021-05-20', 300000.00),
('Poseidon', '2022-08-01', NULL, 200000.00);

INSERT INTO employee_projects (employee_id, project_id, assigned_date) VALUES
(1, 1, '2021-01-15'),
(2, 1, '2021-02-01'),
(3, 2, '2022-03-15'),
(1, 3, '2023-06-20'),
(4, 4, '2020-05-25'),
(5, 5, '2022-08-10'),
(2, 3, '2023-07-01'),
(6, 1, '2021-04-01');













