--Queries file
--1. List first name, last name, sex and salary of each employee
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM Employees
JOIN Salaries ON
Employees.emp_no = Salaries.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
--Copilot suggested the extract function
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3. List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
SELECT employees.first_name, employees.last_name, departments.dept_no, departments.dept_name
FROM employees
JOIN dept_manager ON
employees.emp_no = dept_manager.emp_no
JOIN departments ON
departments.dept_no = dept_manager.dept_no;

--4. List the department number for each employee along with that 
--employee’s employee number, last name, first name, and department name.
SELECT departments.dept_no, employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
JOIN departments ON
departments.dept_no = dept_emp.dept_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules
--and whose last name begins with the letter B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no, employees.first_name, employees.last_name
FROM employees
JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--8. List the frequency counts, in descending order, 
--of all the employee last names (that is, how many employees share each last name).
SELECT employees.last_name
FROM employees
GROUP BY employees.last_name
ORDER BY employees.last_name DESC;