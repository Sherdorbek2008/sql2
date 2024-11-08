-- 1
CREATE TABLE IF NOT EXISTS departments (
    departments_id SERIAL PRIMARY KEY,
    department_name TEXT NOT NULL,
    departments_location TEXT
);

INSERT INTO departments (department_name, departments_location) VALUES
('Tarmoq xavfsizligi', 'Toshkent'),
('Serverlarni boshqarish', 'Andijon'),
('Dasturiy ta''minot', 'Farg''ona');
---------------------------------------------------------

CREATE TABLE IF NOT EXISTS employees (
    employees_id SERIAL PRIMARY KEY,
    employees_name TEXT NOT NULL,
    employees_position TEXT,
    departments_id INTEGER REFERENCES departments(departments_id)
);

INSERT INTO employees (employees_name, employees_position, departments_id) VALUES
('Toxir', 'junior', 1),
('Sobir', 'senior', 2),
('Jalil', 'Lead', 3);

SELECT employees_id, employees_position, department_name,
FROM employees
JOIN departments ON employees.departments_id = departments.departments_id;
-----------------------------------------------------------


CREATE TABLE IF NOT EXISTS projects (
    project_id SERIAL PRIMARY KEY,
    project_title TEXT NOT NULL,
    departments_id INTEGER REFERENCES departments(departments_id)
);


INSERT INTO projects (project_title, departments_id) VALUES
('Uzum', 1),
('Alisa', 2),
('CHAT GPT', 3);

SELECT project_id, project_title, department_name
FROM projects
JOIN departments ON projects.departments_id = departments.departments_id;
-------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,                   
    description TEXT NOT NULL,               
    project_id INTEGER REFERENCES projects(project_id),   
    employees_id INTEGER REFERENCES employees(employees_id) 
);

INSERT INTO tasks (description, project_id, employees_id DEFAULT NULL ) VALUES
('Tizimni sozlash vazifasi', 1, 1), 
('Alisa loyihasi uchun kodni ko''rib chiqish', 2, 2),  
('AI integratsiyasiga oid tadqiqot', 3, 3);

SELECT 
    tasks.description, 
    projects.project_title, 
    employees.employees_name
FROM tasks
JOIN projects ON tasks.project_id = projects.project_id 
JOIN employees ON tasks.employees_id = employees.employees_id;

----------------------------------------------------------------------
-- 2
ALTER TABLE employes
ADD COLUMN email TEXT DEFAULT 'toxir@gmail.com';
select * from employes;

ALTER TABLE tasks
ALTER COLUMN description TYPE VARCHAR(255);
select*from tasks
---------------------------------------------------------
-- 3
UPDATE employees SET employees_position = 'Senior Developer' WHERE employees_id = 1;
select * from employees;

UPDATE projects SET project_title = 'New Project Title' WHERE project_id=2;
SELECT * FROM projects
------------------------------------------
-- 4
DELETE FROM projects WHERE project_id = 3;
select  * from projects;

DELETE FROM employees WHERE employees_id = 4;
select * from 











