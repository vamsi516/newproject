CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    department TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    salary DECIMAL(10, 2) NOT NULL,
    hire_date DATE NOT NULL
);

INSERT INTO employees (employee_id, first_name, last_name, department, email, salary, hire_date)
VALUES
    (1, 'Ava', 'Patel', 'Engineering', 'ava.patel@example.com', 92000.00, '2022-04-18'),
    (2, 'Noah', 'Kim', 'Human Resources', 'noah.kim@example.com', 68000.00, '2021-09-06'),
    (3, 'Mia', 'Garcia', 'Finance', 'mia.garcia@example.com', 74500.00, '2023-01-23');

CREATE TABLE employee_company_details (
    employee_id INTEGER PRIMARY KEY,
    company_name TEXT NOT NULL,
    job_title TEXT NOT NULL,
    work_location TEXT NOT NULL,
    employment_type TEXT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO employee_company_details (employee_id, company_name, job_title, work_location, employment_type)
VALUES
    (1, 'Northstar Labs', 'Senior Software Engineer', 'Seattle', 'Full-time'),
    (2, 'BrightPath Health', 'People Operations Specialist', 'Austin', 'Full-time'),
    (3, 'Cedar & Stone Finance', 'Financial Analyst', 'Chicago', 'Contract');

-- Employee company report
CREATE TABLE employee_company_report AS
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department,
    e.email,
    e.salary,
    e.hire_date,
    c.company_name,
    c.job_title,
    c.work_location,
    c.employment_type
FROM employees AS e
INNER JOIN employee_company_details AS c
    ON e.employee_id = c.employee_id;

SELECT *
FROM employee_company_report
-- ORDER BY employee_id;
